package dispatcherController;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cart.model.orderItemBean;
import checkout.service.orderService;
import product.model.productBean;
import product.service.productService;
import register.model.MemberBean;
import register.service.MemberService;
import review.model.reviewBean;
import review.service.ReviewService;

@Controller
public class DashboardController {
	@Autowired
	MemberService memberservice;
	@Autowired
	productService pService;
	@Autowired
	orderService oService;
	@Autowired
	ReviewService rService;
	//會員列表
	@RequestMapping(value = "/MemberListDashboard")
	public String getMemberListController(Model model) {
		List<MemberBean>list=memberservice.getAllMember();
		model.addAttribute("Members", list);
		return "Dashboard/MemberListDashboard";
	}
	
	//新增商品表格
		@RequestMapping(value = "/AddProduct", method = RequestMethod.GET)
		public String AddForm(Model model) {
			productBean bb = new productBean();
			model.addAttribute("productBean", bb);
			return "Dashboard/AddProduct";
		}

	//新增商品
		@RequestMapping(value = "/ProcessAdd", method = RequestMethod.POST)
		public String AddProduct(@ModelAttribute("productBean") productBean bb, BindingResult result) {
			MultipartFile productImage = bb.getProductImage();
			String originFilename = productImage.getOriginalFilename();
			bb.setpFileName(originFilename);
			if (productImage != null && !productImage.isEmpty()) {
				try {
					byte[] b = productImage.getBytes();
					Blob blob = new SerialBlob(b);
					bb.setpPicture(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
				}
			}
			pService.insertNewProduct(bb);
			return "redirect:/products/1";
		}
		
	//評價列表
		@RequestMapping(value = "/ReviewListDashboard")
		public String getReviewListController(Model model) {
			reviewBean rb=new reviewBean();
			model.addAttribute("updateallrb", rb);
			List<reviewBean>list=rService.getAllReviews();
			model.addAttribute("reviewList", list);
			return "Dashboard/ReviewListDashboard";
		}	
		
		@RequestMapping(value = "/ReviewListDashboard", method = RequestMethod.POST)
		public String AmendReview(@ModelAttribute("updateallrb") reviewBean rb, @RequestParam("rReview") String rReview,
				BindingResult result, HttpServletRequest request) {
			java.sql.Timestamp date = new java.sql.Timestamp(System.currentTimeMillis());
			rb.setrTimestamp(date);
			rb.setrReview(rReview);
			rService.UpdateReview(rb);
//			StringBuilder sb = new StringBuilder();
//			sb.append("redirect:/ReviewListDashboard/").append(rb.getoId()).append("#orderitem");
//			return sb.toString();
			return "redirect:/ReviewListDashboard/";
		}
		

}
