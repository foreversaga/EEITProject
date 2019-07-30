package product.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.productBean;
import product.service.productService;
import product.serviceImpl.productServiceImpl;

@WebServlet("/product.do")
public class productServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public productServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		productService service = new productServiceImpl();
		List<productBean> list = service.getAllProduct();
		request.setAttribute("productList", list);

		RequestDispatcher rd = request.getRequestDispatcher("product/product2.jsp");
		rd.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
