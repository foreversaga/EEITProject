package dispatcherController;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
import review.model.reviewBean;
import review.service.ReviewService;

@Controller
public class PurchaseController {
	@Autowired
	productService pService;
	@Autowired
	ReviewService rService;
	@Autowired
	orderService oService;

	// 新增商品至購物車
	@RequestMapping(value = "/Buy", method = RequestMethod.POST)
	public ModelAndView AddToCart(HttpSession session, ModelAndView mav, @ModelAttribute("orderItem") orderItem oi,
			BindingResult result) throws ServletException {
		mav.setViewName("checkout/checkCart");
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		if (cart == null) {
			cart = new shoppingCart();
		}
		cart.addToCart(oi.getpId(), oi);
		session.setAttribute("shoppingCart", cart);
		return mav;
	}

	// 確認訂單頁面顯示
	@RequestMapping(value = "/CheckOut")
	public ModelAndView ToCheckOut(HttpSession session, ModelAndView mav) {
		shoppingCart sc = (shoppingCart) session.getAttribute("shoppingCart");
		if (sc == null) {
			mav.setViewName("redirect:/products/1");
			return mav;
		}
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		String mAccount = mb.getmAccount();
		Integer total = sc.getTotal();
		java.sql.Timestamp orderTime = new Timestamp(new java.util.Date().getTime());
		orderBean ob = new orderBean();
		ob.setmAccount(mAccount);
		ob.setoTimestamp(orderTime);
		ob.setoTotalAmount(total);
		ob.setmName(mb.getmName());
		Map<Integer, orderItem> cart = sc.getContent();
		Set<Integer> set = cart.keySet();
		Map<Integer, Integer> stockMap = new HashMap<>();
		for (Integer i : set) {
			orderItem oi = cart.get(i);
			productBean pb = pService.getProduct(oi.getpId());
			stockMap.put(oi.getpId(), pb.getpInstock());
		}
		mav.addObject("stockMap", stockMap);
		mav.addObject("orderInfo", ob);
		mav.setViewName("checkout/CheckOut");
		return mav;

	}

	// 送出訂單
	@RequestMapping(value = "/ConfirmOrder")
	public String ConfirmOrder(@ModelAttribute("orderInfo") orderBean ob, HttpSession session) {
		shoppingCart sc = (shoppingCart) session.getAttribute("shoppingCart");
		if (sc == null) {
			return "redirect:/products/1";
		}
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
			Map<String, String> errormsg = new HashMap<>();
			if (ob.getoReceiveName() == null || ob.getoReceiveName().trim().length() == 0) {
				errormsg.put("receivename", "請輸入收件人名稱");
			}
			if (ob.getoReceivePhone() == null || ob.getoReceivePhone().trim().length() == 0) {
				errormsg.put("receivephone", "請輸入收件人電話");
			}
			if (ob.getoAddress() == null || ob.getoAddress().trim().length() == 0) {
				errormsg.put("receiveadr", "請輸入收件人地址");
			}
			if (errormsg.size() != 0) {
				session.setAttribute("orderBeanParam", ob);
				session.setAttribute("errormsg", errormsg);
				return "forward:/CheckOut";
			} else {
				Set<orderItemBean> items = new HashSet<orderItemBean>();
				Map<Integer, orderItem> cart = sc.getContent();
				Set<Integer> set = cart.keySet();
				Integer newStock = 0;
				int n = 0;
				productBean pb = null;
				for (Integer k : set) {
					orderItem oi = cart.get(k);
					Integer subtotal = (oi.getiQty() * oi.getpPrice());
					String iDes = oi.getpName() + " 共 " + oi.getiQty().toString() + "個，金額小計:$" + subtotal.toString();
					orderItemBean oib = new orderItemBean(null, oi.getpId(), iDes, oi.getiQty(), oi.getpPrice());
					oib.setOrderBean(ob);
					items.add(oib);
					pb = pService.getProduct(oi.getpId());
					newStock = pb.getpInstock() - oi.getiQty();
					n = pService.updateStock(pb.getpId(), newStock);
				}
				ob.setoTotalAmount(sc.getTotal());
				ob.setItemSet(items);
				ob.setmName(mb.getmName());
				oService.saveOrder(ob);
				session.removeAttribute("shoppingCart");
				session.removeAttribute("orderBeanParam");
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
//				return "redirect:/";
			}
	}

