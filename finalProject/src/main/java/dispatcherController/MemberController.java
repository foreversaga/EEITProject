package dispatcherController;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.productBean;
import register.model.MemberBean;
import register.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberservice;

	@Autowired
	ServletContext context;

	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public String Login(HttpSession session, HttpServletRequest request) {
		MemberBean mb = null;
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		session.setAttribute("errorMsgKey", errorMsgMap);
		String mAccount = request.getParameter("mAccount");
		String mPassword = request.getParameter("mPassword");
//		String requestURI = (String) session.getAttribute("requestURI"); 

		try {
			mb = memberservice.checkPassword(mAccount, mPassword);
			if (mb != null) {
				session.setAttribute("LoginOK", mb);
			} else {
				errorMsgMap.put("LoginError", "帳號不存在或密碼錯誤");
			}
		} catch (RuntimeException e) {
			errorMsgMap.put("LoginError", e.getMessage());
		}

		if (errorMsgMap.isEmpty()) {
			// if session has contextpath then use it, otherwise get contextpath from
			// request
			// LoginOK object will pass to next page via session
//		if (requestURI != null) {
//			requestURI = (requestURI.length() == 0 ? ((ServletContext) session).getContextPath() : requestURI);			
//			return "redirect:/";
//		} else {			
//			return "redirect:/";
//		}
		} else {// there is no LoginOK object, back to login.jsp
			return "login/login";
		}
		String requestURI = (String) session.getAttribute("requestURI");
		if (requestURI != null) {
			return "redirect:" + requestURI;
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String Logout(Model model, HttpSession session) {
//		request.getSession().invalidate();
		session.invalidate();
		return "index";

	}

	@RequestMapping(value = "/register/add", method = RequestMethod.GET)
	public String getRegisterData(Model model) {
		MemberBean mb = new MemberBean();
		model.addAttribute("MemberBean", mb);
		return "register/register";
	}

	@RequestMapping(value = "/register/add", method = RequestMethod.POST)
	public String porcessAddNewRegistertoForm(@ModelAttribute("MemberBean") MemberBean mb, BindingResult result) {
		memberservice.registerMember(mb);
		return "index";

	}

	@RequestMapping(value = "/UpdateMemberForm", method = RequestMethod.GET)
	public String AddLoginMemberBeantoUpdateForm(Model model, HttpSession session) {
		MemberBean mb = new MemberBean();
		model.addAttribute("MemberBean", mb);
		return "register/updateMember";
	}

	@RequestMapping(value = "/UpdateMemberForm", method = RequestMethod.POST)
	public String UpdateMember(@ModelAttribute("MemberBean") MemberBean mb, Model model, HttpSession session,
			BindingResult result) {
		MemberBean LoginOK = (MemberBean) session.getAttribute("LoginOK");
		LoginOK.setmPassword(mb.getmPassword());
		LoginOK.setmAccount(mb.getmAccount());
		LoginOK.setmAddress(mb.getmAddress());
		LoginOK.setmEmail(mb.getmEmail());
		LoginOK.setmPhone(mb.getmPhone());
		memberservice.updateMember(LoginOK);
		return "index";
	}
}
