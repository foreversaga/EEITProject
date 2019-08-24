package dispatcherController;

import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
import product.model.productBean;
import product.service.productService;

@Controller
public class ProductController {
	@Autowired
	productService pService;
	@Autowired
	ServletContext context;
	@Autowired
	orderService oService;

	@RequestMapping("/products/{pageNo}")
	public ModelAndView productsPage(@PathVariable Integer pageNo, HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		ModelAndView mav = new ModelAndView("product/products");
		pService.setPageNo(pageNo);
		List<productBean> list = pService.getAllProduct();
		Long totalPages = pService.getTotalPages();
		orderItem oi = new orderItem();
		mav.addObject("totalPages", totalPages);
		mav.addObject("productList", list);
		mav.addObject("orderItem", oi);
		HttpSession session = request.getSession(false);
		session.setAttribute("pageNo", pageNo);
		return mav;
	}

	@RequestMapping(value = "/showPic/{pId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> showPic(HttpServletResponse resp, @PathVariable Integer pId) {
		productBean pb = pService.getProduct(pId);
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
				}
			} catch (SQLException e) {
				throw new RuntimeException("ProductController的getPic發生例外:" + e.getMessage());
			}
		} else {
			throw new RuntimeException("ProductController的getPic無法取得bean物件");
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ResponseEntity<byte[]> resEntity = new ResponseEntity<>(mediaByte, headers, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value = "/Buy", method = RequestMethod.POST)
	public ModelAndView AddToCart(HttpSession session, ModelAndView mav, @ModelAttribute("orderItem") orderItem oi,
			BindingResult result) throws ServletException {
		int pageNo = (int) session.getAttribute("pageNo");
		mav.setViewName("forward:products/" + pageNo);
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		if (cart == null) {
			cart = new shoppingCart();
		}
		cart.addToCart(oi.getpId(), oi);
		session.setAttribute("shoppingCart", cart);
		return mav;
	}

	@RequestMapping(value = "/CheckCart")
	public ModelAndView CheckCart(HttpSession session, ModelAndView mav) {
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		mav.setViewName("checkout/checkCart");
		mav.addObject("shoppingCart", cart);
		return mav;
	}

	@RequestMapping(value = "/CheckOut")
	public ModelAndView ToCheckOut(HttpSession session, ModelAndView mav) {
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		String mAccount = "test5";
		Integer total = cart.getTotal();
		java.sql.Timestamp orderTime = new Timestamp(new java.util.Date().getTime());
		orderBean ob = new orderBean(null, total, orderTime, null, mAccount);
		session.setAttribute("orderList", ob);
		mav.setViewName("checkout/checkout");
		return mav;
	}

	@RequestMapping(value = "/ConfirmOrder")
	public String ConfirmOrder(HttpSession session) {
		shoppingCart sc = (shoppingCart) session.getAttribute("shoppingCart");
		orderBean ob = (orderBean) session.getAttribute("orderList");
		Set<orderItemBean> items = new HashSet<orderItemBean>();
		Map<Integer, orderItem> cart = sc.getContent();
		Set<Integer> set = cart.keySet();
		for (Integer k : set) {
			orderItem oi = cart.get(k);
			Integer subtotal = (oi.getiQty() * oi.getpPrice());
			String iDes = oi.getpName() + " 共 " + oi.getiQty().toString() + "個，金額小計:" + subtotal.toString();
			orderItemBean oib = new orderItemBean(null, oi.getpId(), iDes, oi.getiQty(), oi.getpPrice());
			oib.setOrderBean(ob);
			items.add(oib);
		}
		ob.setItemSet(items);
		oService.saveOrder(ob);
		session.removeAttribute("shoppingCart");
		return "redirect:/";
	}
}
