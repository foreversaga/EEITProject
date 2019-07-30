package login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import register.model.MemberBean;
import register.service.MemberService;
import register.serviceImpl.MemberServiceImpl;

@WebServlet("/login/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		request.setAttribute("errorMsgKey", errorMsgMap);
		String mAccount = request.getParameter("mAccount");
		String mPassword = request.getParameter("mPassword");
		String rememberMe = request.getParameter("rememberMe");
		String requestURI = (String) session.getAttribute("requestURI");

		if (mAccount == null || mAccount.trim().length() == 0) {
			errorMsgMap.put("AccountError", "帳號欄必須輸入");
		}
		if (mPassword == null || mPassword.trim().length() == 0) {
			errorMsgMap.put("PasswordError", "密碼欄必須輸入");
		}
		if (!errorMsgMap.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			return;
		}

		Cookie cookieUser = null;
		Cookie cookiePasswrod = null;
		Cookie cookieRememberMe = null;
		if (rememberMe != null) {
			cookieUser = new Cookie("user", mAccount);
			cookieUser.setMaxAge(7 * 24 * 60 * 60);
			cookieUser.setPath(request.getContextPath());

			cookiePasswrod = new Cookie("password", mPassword);
			cookiePasswrod.setMaxAge(7 * 24 * 60 * 60);
			cookiePasswrod.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else {// no remember, set maxage=0 to remove cookie
			cookieUser = new Cookie("user", mAccount);
			cookieUser.setMaxAge(0);
			cookieUser.setPath(request.getContextPath());

			cookiePasswrod = new Cookie("password", mPassword);
			cookiePasswrod.setMaxAge(0);
			cookiePasswrod.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePasswrod);
		response.addCookie(cookieRememberMe);

		MemberService memberService = new MemberServiceImpl();
		MemberBean mb = null;
		MemberBean mbinfo = null;
		try {// use checkPassword method to get bean, if bean is exist then set attribute
				// object in session
			mb = memberService.checkPassword(mAccount, mPassword);
			mbinfo=memberService.queryMember(mAccount);
			if (mb != null) {
				session.setAttribute("LoginOK", mb);
				session.setAttribute("MemberInfo", mbinfo);
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
			if (requestURI != null) {
				requestURI = (requestURI.length() == 0 ? request.getContextPath() : requestURI);
				response.sendRedirect(response.encodeRedirectURL(requestURI));
				return;
			} else {
				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
				return;
			}
		} else {// there is no LoginOK object, back to login.jsp
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
