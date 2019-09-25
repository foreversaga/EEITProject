package dispatcherController;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.productBean;
import product.service.productService;
import review.model.reviewBean;
import review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService rService;
	@Autowired
	productService pService;
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
		pService.updateRating(rb.getpId(), rb.getrRating());
		pService.updateAvgRating(rb.getpId());
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
		reviewBean rbOld = rService.getReview(rb.getrId());
		int oldRating = rbOld.getrRating();
		int pId = rb.getpId();
		int newRating = rb.getrRating();
		rService.UpdateReview(rb);
		pService.updateAmendRating(pId, oldRating, newRating);
		pService.updateAvgRating(pId);
		StringBuilder sb = new StringBuilder();
		sb.append("redirect:/showOrderItem/").append(rb.getoId()).append("#orderitem");
		return sb.toString();
	}

}
