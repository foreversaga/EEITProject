package product.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import product.model.productBean;
import product.service.productService;
import product.serviceImpl.productServiceImpl;

/**
 * Servlet implementation class ShowPicServlet
 */
@WebServlet("/ShowPic")
public class ShowPicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowPicServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OutputStream os = null;
		InputStream is = null;
		String mimeType = null;
		Blob blob = null;
		String fileName = null;
		try {
			String id = request.getParameter("pId");
//			productService productService = new productServiceImpl();
			ServletContext sc = getServletContext();
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
			productService Service=ctx.getBean(productService.class);
			int nid = 0;
			try {
				nid = Integer.parseInt(id);
			} catch (NumberFormatException ex) {
			}
			productBean pb = Service.getProduct(nid);
			if (pb != null) {
				blob = pb.getpPicture();
				if (blob != null) {
					try {
						is = blob.getBinaryStream();
					} catch (NullPointerException e) {
						;// catch exception when picture is null
					}
				}
				fileName = pb.getpFileName();
			}
			mimeType = getServletContext().getMimeType(fileName);
			response.setContentType(mimeType);
			os = response.getOutputStream();
			int len = 0;
			byte[] bytes = new byte[8192];

			try {
				while ((len = is.read(bytes)) != -1) {
					os.write(bytes, 0, len);
				}
			} catch (NullPointerException e) {
				;// catch exception when picture is null
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("showPictureServlet發生錯誤:" + e.getMessage());
		} finally {
			if (is != null) {
				is.close();
			}
			if (os != null) {
				os.close();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
