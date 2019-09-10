package review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import review.model.reviewBean;
import review.service.ReviewService;

@Controller
public class reviewController {

	@Autowired
	ReviewService service;
	
	@RequestMapping(value="/review")
	public String review (Model model) {
//		model.addAttribute("reviewtitle", "的個人評價");
		List<reviewBean> list = service.getAllReviews();
		model.addAttribute("review", list);
		return "review/review";
	}

//	@RequestMapping("/memberreview")
//	public String  memberReview() {
//		return "memberReview";
//	}
//	
//	@RequestMapping("/orderlistreview")
//	public String  orderlistReview() {
//		return "orderlistreview";
//	}
//	
//	@RequestMapping("/memberreview")
//	public String  productReview() {
//		return "memberReview";
//	}

}
