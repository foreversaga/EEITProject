package cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.shoppingCart;

/**
 * Servlet implementation class checkCart
 */
@WebServlet("/checkCart.do")
public class checkCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect(response.encodeRedirectURL("/product.do"));
			return;
		}
		shoppingCart sc = (shoppingCart) session.getAttribute("shoppingCart");
		if (sc == null) {
			response.sendRedirect(response.encodeRedirectURL("/product.do"));
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("checkout/checkCart.jsp");
		rd.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
