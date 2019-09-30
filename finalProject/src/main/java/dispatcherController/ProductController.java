package dispatcherController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import cart.model.orderItem;
import checkout.service.orderService;
import product.model.productBean;
import product.service.productService;
import review.model.reviewBean;
import review.service.ReviewService;

@Controller
public class ProductController {
	@Autowired
	productService pService;
	@Autowired
	ReviewService rService;
	@Autowired
	ServletContext context;
	@Autowired
	orderService oService;

	@RequestMapping(value = "/shop/{pageNo}")
	public String productPage(HttpSession session, @PathVariable Integer pageNo, HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		if (pageNo == 1) {
			pageNo = 1;
			sb.append("redirect:/products/").append(pageNo);
			return sb.toString();
		} else {
			sb.append("redirect:/products/").append(pageNo).append("#ChangePage");
			return sb.toString();
		}
	}

//顯示商品頁面
	@RequestMapping(value = "/products/{pageNo}", method = RequestMethod.GET)
	public ModelAndView productsPage(HttpSession session, @PathVariable Integer pageNo, HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		ModelAndView mav = new ModelAndView("product/products");
		pService.setPageNo(pageNo);
		List<productBean> list = pService.getAllProduct();
		int totalPages = pService.getTotalPages();
		orderItem oi = new orderItem();
		mav.addObject("totalPages", totalPages);
		mav.addObject("productList", list);
		mav.addObject("orderItem", oi);
		session.setAttribute("pageNo", pageNo);
		session.setAttribute("MappingPath", "shop");
		session.removeAttribute("QueryString");
		return mav;
	}

	// 顯示單一商品頁面
	@RequestMapping(value = "/ProductSingle/{pId}", method = RequestMethod.GET)
	public ModelAndView ProductSinglePage(HttpSession session, @PathVariable Integer pId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/ProductSingle");
		productBean pb = pService.getProduct(pId);
		List<reviewBean> reviewList = rService.getProductReview(pId);
		List<productBean> mapList=pService.getProductMap(pId);
		orderItem oi = new orderItem();
		JsonObject ProductMap = new JsonObject();
		JsonArray array = new JsonArray();
		for (productBean mapPb:mapList) {
			ProductMap.addProperty("label", mapPb.getpName());
			ProductMap.addProperty("lat", mapPb.getpLat());
			ProductMap.addProperty("lng", mapPb.getpLng());
			ProductMap.addProperty("pId", mapPb.getpId());
			array.add(ProductMap);
			ProductMap = new JsonObject();
		}
		System.out.println(array);
		mav.addObject("mapList",array);
		mav.addObject("orderItem", oi);
		mav.addObject("productBean", pb);
		mav.addObject("reviewList", reviewList);
		return mav;
	}

	@RequestMapping(value = "/PriceDesc/{pageNo}")
	public String PriceDescPage(HttpSession session, @PathVariable Integer pageNo, HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append("redirect:/ProductsPriceDesc/").append(pageNo).append("#ChangePage");
		return sb.toString();
	}

	// 商品依照價格遞減排序
	@RequestMapping(value = "/ProductsPriceDesc/{pageNo}", method = RequestMethod.GET)
	public ModelAndView ProductsOrderByPriceDesc(HttpSession session, @PathVariable Integer pageNo,
			HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		// 查詢後顯示第一頁
		String QueryString = request.getParameter("QueryString");
		// 顯示查詢頁面後的換頁
		if (QueryString == null) {
			QueryString = (String) session.getAttribute("QueryString");

		}
		ModelAndView mav = new ModelAndView("product/products");
		pService.setPageNo(pageNo);
		List<productBean> list = pService.getProductByPriceDesc(QueryString);
		int totalPages = pService.getQueryPages(QueryString);
		orderItem oi = new orderItem();
		mav.addObject("totalPages", totalPages);
		mav.addObject("productList", list);
		mav.addObject("orderItem", oi);
		session.setAttribute("pageNo", pageNo);
		session.setAttribute("MappingPath", "PriceDesc");
		return mav;
	}

	@RequestMapping(value = "/PriceAsc/{pageNo}")
	public String PriceAscPage(HttpSession session, @PathVariable Integer pageNo, HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append("redirect:/ProductsPriceAsc/").append(pageNo).append("#ChangePage");
		return sb.toString();
	}

