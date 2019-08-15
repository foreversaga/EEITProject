package register.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import register.model.MemberBean;
import register.service.MemberService;
import register.serviceImpl.MemberServiceImpl;

@WebServlet("/register/register.do")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PasswordPattern = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*^[!@#$%!^'\\\"]).{8,})";
	private Pattern pattern = null;
	private Matcher matcher = null;

	public registerServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOk = new HashMap<String, String>();
		HttpSession session = request.getSession();
		request.setAttribute("msgMap", errorMsg);
		session.setAttribute("MsgOk", msgOk);
		String mAccount = request.getParameter("mAccount");
		if (mAccount == null || mAccount.trim().length() == 0) {
			errorMsg.put("errorAccount", "請輸入帳號");
		}
		String mPassword = request.getParameter("mPassword");
		if (mPassword == null || mPassword.trim().length() == 0) {
			errorMsg.put("errorPassword", "請輸入密碼");
		}
		String mName = request.getParameter("mName");
		if (mName == null || mName.trim().length() == 0) {
			errorMsg.put("errorName", "請輸入姓名");
		}
		String tempBirth = request.getParameter("mBirth");
		if (tempBirth == null || tempBirth.trim().length() == 0) {
			errorMsg.put("errorBirth", "請輸入生日");
		}
		String mPhone = request.getParameter("mPhone");
		if (mPhone == null || mPhone.trim().length() == 0) {
			errorMsg.put("errorPhone", "請輸入電話");
		}
		String mAddress = request.getParameter("mAddress");
		if (mAddress == null || mAddress.trim().length() == 0) {
			errorMsg.put("errorAddress", "請輸入地址");
		}
		String mID = request.getParameter("mID");
		if (mID == null || mID.trim().length() == 0) {
			errorMsg.put("errorID", "請輸入身分證");
		}
		String mGender = request.getParameter("mGender");
		if (mGender == null || mGender.trim().length() == 0) {
			errorMsg.put("errorGender", "請輸入性別");
		}
		String mEmail = request.getParameter("mEmail");
		if (mEmail == null || mEmail.trim().length() == 0) {
			errorMsg.put("errorEmail", "請輸入信箱");
		}
		if (errorMsg.isEmpty()) {
			pattern = Pattern.compile(PasswordPattern);
			matcher = pattern.matcher(mPassword);
			if (!matcher.matches()) {
				errorMsg.put("passwordError", "密碼至少含有一個大寫字母、小寫字母與數字，長度不能小於八個字元");
			}
		}

		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
			return;
		}
		try {
			MemberService service = new MemberServiceImpl();
			if (service.accountCheck(mAccount)) {
				errorMsg.put("DuplicateID", "此帳號已存在");
			} else {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date d = sdf.parse(tempBirth);
				Date mBirth = new Date(d.getTime());
				MemberBean mb = new MemberBean(mPassword, mAccount, mName, mBirth, mPhone, mAddress, null, mGender,
						mEmail);

				int n = service.registerMember(mb);
				if (n == 1) {
					msgOk.put("InsertOk", "會員新增成功");
					response.sendRedirect("../index.jsp");
					return;
				} else {
					errorMsg.put("DuplicateID", "新增此筆會員資料有誤");
				}
			}
			if (!errorMsg.isEmpty()) {
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg.put("DuplicateID", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
