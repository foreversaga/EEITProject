package forum.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import config.GlobalService;
import forum.dao.ArticleDao;
import forum.model.ArticleBean;
import forum.model.ArticleReplyBean;
import forum.model.ThumbBean;
import forum.service.ArticleService;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	ArticleDao dao;

	@Override
	public void PostArticle(ArticleBean ab) {
		dao.PostArticle(ab);
	}

	@Override
	public void ReplyArticle(ArticleBean ab) {
		dao.ReplyArticle(ab);
	}

	@Override
	public List<ArticleBean> getAllArticle() {
		return dao.getAllArticle();
	}

	@Override
	public List<ArticleReplyBean> getArticleReply(Integer aId) {
		return dao.getArticleReply(aId);
	}

	@Override
	public void setPageNo(int pageNo) {
		dao.setPageNo(pageNo);
	}

	@Override
	public int getPageNo() {
		return dao.getPageNo();
	}

	@Override
	public int getTotalPages() {
		int totalPages = (int) (Math.ceil(getDataCount() / (double) GlobalService.dataPerPage));
		return totalPages;
	}

	@Override
	public Long getDataCount() {
		return dao.getDataCount();
	}

	@Override
	public ArticleBean getArticle(Integer aId) {
		return dao.getArticle(aId);
	}

	@Override
	public ArticleReplyBean getOneReply(Integer arId) {
		return dao.getOneReply(arId);
	}

	@Override
	public void EditReply(ArticleReplyBean arb) {
		dao.EditReply(arb);
	}

	@Override
	public void AddThumb(ThumbBean tb) {
		dao.AddThumb(tb);
	}

	@Override
	public ThumbBean getArticleThumb(Integer aId, Integer mId) {
		return dao.getArticleThumb(aId, mId);
	}
	@Override
	public ThumbBean getReplyThumb(Integer arId, Integer mId) {
		return dao.getReplyThumb(arId, mId);
	}
	
	@Override
	public Long getArticleThumbCount(Integer aId, Integer Thumb) {
		return dao.getArticleThumbCount(aId, Thumb);
	}

	@Override
	public List<ArticleBean> getIndexArticle(Integer num) {
		return dao.getIndexArticle(num);
	}

	@Override
	public Long getReplyThumbCount(Integer arId, Integer Thumb) {
		return dao.getReplyThumbCount(arId, Thumb);
	}

}
