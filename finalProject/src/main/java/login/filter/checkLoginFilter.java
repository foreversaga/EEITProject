package login.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import register.model.MemberBean;

/**
 * Servlet Filter implementation class checkLoginFilter
 */
@WebFilter(urlPatterns = { "/*" }, initParams = { 
		@WebInitParam(name = "mustLogin1", value = "/product/*"),
		@WebInitParam(name = "mustLogin2", value = "/login/MemberInfo.jsp") }

)
public class checkLoginFilter implements Filter {
	List<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		boolean requestSessionValid = false;
		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();
			contextPath = req.getContextPath();
			requestURI = req.getRequestURI();
			requestSessionValid = req.isRequestedSessionIdValid();

			if (mustLogin()) {
				if (checkLogin(req)) {
					chain.doFilter(request, response);
				} else {// need login but not, move to login.jsp
					HttpSession session = req.getSession();
					if (!requestSessionValid) {
						session.setAttribute("timeOut", "使用逾時請重新登入");
					} else {// session is valid, return to last requestURI
						session.setAttribute("requestURI", requestURI);
					}
					resp.sendRedirect(contextPath + "/login/login.jsp");
					return;
				}
			} else {
				chain.doFilter(request, response);
			}
		} else {
			throw new ServletException("Request/Response型態錯誤");
		}
	}

	private boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberBean loginToken = (MemberBean) session.getAttribute("LoginOK");
		if (loginToken == null) {
			return false;
		} else {
			return true;
		}
	}

	private boolean mustLogin() {
		boolean login = false;
		for (String sURL : url) {
			if (sURL.endsWith("*")) {
				sURL = sURL.substring(0, sURL.length() - 1);
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				}
			} else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
		return login;
	}

	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
		}
	}

}
