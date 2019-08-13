package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.model.productBean;
import product.service.productService;
import product.serviceImpl.productServiceImpl;

@WebServlet("/product.do")
public class productServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int pageNo = 1;

	public productServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pageNoStr = request.getParameter("pageNo");
		HttpSession session = request.getSession(false);
		if (pageNoStr == null) {
			pageNo = 1;
		} else {
			try {
				pageNo = Integer.parseInt(pageNoStr);
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}

		productService service = new productServiceImpl();
		session.setAttribute("pageNo", String.valueOf(pageNo));
		service.setPageNo(pageNo);
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
