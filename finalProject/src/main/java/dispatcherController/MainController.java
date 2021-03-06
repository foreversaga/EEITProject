package dispatcherController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cart.model.orderBean;
import checkout.service.orderService;
import forum.model.ArticleBean;
import forum.service.ArticleService;
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
	@Autowired
	ArticleService aService;

	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("index");
		List<productBean> list1 = pService.getPopularFive();
		List<reviewBean> list2 = rService.getIndexReview(5);
		List<ArticleBean> list3 = aService.getIndexArticle(4);
		for (productBean pb : list1) {
			if (pb.getpContent().length() > 50) {
				String precontent = pb.getpContent().substring(0, 50) + "...";
				pb.setpContent(precontent);
			}
		}
		for (ArticleBean ab : list3) {
			if (ab.getaContent().length() > 50) {
				String precontent = ab.getaContent().substring(0, 50) + "...";
				ab.setaContent(precontent);
			}
		}
		mav.addObject("TopFiveList", list1);
		mav.addObject("reviewList", list2);
		mav.addObject("ArticleList", list3);
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

	@RequestMapping("/Tokyotheme")
	public ModelAndView Tokyotheme() {
		ModelAndView mav = new ModelAndView("UserDashboard/Tokyotheme");
		List<productBean> list = pService.getAllProductList();
		mav.addObject("productList", list);
		return mav;
	}

	@RequestMapping("/Kyototheme")
	public ModelAndView Kyototheme() {
		ModelAndView mav = new ModelAndView("UserDashboard/Kyototheme");
		List<productBean> list = pService.getAllProductList();
		mav.addObject("productList", list);
		return mav;
	}

	@RequestMapping("/Osakatheme")
	public ModelAndView Osakatheme() {
		ModelAndView mav = new ModelAndView("UserDashboard/Osakatheme");
		List<productBean> list = pService.getAllProductList();
		mav.addObject("productList", list);
		return mav;
	}
}