	// 商品依照價格遞增排序
	@RequestMapping(value = "/ProductsPriceAsc/{pageNo}", method = RequestMethod.GET)
	public ModelAndView ProductsOrderByPriceAsc(HttpSession session, @PathVariable Integer pageNo,
			HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		String QueryString = request.getParameter("QueryString");
		if (QueryString == null) {
			QueryString = (String) session.getAttribute("QueryString");
		}
		ModelAndView mav = new ModelAndView("product/products");
		pService.setPageNo(pageNo);
		List<productBean> list = pService.getProductByPriceAsc(QueryString);
		int totalPages = pService.getQueryPages(QueryString);
		orderItem oi = new orderItem();
		mav.addObject("totalPages", totalPages);
		mav.addObject("productList", list);
		mav.addObject("orderItem", oi);
		session.setAttribute("pageNo", pageNo);
		session.setAttribute("MappingPath", "PriceAsc");
		return mav;

	}

	@RequestMapping(value = "/ReviewAsc/{pageNo}")
	public String ReviewAscPage(HttpSession session, @PathVariable Integer pageNo, HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append("redirect:/ProductsReviewAsc/").append(pageNo).append("#ChangePage");
		return sb.toString();
	}

	// 商品依照評價遞增排序
	@RequestMapping(value = "/ProductsReviewAsc/{pageNo}", method = RequestMethod.GET)
	public ModelAndView ProductsOrderByReviewAsc(HttpSession session, @PathVariable Integer pageNo,
			HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		String QueryString = request.getParameter("QueryString");
		if (QueryString == null) {
			QueryString = (String) session.getAttribute("QueryString");
		}
		ModelAndView mav = new ModelAndView("product/products");
		pService.setPageNo(pageNo);
		List<productBean> list = pService.getProductByReviewAsc(QueryString);
		int totalPages = pService.getQueryPages(QueryString);
		orderItem oi = new orderItem();
		mav.addObject("totalPages", totalPages);
		mav.addObject("productList", list);
		mav.addObject("orderItem", oi);
		session.setAttribute("pageNo", pageNo);
		session.setAttribute("MappingPath", "ReviewAsc");
		return mav;
	}

	@RequestMapping(value = "/ReviewDesc/{pageNo}")
	public String ReviewDescPage(HttpSession session, @PathVariable Integer pageNo, HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append("redirect:/ProductsReviewDesc/").append(pageNo).append("#ChangePage");
		return sb.toString();
	}

	// 商品依照評價遞減排序
	@RequestMapping(value = "/ProductsReviewDesc/{pageNo}", method = RequestMethod.GET)
	public ModelAndView ProductsOrderByReviewDesc(HttpSession session, @PathVariable Integer pageNo,
			HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		String QueryString = request.getParameter("QueryString");
		if (QueryString == null) {
			QueryString = (String) session.getAttribute("QueryString");
		}
		ModelAndView mav = new ModelAndView("product/products");
		pService.setPageNo(pageNo);
		List<productBean> list = pService.getProductByReviewDesc(QueryString);
		int totalPages = pService.getQueryPages(QueryString);
		orderItem oi = new orderItem();
		mav.addObject("totalPages", totalPages);
		mav.addObject("productList", list);
		mav.addObject("orderItem", oi);
		session.setAttribute("pageNo", pageNo);
		session.setAttribute("MappingPath", "ReviewDesc");
		return mav;
	}

	// 商品查詢
	@RequestMapping(value = "/QueryProduct/{pageNo}", method = RequestMethod.GET)
	public ModelAndView QueryProduct(HttpSession session, @PathVariable Integer pageNo, HttpServletRequest request) {
		if (pageNo == null) {
			pageNo = 1;
		}
		String QueryString = request.getParameter("QueryString");
		if (QueryString == null) {
			QueryString = (String) session.getAttribute("QueryString");
		}
		ModelAndView mav = new ModelAndView("product/products");
		pService.setPageNo(pageNo);
		List<productBean> list = pService.QueryProduct(QueryString);
		int totalPages = pService.getQueryPages(QueryString);
		orderItem oi = new orderItem();
		mav.addObject("totalPages", totalPages);
		mav.addObject("productList", list);
		mav.addObject("orderItem", oi);
		session.setAttribute("pageNo", pageNo);
		session.setAttribute("MappingPath", "QueryProduct");
		session.setAttribute("QueryString", QueryString);
		return mav;
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
	@RequestMapping(value = "/showPic/{pId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> showPic(HttpServletResponse resp, @PathVariable Integer pId) {
		productBean pb = pService.getProduct(pId);
		String filePath = "/WEB-INF/resource/img/NoImage.jpg";
		String filename = "";
		int len = 0;
		HttpHeaders headers = new HttpHeaders();
		byte[] mediaByte = null;
		if (pb != null) {
			Blob blob = pb.getpPicture();
			filename = pb.getpFileName();
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
				throw new RuntimeException("ProductController的getPic發生例外:" + e.getMessage());
			}
		} else {
			filename = filePath;
			mediaByte = toByte(filePath);
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ResponseEntity<byte[]> resEntity = new ResponseEntity<>(mediaByte, headers, HttpStatus.OK);
		return resEntity;
	}

}
