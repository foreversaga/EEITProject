package dispatcherController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@RequestMapping("/products")
	public String productsPage(HttpServletRequest request) {
		int pageNo = 1;
		String pageNoStr=request.getParameter("pageNo");
		if(pageNoStr==null) {
			pageNo=1;
		}else {
			try {
				pageNo=Integer.parseInt(pageNoStr);
			}catch (NumberFormatException e) {
				pageNo=1;
			}
		}
		return "products";
	}
}
