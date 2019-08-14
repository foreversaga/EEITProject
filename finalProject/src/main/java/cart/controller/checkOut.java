package cart.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.orderBean;
import cart.model.orderItem;
import cart.model.shoppingCart;
import register.model.MemberBean;

/**
 * Servlet implementation class checkOut
 */
@WebServlet("/checkOut.do")
public class checkOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session == null) {
			RequestDispatcher rd = request.getRequestDispatcher("login/login.jsp");
			rd.forward(request, response);
			return;
		}
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb == null) {
			RequestDispatcher rd = request.getRequestDispatcher("login/login.jsp");
			rd.forward(request, response);
			return;
		}
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		if (cart == null) {
			response.sendRedirect(response.encodeRedirectURL("/product.do"));
			return;
		}
		String mAccount = mb.getmAccount();
		Integer totalAmount = cart.getTotal();
		java.sql.Timestamp orderTime = new Timestamp(new java.util.Date().getTime());
//		List<orderItem> cartItem = cart.getCartItem();
		orderBean ob = new orderBean(null, totalAmount, orderTime, null, mAccount);
		session.setAttribute("orderList", ob);// bean class must have constructor before use jsp:useBean
//		session.setAttribute("cartItem", cartItem);
		RequestDispatcher rd = request.getRequestDispatcher("checkout/checkout.jsp");
		rd.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
