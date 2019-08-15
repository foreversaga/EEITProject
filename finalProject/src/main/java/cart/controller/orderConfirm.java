package cart.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.orderBean;
import cart.model.orderItem;
import cart.model.orderItemBean;
import cart.model.shoppingCart;
import checkout.service.orderService;
import checkout.service.impl.orderServiceImpl;
import register.model.MemberBean;

/**
 * Servlet implementation class orderConfirm
 */
@WebServlet("/orderConfirm.do")
public class orderConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb == null) {
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}

		shoppingCart sc = (shoppingCart) session.getAttribute("shoppingCart");
		if (sc == null) {
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}

		orderBean ob = (orderBean) session.getAttribute("orderList");
		if (ob == null) {
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}
		//
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

		try {
			orderService orderService = new orderServiceImpl();
			orderService.saveOrder(ob);
			session.removeAttribute("shoppingCart");
			response.sendRedirect(response.encodeRedirectURL(getServletContext().getContextPath() + "/index.jsp"));
		} catch (RuntimeException e) {
			;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
