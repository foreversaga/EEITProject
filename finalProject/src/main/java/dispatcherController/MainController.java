package dispatcherController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cart.model.orderBean;
import cart.model.orderItem;
import checkout.service.orderService;
import product.model.productBean;
import product.service.productService;
import register.model.MemberBean;
import register.service.MemberService;
import review.model.reviewBean;
import review.service.ReviewService;

@Controller
public class MainController {
	@Autowired
	MemberService memberservice;
	@Autowired
	productService pService;
	@Autowired
	orderService oService;
	@Autowired
	ReviewService rService;

	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("index");
		List<productBean> list1 = pService.getPopularFive();
		List<reviewBean> list2=rService.getIndexReview(3);
		mav.addObject("TopFiveList", list1);
		mav.addObject("reviewList", list2);
		return mav;
	}

	@RequestMapping("/login")
	public String login() {
		return "/login/login";
	}

	@RequestMapping("/MemberInfo")
	public String MemberInfo() {
		return "/login/MemberInfo";
	}

	@RequestMapping("/logout")
	public String logout() {
		return "/login/logout";
	}

	@RequestMapping("/register")
	public String register() {
		return "/register/register";
	}


	@RequestMapping("/UserDashboard")
	public String UserDashboard() {
		return "/UserDashboard/UserDashboard";
	}

	@RequestMapping("/UserDashboardRating")
	public String UserDashboardRating() {
		return "/UserDashboard/UserDashboardRating";
	}
	
	@RequestMapping("/Dashboard")
	public String Dashboard() {
		return "/Dashboard/Dashboard";
	}
	
	@RequestMapping("/UserOrderDetail")
	public ModelAndView UserOrderDetail(HttpSession session, ModelAndView mav) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		List<orderBean> list = oService.getMemberOrders(mb.getmAccount());
		mav.addObject("orderList", list);
		mav.setViewName("UserDashboard/UserOrderDetail");
		return mav;
	}
	
	@RequestMapping("/rwd")
	public String indexRWD() {
		return "indexRWD";
	}
}
