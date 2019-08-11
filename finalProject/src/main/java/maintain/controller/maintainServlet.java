package maintain.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import product.model.productBean;
import product.service.productService;
import product.serviceImpl.productServiceImpl;

@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
		* 500, maxRequestSize = 1024 * 1024 * 500 * 5)

@WebServlet({ "/maintain.do", "/maintain/maintain.do" })
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
		Collection<Part> parts = request.getParts();
		try {
			String pName = "";
			Integer pPrice = 0;
			Integer pInstock = 0;
			java.sql.Date pDateRange = null;
			String pContent = "";
			long filesize = 0;
			InputStream is = null;
			String pFileName = "";

			for (Part p : parts) {
				String upName = p.getName();
				String value = request.getParameter(upName);
				if (p.getContentType() == null) {
					if (upName.equals("pName")) {
						pName = value;
						if (pName == null || pName.trim().length() == 0) {
							errorMsg.put("nameError", "請輸入產品名稱");
						} else {
							request.setAttribute("pName", value);
						}
					} else if (upName.equals("pPrice")) {
						pPrice = Integer.parseInt(value);
						if (value == null || value.trim().length() == 0) {
							errorMsg.put("priceError", "請輸入產品價格");
						} else {
							request.setAttribute("pPrice", value);
						}
					} else if (upName.equals("pInstock")) {
						pInstock = Integer.parseInt(value);
						if (value == null || value.trim().length() == 0) {
							errorMsg.put("stockError", "請輸入產品庫存");
						} else {
							request.setAttribute("pInstock", pInstock);
						}
					} else if (upName.equals("pDateRange")) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date d = sdf.parse(value);
						pDateRange = new java.sql.Date(d.getTime());
						if (value == null || value.trim().length() == 0) {
							errorMsg.put("DateError", "請輸入產品有效日期");
						} else {
							request.setAttribute("pDateRange", pDateRange);
						}
					} else if (upName.equals("pContent")) {
						pContent = value;
						if (pContent == null || pContent.trim().length() == 0) {
							errorMsg.put("contentError", "請輸入產品有效日期");
						} else {
							request.setAttribute("pContent", pContent);
						}
					}
				} else {
					for (String content : p.getHeader("content-disposition").split(";")) {
						if (content.trim().startsWith("filename")) {
							pFileName = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
						}
					}
					if (pFileName != null && pFileName.trim().length() > 0) {
						filesize = p.getSize();
						is = p.getInputStream();
						request.setAttribute("pFileName", pFileName);
					} else {
						errorMsg.put("errorPic", "必須挑選圖片檔");
					}
				}
			}
			byte[] b = new byte[(int) filesize];
			SerialBlob blob = new SerialBlob(b);
			productBean pb = new productBean(null, pName, pInstock, pPrice, pContent, null, null, null, null,
					pDateRange, null, blob, pFileName);
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
