package dispatcherController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import product.model.productBean;
import product.service.productService;

@Controller
public class ProductController {
	@Autowired
	productService service;

	@RequestMapping("/products")
	public String productsPage(Model model, HttpServletRequest request) {
		int pageNo = 1;
		String pageNoStr = request.getParameter("pageNo");
		if (pageNoStr == null) {
			pageNo = 1;
		} else {
			try {
				pageNo = Integer.parseInt(pageNoStr);
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}
		service.setPageNo(pageNo);
		List<productBean> list = service.getAllProduct();
		model.addAttribute("productList", list);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		return "product/products";
	}
}