	// 綠界結帳完成頁面顯示
	@RequestMapping("/PaySuccess")
	public String TestEC(HttpSession session, HttpServletRequest request) {
		try {
			String requestBody = request.getReader().lines().collect(Collectors.joining());
//				String requestBody = "CustomField1=test&CustomField2=&CustomField3=&CustomField4=&"
//						+ "MerchantID=2000132&MerchantTradeNo=20190911212122No36&"
//						+ "PaymentDate=2019%2F09%2F11+21%3A22%3A13&PaymentType=Credit_CreditCard&"
//						+ "PaymentTypeChargeFee=1&RtnCode=1&RtnMsg=Succeeded&SimulatePaid=0&"
//						+ "StoreID=&TradeAmt=500&TradeDate=2019%2F09%2F11+21%3A21%3A29&"
//						+ "TradeNo=1909112121291895&CheckMacValue="
//						+ "67DAB16C73726978E468116160C1EFB5609622FF903152D572F2962B07CEEE4B";
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
			}else if(ReturnCode.equals("0")) {
				return "checkout/ErrorPage";
			}
			session.setAttribute("paymentInfo", ob);
		} catch (IOException e) {
			e.printStackTrace();
			return "checkout/ErrorPage";
		}
		return "checkout/paidPage";
	}

	// 刪除購物車商品
	@RequestMapping(value = "/DeleteCartProduct", method = RequestMethod.GET)
	public ModelAndView deleteProduct(HttpSession session, ModelAndView mav, HttpServletRequest request) {
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		mav.setViewName("checkout/checkCart");
		int pId = Integer.parseInt(request.getParameter("pId"));
		cart.deleteProduct(pId);
		return mav;
	}

	// 顯示訂單
	@RequestMapping("/OrderDetails")
	public ModelAndView GetOrderlist(HttpSession session, ModelAndView mav) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		List<orderBean> list = oService.getMemberOrders(mb.getmAccount());
		mav.addObject("orderList", list);
		mav.setViewName("checkout/orderDetails");
		return mav;
	}

	// 顯示訂單明細
	@RequestMapping("/showOrderItem/{oId}")
	public ModelAndView GetOrderItem(@PathVariable Integer oId, HttpSession session, ModelAndView mav,
			HttpServletRequest request) {
		List<orderItemBean> list = oService.getOrderItem(oId);
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
			Map<Integer, reviewBean> map = new HashMap<Integer, reviewBean>();
			for (orderItemBean ob : list) {
				reviewBean rb = rService.getOrderItemReview(ob.getpId(), mb.getmAccount());
				map.put(ob.getpId(), rb);
			}
			reviewBean newrb = new reviewBean();
			mav.addObject("newrb", newrb);
			mav.addObject("review", map);
			mav.addObject("orderItemList", list);
			mav.setViewName("checkout/orderItem");
		return mav;
	}

	@RequestMapping("/UpdateCart")
	public String UpdateCart(HttpSession session, HttpServletRequest request, Model model) {
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		int UpdatePid = Integer.parseInt(request.getParameter("pId"));
		int UpdateQty = Integer.parseInt(request.getParameter("qty"));
		cart.UpdateCartItem(UpdatePid, UpdateQty);
		Map<Integer, orderItem> sc = cart.getContent();
		Set<Integer> set = sc.keySet();
		Map<Integer, Integer> stockMap = new HashMap<>();
		for (Integer i : set) {
			orderItem oi = sc.get(i);
			productBean pb = pService.getProduct(oi.getpId());
			stockMap.put(oi.getpId(), pb.getpInstock());
		}
		model.addAttribute("stockMap", stockMap);
		session.setAttribute("shoppingCart", cart);
		return "checkout/CheckOutUpdate";
	}

	@RequestMapping("/CheckOutDel")
	public String CheckOutDel(HttpSession session, HttpServletRequest request) {
		shoppingCart sc = (shoppingCart) session.getAttribute("shoppingCart");
		int pId = Integer.parseInt(request.getParameter("pId"));
		sc.deleteProduct(pId);
		Map<Integer, orderItem> cart = sc.getContent();
		Set<Integer> set = cart.keySet();
		if (set.size() != 0 || set == null) {
			Map<Integer, Integer> stockMap = new HashMap<>();
			for (Integer i : set) {
				orderItem oi = cart.get(i);
				productBean pb = pService.getProduct(oi.getpId());
				stockMap.put(oi.getpId(), pb.getpInstock());
			}
			session.setAttribute("stockMap", stockMap);
			session.setAttribute("shoppingCart", sc);
		} else {
			session.removeAttribute("shoppingCart");
			return "redirect:/products/1";
		}
		return "checkout/CheckOutUpdate";
	}

	@RequestMapping("/AbortOrder")
	public String AbortOrder(HttpSession session) {
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		if (cart != null) {
			session.removeAttribute("shoppingCart");
		}
		return "redirect:/products/1";
	}
}
