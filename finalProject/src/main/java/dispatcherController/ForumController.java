package dispatcherController;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import forum.model.ArticleBean;
import forum.model.ArticleReplyBean;
import forum.model.ThumbBean;
import forum.service.ArticleService;
import register.model.MemberBean;

@Controller
public class ForumController {
	@Autowired
	ArticleService aService;

	@RequestMapping("/ForumIndex/{pageNo}")
	public String ForumIndex(@PathVariable Integer pageNo, Model model, HttpSession session) {
		ThumbBean tb = new ThumbBean();
		ArticleBean newAb = new ArticleBean();
		aService.setPageNo(pageNo);
		int totalPage = aService.getTotalPages();
		List<ArticleBean> list = aService.getAllArticle();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (ArticleBean ab : list) {
			if (ab.getaContent().length() > 50) {
				String precontent = ab.getaContent().substring(0, 50) + "...";
				ab.setaContent(precontent);
			}
			String NewLike = aService.getArticleThumbCount(ab.getaId(), 0).toString();
			String NewDislike = aService.getArticleThumbCount(ab.getaId(), 1).toString();
			ab.setaLike(NewLike);
			ab.setaDislike(NewDislike);
			
		}
		String ArticlePage = "ForumIndex";
		session.setAttribute("ArticlePage", ArticlePage);
		model.addAttribute("totalPages", totalPage);
		model.addAttribute("ArticleList", list);
		model.addAttribute("ArticleBean", newAb);
		model.addAttribute("ThumbBean", tb);
		session.setAttribute("pageNo", pageNo);
		return "forum/ForumIndex";
	}

