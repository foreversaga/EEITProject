package dispatcherController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cart.model.orderBean;
import checkout.service.orderService;
import register.model.MemberBean;

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
	
	@RequestMapping("/Dashboard")
	public String Dashboard() {
		return "/Dashboard/Dashboard";
	}
	
	@RequestMapping("/UserDashboard")
	public String UserDashboard() {
		return "/UserDashboard/UserDashboard";
	}
	

	@RequestMapping("/UserDashboardRating")
	public String UserDashboardRating() {
		return "/UserDashboard/UserDashboardRating";
	}
	
	@RequestMapping("/AddProduct")
	public String DashboardAddProduct() {
		return "/Dashboard/AddProduct";
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
