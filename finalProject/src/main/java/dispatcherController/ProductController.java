package dispatcherController;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import product.model.productBean;
import product.service.productService;

@Controller
public class ProductController {
	@Autowired
	productService service;
	@Autowired
	ServletContext context;

	@RequestMapping("/products/{pageNo}")
	public String productsPage(@PathVariable Integer pageNo, Model model, HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		service.setPageNo(pageNo);
		List<productBean> list = service.getAllProduct();
		int n = service.getTotalPages();
		model.addAttribute("totalPages", n);
		model.addAttribute("productList", list);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		return "product/products";
	}

	@RequestMapping(value = "/showPic/{pId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> showPic(HttpServletResponse resp, @PathVariable Integer pId) {
		productBean pb = service.getProduct(pId);
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		byte[] mediaByte = null;
		if (pb != null) {
			Blob blob = pb.getpPicture();
			filename = pb.getpFileName();
			try {
				len = (int) blob.length();
				mediaByte = blob.getBytes(1, len);
			} catch (SQLException e) {
				throw new RuntimeException("ProductController的getPic發生例外:" + e.getMessage());
			}
		} else {
			throw new RuntimeException("ProductController的getPic無法取得bean物件");
		}

		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> resEntity = new ResponseEntity<>(mediaByte, headers, HttpStatus.OK);
		return resEntity;
	}
}