	@RequestMapping("/PostArticle")
	public String PostNewArticle(@ModelAttribute("ArticleBean") ArticleBean ab, HttpSession session,
			HttpServletRequest request) {

		try {
			MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
			ArticleReplyBean arb = new ArticleReplyBean();
			Set<ArticleReplyBean> reply = new LinkedHashSet<>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
			String PostTime = sdf.format(new Timestamp(System.currentTimeMillis()));
			String Content = request.getParameter("aContent");
			String Title = request.getParameter("aTitle");
			if (Content == null || Title == null) {
				Content = (String) session.getAttribute("aContent");
				Title = (String) session.getAttribute("aTitle");
			}
			reply.add(arb);
			ab.setmId(mb.getmId());
			ab.setmName(mb.getmName());
			ab.setaAddTime(new Timestamp(sdf.parse(PostTime).getTime()));
			ab.setaContent(Content);
			ab.setaTitle(Title);
			ab.setaDisplay(1);
			if (Content.length() > 30) {
				ab.setaPreContent(Content.substring(0, 30) + "...");
			} else {
				ab.setaPreContent(Content.substring(0, Content.length()));
			}
			aService.PostArticle(ab);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return "redirect:/ForumIndex/1";
	}

	@RequestMapping("/ShowArticle/{aId}")
	public String ShowArticle(@PathVariable Integer aId, HttpSession session, Model model) {
		ArticleBean ab = aService.getArticle(aId);
		ArticleReplyBean newarb = new ArticleReplyBean();
		ThumbBean tb = new ThumbBean();
		String alike = aService.getArticleThumbCount(aId, 0).toString();
		String adislike = aService.getArticleThumbCount(aId, 1).toString();
		List<ArticleReplyBean> list = aService.getArticleReply(aId);
		ab.setaLike(alike);
		ab.setaDislike(adislike);
		aService.ReplyArticle(ab);
		for (ArticleReplyBean arb : list) {
			String arlike = aService.getReplyThumbCount(arb.getArId(), 0).toString();
			String ardislike = aService.getReplyThumbCount(arb.getArId(), 1).toString();
			arb.setArLike(arlike);
			arb.setArDislike(ardislike);
			aService.EditReply(arb);
		}
		String ArticlePage = "ShowArticle";
		session.setAttribute("ArticlePage", ArticlePage);
		model.addAttribute("ReplyList", list);
		model.addAttribute("ArticleBean", ab);
		model.addAttribute("ThumbBean", tb);
		model.addAttribute("ArticleReplyBean", newarb);
		return "forum/ArticlePage";
	}

	@RequestMapping("/ReplyArticle/{aId}")
	public String ReplyArticle(@PathVariable Integer aId, @ModelAttribute("ArticleReplyBean") ArticleReplyBean arb,
			HttpServletRequest request, HttpSession session) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		StringBuilder sb = new StringBuilder();
		try {
			ArticleBean ab = aService.getArticle(aId);
			Set<ArticleReplyBean> reply = new LinkedHashSet<>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
			String PostTime = sdf.format(new Timestamp(System.currentTimeMillis()));
			arb.setArAddTime(new Timestamp(sdf.parse(PostTime).getTime()));
			reply.add(arb);
			ab.setReplySet(reply);
			arb.setmId(mb.getmId());
			arb.setmName(mb.getmName());
			arb.setArticleBean(ab);
			aService.ReplyArticle(ab);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		sb.append("redirect:/ShowArticle/").append(aId);
		return sb.toString();
	}

	@RequestMapping("/EditArticle")
	public String EditArticle(@ModelAttribute("ArticleBean") ArticleBean ab, HttpServletRequest request,
			HttpSession session) {
		ArticleBean OriginAb = aService.getArticle(ab.getaId());
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
		String PostTime = sdf.format(new Timestamp(System.currentTimeMillis()));
		String Content = request.getParameter("aContent");
		try {
			ab.setaEditTime(new Timestamp(sdf.parse(PostTime).getTime()));
			ab.setaAddTime(OriginAb.getaAddTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		ab.setmId(mb.getmId());
		ab.setmName(mb.getmName());
		ab.setaContent(Content);
		if (Content.length() > 30) {
			ab.setaPreContent(Content.substring(0, 30) + "...");
		} else {
			ab.setaPreContent(Content.substring(0, Content.length()));
		}
		aService.ReplyArticle(ab);
		StringBuilder sb = new StringBuilder();
		String aId = (String) request.getParameter("aId");
		sb.append("redirect:/ShowArticle/").append(aId);
		return sb.toString();
	}

	@RequestMapping("/EditReply")
	public String EditReply(@ModelAttribute("ArticleReplyBean") ArticleReplyBean arb, HttpServletRequest request,
			HttpSession session) {
		ArticleBean ab = aService.getArticle(Integer.parseInt(request.getParameter("aId")));
		ArticleReplyBean OriginArb = aService.getOneReply(arb.getArId());
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
		String PostTime = sdf.format(new Timestamp(System.currentTimeMillis()));
		String Content = request.getParameter("arContent");
		try {
			OriginArb.setArEditTime(new Timestamp(sdf.parse(PostTime).getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		OriginArb.setArContent(Content);
		aService.EditReply(OriginArb);
		StringBuilder sb = new StringBuilder();
		String aId = (String) request.getParameter("aId");
		sb.append("redirect:/ShowArticle/").append(aId);
		return sb.toString();
	}

	@RequestMapping("/AddThumb/{thumb}/{Id}/{ArticleReply}")
	public String AddThumb(@PathVariable Integer thumb, @PathVariable Integer Id, @PathVariable String ArticleReply,
			@ModelAttribute("ThumbBean") ThumbBean tb, HttpSession session, HttpServletRequest request) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		StringBuilder sb = new StringBuilder();
		if (ArticleReply.equals("Article")) {
			ThumbBean checkTb = aService.getArticleThumb(Id, mb.getmId());
			if (checkTb != null) {
				checkTb.setAtThumb(thumb);
				aService.AddThumb(checkTb);
			} else {
				tb.setAtThumb(thumb);
				tb.setmId(mb.getmId());
				tb.setaId(Id);
				aService.AddThumb(tb);
			}
			String NewLike = aService.getArticleThumbCount(Id, 0).toString();
			String NewDislike = aService.getArticleThumbCount(Id, 1).toString();
			ArticleBean ab = aService.getArticle(Id);
			ab.setaLike(NewLike);
			ab.setaDislike(NewDislike);
			aService.ReplyArticle(ab);
			String page = (String) session.getAttribute("ArticlePage");
			if (page.equals("ShowArticle")) {
				sb.append("redirect:/ShowArticle/").append(Id);
			} else {
				sb.append("redirect:/ForumIndex/1");
			}
			return sb.toString();
		} else {
			ThumbBean checkTb = aService.getReplyThumb(Id, mb.getmId());
			if (checkTb != null) {
				checkTb.setAtThumb(thumb);
				aService.AddThumb(checkTb);
			} else {
				tb.setAtThumb(thumb);
				tb.setmId(mb.getmId());
				tb.setArId(Id);
				aService.AddThumb(tb);
			}
			String NewLike = aService.getReplyThumbCount(Id, 0).toString();
			String NewDislike = aService.getReplyThumbCount(Id, 1).toString();
			ArticleReplyBean arb = aService.getOneReply(Id);
			arb.setArLike(NewLike);
			arb.setArDislike(NewDislike);
			aService.EditReply(arb);
			String page = (String) session.getAttribute("ArticlePage");
			if (page.equals("ShowArticle")) {
				sb.append("redirect:/ShowArticle/").append(Id);
			} else {
				sb.append("redirect:/ForumIndex/1");
			}
		}
		return sb.toString();
	}
}
