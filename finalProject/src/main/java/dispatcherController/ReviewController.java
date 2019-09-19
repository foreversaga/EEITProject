package dispatcherController;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import register.model.MemberBean;
import review.model.reviewBean;
import review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService rService;
	@Autowired
	SessionFactory factory;

	@RequestMapping("/AddReview/{pId}")
	public String AddReview(@PathVariable Integer pId, HttpSession session, Model model, HttpServletRequest request) {
		reviewBean rb = new reviewBean();
		rb.setpId(pId);
		model.addAttribute("reviewBean", rb);
		return "review/AddReview";
	}

	@RequestMapping(value = "/ProcessNewReview", method = RequestMethod.POST)
	public String AddProduct(@ModelAttribute("reviewBean") reviewBean rb, BindingResult result, HttpSession session) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		rb.setmAccount(mb.getmAccount());
		java.sql.Timestamp date = new java.sql.Timestamp(System.currentTimeMillis());
		rb.setrTimestamp(date);
		rService.InsertNewReview(rb);
		return "redirect:/";
	}
}
