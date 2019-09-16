package dispatcherController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	public String home() {
		return "index";
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
	@RequestMapping("/rwd")
	public String indexRWD() {
		return "indexRWD";
	}
}
