package dispatcherController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import database.service.DatabaseService;

@Controller
public class DatabaseController {
	@Autowired
	DatabaseService dService;

	// 建立商品資料庫
	@RequestMapping("/AddProductDB")
	public String AddProductDB() {
		dService.addProductDB();
		return "index";
	}
	
	// 建立評價資料庫
	@RequestMapping("/AddReviewDB")
	public String AddReviewDB() {
		dService.addReviewDB();
		return "index";
	}
	
	// 建立會員資料庫
	@RequestMapping("/AddMemberDB")
	public String AddMemberDB() {
		dService.addMemberDB();
		return "index";
	}
}
