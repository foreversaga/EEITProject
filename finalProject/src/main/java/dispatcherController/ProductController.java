package dispatcherController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cart.model.orderBean;
import cart.model.orderItem;
import cart.model.orderItemBean;
import cart.model.shoppingCart;
import checkout.service.orderService;
import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import product.model.productBean;
import product.service.productService;
import register.model.MemberBean;

@Controller
public class ProductController {
	@Autowired
	productService pService;
	@Autowired
	ServletContext context;
	@Autowired
	orderService oService;
	@Autowired
	SessionFactory factory;
//顯示商品頁面
	@RequestMapping(value = "/products/{pageNo}", method = RequestMethod.GET)
	public ModelAndView productsPage(HttpSession session, @PathVariable Integer pageNo, HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		ModelAndView mav = new ModelAndView("product/products");
		pService.setPageNo(pageNo);
		List<productBean> list = pService.getAllProduct();
		int totalPages = pService.getTotalPages();
		orderItem oi = new orderItem();
		mav.addObject("totalPages", totalPages);
		mav.addObject("productList", list);
		mav.addObject("orderItem", oi);
		session.setAttribute("pageNo", pageNo);
		return mav;
	}
//轉換圖檔
	private byte[] toByte(String filePath) {
		byte[] b = null;
		String realpath = context.getRealPath(filePath);
		try {
			File file = new File(realpath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filePath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
//顯示商品圖片
	@RequestMapping(value = "/showPic/{pId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> showPic(HttpServletResponse resp, @PathVariable Integer pId) {
		productBean pb = pService.getProduct(pId);
		String filePath = "/WEB-INF/resource/img/NoImage.jpg";
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		byte[] mediaByte = null;
		if (pb != null) {
			Blob blob = pb.getpPicture();
			filename = pb.getpFileName();
			try {
				if (blob != null) {
					len = (int) blob.length();
					mediaByte = blob.getBytes(1, len);
					String mimeType = context.getMimeType(filename);
					MediaType mediaType = MediaType.valueOf(mimeType);
					headers.setContentType(mediaType);
				} else {
					filename = filePath;
					mediaByte = toByte(filePath);
				}
			} catch (SQLException e) {
				throw new RuntimeException("ProductController的getPic發生例外:" + e.getMessage());
			}
		} else {
			filename = filePath;
			mediaByte = toByte(filePath);
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ResponseEntity<byte[]> resEntity = new ResponseEntity<>(mediaByte, headers, HttpStatus.OK);
		return resEntity;
	}
//新增商品至購物車
	@RequestMapping(value = "/Buy", method = RequestMethod.POST)
	public ModelAndView AddToCart(HttpSession session, ModelAndView mav, @ModelAttribute("orderItem") orderItem oi,
			BindingResult result) throws ServletException {
		int pageNo = (int) session.getAttribute("pageNo");
		mav.setViewName("checkout/checkCart");
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		if (cart == null) {
			cart = new shoppingCart();
		}
		cart.addToCart(oi.getpId(), oi);
		session.setAttribute("shoppingCart", cart);
		return mav;
	}
//確認訂單頁面顯示
	@RequestMapping(value = "/CheckOut")
	public ModelAndView ToCheckOut(HttpSession session, ModelAndView mav) {
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		if (cart == null) {
			mav.setViewName("redirect:/products/1");
			return mav;
		}
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb != null) {
			String mAccount = mb.getmAccount();
			Integer total = cart.getTotal();
			java.sql.Timestamp orderTime = new Timestamp(new java.util.Date().getTime());
			orderBean ob = new orderBean();
			ob.setmAccount(mAccount);
			ob.setoTimestamp(orderTime);
			ob.setoTotalAmount(total);
			ob.setmName(mb.getmName());
			mav.addObject("orderInfo", ob);
			mav.setViewName("checkout/checkout");
			return mav;
		} else {
			session.setAttribute("requestURI", "/CheckOut");
			mav.setViewName("redirect:/login");
			return mav;
		}
	}
//送出訂單
	@RequestMapping(value = "/ConfirmOrder")
	public String ConfirmOrder(@ModelAttribute("orderInfo") orderBean ob, HttpSession session) {
		shoppingCart sc = (shoppingCart) session.getAttribute("shoppingCart");
		if (sc == null) {
			return "redirect:/products/1";
		}
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb != null) {
			Set<orderItemBean> items = new HashSet<orderItemBean>();
			Map<Integer, orderItem> cart = sc.getContent();
			Set<Integer> set = cart.keySet();
			Integer newStock = 0;
			int n = 0;
			productBean pb = null;
			for (Integer k : set) {
				orderItem oi = cart.get(k);
				Integer subtotal = (oi.getiQty() * oi.getpPrice());
				String iDes = oi.getpName() + " 共 " + oi.getiQty().toString() + "個，金額小計:" + subtotal.toString();
				orderItemBean oib = new orderItemBean(null, oi.getpId(), iDes, oi.getiQty(), oi.getpPrice());
				oib.setOrderBean(ob);
				items.add(oib);
				pb = pService.getProduct(oi.getpId());
				newStock = pb.getpInstock() - oi.getiQty();
				n = pService.updateStock(pb.getpId(), newStock);
			}
			ob.setItemSet(items);
			ob.setmName(mb.getmName());
			oService.saveOrder(ob);
			session.removeAttribute("shoppingCart");
			AioCheckOutOneTime obj = new AioCheckOutOneTime();
			Date today = new Date();
			String todayStr = new SimpleDateFormat("yyyyMMddHHmmss").format(today);
			String TradeNo = todayStr + "No" + ob.getoId().toString();
			obj.setMerchantTradeNo(TradeNo);
			String tradedate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(ob.getoTimestamp());
			obj.setMerchantTradeDate(tradedate);
			obj.setTotalAmount(ob.getoTotalAmount().toString());
			obj.setTradeDesc("test Description");
			obj.setItemName("TestItem");
			obj.setReturnURL("http://211.23.128.214:5000");
			obj.setNeedExtraPaidInfo("N");
			obj.setRedeem("Y");
			obj.setOrderResultURL("http://localhost:8080/finalProject/PaySuccess");
			obj.setCustomField1(ob.getmAccount());
			AllInOne all = new AllInOne("");
			String form = all.aioCheckOut(obj, null);
			session.setAttribute("form", form);
			return "checkout/ECpage";
		} else {
			session.setAttribute("requestURI", "/ConfirmOrder");
			return "redirect:/login";
		}
	}
//綠界結帳完成頁面顯示
	@RequestMapping("/PaySuccess")
	public String TestEC(HttpSession session, HttpServletRequest request) {
		try {
			String requestBody = request.getReader().lines().collect(Collectors.joining());
//			String requestBody = "CustomField1=test&CustomField2=&CustomField3=&CustomField4=&"
//					+ "MerchantID=2000132&MerchantTradeNo=20190911212122No36&"
//					+ "PaymentDate=2019%2F09%2F11+21%3A22%3A13&PaymentType=Credit_CreditCard&"
//					+ "PaymentTypeChargeFee=1&RtnCode=1&RtnMsg=Succeeded&SimulatePaid=0&"
//					+ "StoreID=&TradeAmt=500&TradeDate=2019%2F09%2F11+21%3A21%3A29&"
//					+ "TradeNo=1909112121291895&CheckMacValue="
//					+ "67DAB16C73726978E468116160C1EFB5609622FF903152D572F2962B07CEEE4B";
			int TradeNoDB = 0;
			Timestamp paymentDate = new Timestamp(System.currentTimeMillis());
			String mAccount = "";
			String ReturnCode = "";
			orderBean ob = null;
			String[] bodys = requestBody.split("&");
			for (int i = 0; i < bodys.length; i++) {
				if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("MerchantTradeNo")) {
					// get tradeNo
					String MerchantTradeNo = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
					String TradeNoDBStr = MerchantTradeNo.substring(MerchantTradeNo.indexOf("No") + 2,
							MerchantTradeNo.length());
					TradeNoDB = Integer.parseInt(TradeNoDBStr);

				} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("PaymentDate")) {
					// get payment date
					String tempPaymentDate = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
					try {
						String PaymentDateStr = (URLDecoder.decode(tempPaymentDate, "UTF-8")).replace("/", "-");
						paymentDate = Timestamp.valueOf(PaymentDateStr);
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("CustomField1")) {
					// get account
					mAccount = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
					System.out.println(mAccount);
				} else if (bodys[i].substring(0, bodys[i].indexOf("=")).equals("RtnCode")) {
					// get return code
					ReturnCode = bodys[i].substring(bodys[i].indexOf("=") + 1, bodys[i].length());
				}
			}
			if (ReturnCode.equals("1")) {
				ob = oService.updateOrderAfterCheckout(TradeNoDB, paymentDate, mAccount);
			}
			session.setAttribute("paymentInfo", ob);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "checkout/paidPage";
	}
//新增商品表格
	@RequestMapping(value = "/AddProduct", method = RequestMethod.GET)
	public String AddForm(Model model) {
		productBean bb = new productBean();
		model.addAttribute("productBean", bb);
		return "maintain/maintain";
	}
//新增商品
	@RequestMapping(value = "/ProcessAdd", method = RequestMethod.POST)
	public String AddProduct(@ModelAttribute("productBean") productBean bb, BindingResult result) {
		MultipartFile productImage = bb.getProductImage();
		String originFilename = productImage.getOriginalFilename();
		bb.setpFileName(originFilename);
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setpPicture(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		pService.insertNewProduct(bb);
		return "redirect:/products/1";
	}
//刪除購物車商品
	@RequestMapping(value = "/DeleteCartProduct", method = RequestMethod.GET)
	public ModelAndView deleteProduct(HttpSession session, ModelAndView mav, HttpServletRequest request) {
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		mav.setViewName("checkout/checkCart");
		int pId = Integer.parseInt(request.getParameter("pId"));
		cart.deleteProduct(pId);
		return mav;
	}
//顯示訂單
	@RequestMapping("/OrderDetails")
	public ModelAndView GetOrderlist(HttpSession session, ModelAndView mav) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		List<orderBean> list = oService.getMemberOrders(mb.getmAccount());
		mav.addObject("orderList", list);
		mav.setViewName("checkout/orderDetails");
		return mav;
	}
//顯示訂單明細
	@RequestMapping("/showOrderItem/{oId}")
	public ModelAndView GetOrderItem(@PathVariable Integer oId, HttpSession session, ModelAndView mav,
			HttpServletRequest request) {
		List<orderItemBean> list = oService.getOrderItem(oId);
		mav.addObject("orderItemList", list);
		mav.setViewName("checkout/orderItem");
		return mav;
	}
//建立商品資料庫
	@RequestMapping("/AddProductDB")
	public String AddProductDB() {
		pService.addProductDB();
		return "index";
	}

}
