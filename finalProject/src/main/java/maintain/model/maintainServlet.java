package maintain.model;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

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

/**
 * Servlet implementation class maintainServlet
 */
@WebServlet({"/maintain.do","/maintain/maintain.do"})
public class maintainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public maintainServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> MsgOK = new HashMap<String, String>();
		HttpSession session = request.getSession();
		request.setAttribute("msgMap", errorMsg);
		session.setAttribute("msgOK", MsgOK);
		
		int pID = 0;
		String tempID = request.getParameter("pID");
		if (tempID == null || tempID.trim().length() == 0) {
			errorMsg.put("idError", "請輸入產品價格");
		} else {
			pID = Integer.parseInt(request.getParameter("pID"));
		}
		
		
		String pName = request.getParameter("pName");
		if (pName == null || pName.trim().length() == 0) {
			errorMsg.put("nameError", "請輸入產品名稱");
		}

		int pPrice = 0;
		String tempPrice = request.getParameter("pPrice");
		if (tempPrice == null || tempPrice.trim().length() == 0) {
			errorMsg.put("priceError", "請輸入產品價格");
		} else {
			pPrice = Integer.parseInt(request.getParameter("pPrice"));
		}

		int PinStock = 0;
		String tempPinStock = request.getParameter("PinStock");
		if (tempPinStock == null || tempPinStock.trim().length() == 0) {
			errorMsg.put("stockError", "請輸入產品庫存");
		} else {
			PinStock = Integer.parseInt(tempPinStock);
		}

		String tempDate = request.getParameter("pDateRange");
		if (tempDate == null || tempDate.trim().length() == 0) {
			errorMsg.put("dateError", "請輸入產品有效日期");
		}

		String pContent = request.getParameter("pContent");
		if (pContent == null || pContent.trim().length() == 0) {
			errorMsg.put("contentError", "請輸入產品說明");
		}
		try {
			productBean pb = new productBean();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date d = sdf.parse(tempDate);
			java.sql.Date pDateRange = new java.sql.Date(d.getTime());
			pb.setpID(pID);
			pb.setpName(pName);
			pb.setpPrice(pPrice);
			pb.setpDateRange(pDateRange);
			pb.setpContent(pContent);
			pb.setPinStock(PinStock);
			productService service = new productServiceImpl();
			int n = service.insertNewProduct(pb);
			if (n == 1) {
				MsgOK.put("insertOK", "產品新增成功");
				response.sendRedirect("maintain.jsp");
				return;
			}
			if (!errorMsg.isEmpty()) {
				RequestDispatcher rd = request.getRequestDispatcher("maintain.jsp");
				rd.forward(request, response);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg.put("insertError", "資料新增錯誤:" + e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("maintain.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
