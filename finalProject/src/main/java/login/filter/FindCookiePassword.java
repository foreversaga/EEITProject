package login.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class FindCookiePassword
 */
@WebFilter("/login/login.jsp")
public class FindCookiePassword implements Filter {
	String requestURI;

	public FindCookiePassword() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			String cookieName = "";
			String user = "";
			String password = "";
			String rememberMe = "";
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					cookieName = cookies[i].getName();
					if (cookieName.equals("user")) {
						user = cookies[i].getValue();
					} else if (cookieName.equals("password")) {
						password = cookies[i].getValue();
					} else if (cookieName.equals("rm")) {
						rememberMe = cookies[i].getValue();
					}
				}
			} // find cookie end
			request.setAttribute("rememberMe", rememberMe);
			request.setAttribute("user", user);
			request.setAttribute("password", password);
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
