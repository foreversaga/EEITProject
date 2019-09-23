package dispatcherController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String Logout(Model model, HttpSession session) {
//		request.getSession().invalidate();
		session.invalidate();
		return "redirect:/";

	}

	@RequestMapping(value = "/register/add", method = RequestMethod.GET)
	public String getRegisterData(Model model) {
		MemberBean mb = new MemberBean();
		model.addAttribute("MemberBean", mb);
		return "register/register";
	}

	//轉換圖檔
		private byte[] toByte(String filePath) {
			byte[] b = null;
			String realpath = context.getRealPath(filePath);
			try {
				File file = new File(realpath);
				long size = file.length();
				b = new byte[(int) size];
				InputStream fis = context.getResourceAsStream(filePath);
				fis.read(b);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return b;
		}
	
	//顯示商品圖片
		@RequestMapping(value = "/showmPic/{mId}", method = RequestMethod.GET)
		public ResponseEntity<byte[]> showmPic(HttpSession session, HttpServletResponse resp, @PathVariable Integer mId) {
			MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
			String filePath = "/WEB-INF/resource/img/NoImage.jpg";
			String filename = "";
			int len = 0;
			HttpHeaders headers = new HttpHeaders();
			byte[] mediaByte = null;
			if (mb != null) {
				Blob blob = mb.getmPicture();
				filename = mb.getmFileName();
				try {
					if (blob != null) {
						len = (int) blob.length();
						mediaByte = blob.getBytes(1, len);
						String mimeType = context.getMimeType(filename);
						MediaType mediaType = MediaType.valueOf(mimeType);
						headers.setContentType(mediaType);
					} else {
						filename = filePath;
						mediaByte = toByte(filePath);
					}
				} catch (SQLException e) {
					throw new RuntimeException("MemberController的getPic發生例外:" + e.getMessage());
				}
			} else {
				filename = filePath;
				mediaByte = toByte(filePath);
			}
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			ResponseEntity<byte[]> resEntity = new ResponseEntity<>(mediaByte, headers, HttpStatus.OK);
			return resEntity;
		}
	@RequestMapping(value = "/register/add", method = RequestMethod.POST)
	public String porcessAddNewRegistertoForm(@ModelAttribute("MemberBean") MemberBean mb, BindingResult result) {
		MultipartFile memberImage = mb.getMemberImage();
		String originFilename = memberImage.getOriginalFilename();
		mb.setmFileName(originFilename);
		if (memberImage != null && !memberImage.isEmpty()) {
			try {
				byte[] b = memberImage.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setmPicture(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		memberservice.registerMember(mb);
		return "redirect:/";

	}

	@RequestMapping(value = "/UpdateMemberForm", method = RequestMethod.GET)
	public String AddLoginMemberBeantoUpdateForm(Model model,HttpSession session) {
		MemberBean mb= new MemberBean();
		model.addAttribute("MemberBean", mb);
		return "UserDashboard/UserDashboardUpdateMember";
	}

	@RequestMapping(value = "/UpdateMemberForm", method = RequestMethod.POST)
	public String UpdateMember(@ModelAttribute("MemberBean")MemberBean mb, Model model,HttpSession session,BindingResult result ) {
		MemberBean LoginOK =(MemberBean) session.getAttribute("LoginOK");
		LoginOK.setmPassword(mb.getmPassword());
		LoginOK.setmAccount(mb.getmAccount());
		LoginOK.setmAddress(mb.getmAddress());
		LoginOK.setmEmail(mb.getmEmail());
		LoginOK.setmPhone(mb.getmPhone());
		memberservice.updateMember(LoginOK);
		return "redirect:/UserDashboard";
//		return "index";
	}
	

}
