package dispatcherController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cart.model.orderItem;
import product.model.productBean;
import product.service.productService;

@Controller
public class MainController {
	@Autowired
	productService pService;

	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("index");
		List<productBean> list = pService.getPopularFive();
		orderItem oi = new orderItem();
		mav.addObject("TopFiveList", list);
		mav.addObject("orderItem", oi);
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

	@RequestMapping("/UserOrderDetail")
	public String UserOrderDetail() {
		return "/UserDashboard/UserOrderDetail";
	}
	
}
