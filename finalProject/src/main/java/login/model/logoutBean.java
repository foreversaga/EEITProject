package login.model;

import javax.servlet.http.HttpSession;

public class logoutBean {
	HttpSession session;

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public Integer getLogout() {
		session.invalidate();
		return 0;
	}
}
