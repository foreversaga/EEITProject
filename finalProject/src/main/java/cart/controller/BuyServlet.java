package cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.orderItem;
import cart.model.shoppingCart;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/Buy.do")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/login/login.jsp"));
			return;
		}
		shoppingCart cart = (shoppingCart) session.getAttribute("shoppingCart");
		if (cart == null) {
			cart = new shoppingCart();
			session.setAttribute("shoppingCart", cart);
		}
		String pName=request.getParameter("pName");
		String oQtyStr=request.getParameter("oQty");
		String pIdStr=request.getParameter("pId");
		String pPriceStr=request.getParameter("pPrice");
		
		int oQty=0;
		int pId=0;
		int pPrice=0;
		try {
			oQty=Integer.parseInt(oQtyStr);
			pId=Integer.parseInt(pIdStr);
			pPrice=Integer.parseInt(pPriceStr);
		}catch(NumberFormatException e) {
			throw new ServletException(e);
		}
		orderItem oi =new orderItem(null,pPrice,pId,oQty,pName);
		cart.addToCart(pId, oi);
		RequestDispatcher rd=request.getRequestDispatcher("/product/product2.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
