package dispatcherController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import register.model.MemberBean;
import review.model.reviewBean;
import review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService rService;
	@Autowired
	SessionFactory factory;

//	@RequestMapping("/AddReview/{pId}")
//	public String AddReview(@PathVariable Integer pId, HttpSession session, Model model, HttpServletRequest request) {
//		reviewBean rb = new reviewBean();
//		rb.setpId(pId);
//		model.addAttribute("reviewBean", rb);
//		return "review/AddReview";
//	}

	@RequestMapping(value = "/ProcessNewReview", method = RequestMethod.POST)
	public String AddReview(@ModelAttribute("newrb") reviewBean rb, BindingResult result, HttpServletRequest request) {
		java.sql.Timestamp date = new java.sql.Timestamp(System.currentTimeMillis());
		rb.setrTimestamp(date);
		rService.InsertNewReview(rb);
		StringBuilder sb = new StringBuilder();
		sb.append("redirect:/showOrderItem/").append(rb.getoId()).append("#orderitem");
		return sb.toString();
	}

	@RequestMapping(value = "/ProcessAmendReview", method = RequestMethod.POST)
	public String AmendReview(@ModelAttribute("newrb") reviewBean rb, @RequestParam("rReview") String rReview,
			BindingResult result, HttpServletRequest request) {
		java.sql.Timestamp date = new java.sql.Timestamp(System.currentTimeMillis());
		rb.setrTimestamp(date);
		rb.setrReview(rReview);
		rService.UpdateReview(rb);
		StringBuilder sb = new StringBuilder();
		sb.append("redirect:/showOrderItem/").append(rb.getoId()).append("#orderitem");
		return sb.toString();
	}
}
