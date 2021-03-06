package forum.service;

import java.util.List;

import forum.model.ArticleBean;
import forum.model.ArticleReplyBean;
import forum.model.ThumbBean;

public interface ArticleService {

	public void setPageNo(int pageNo);

	public int getPageNo();

	public int getTotalPages();

	public Long getDataCount();

	public ArticleBean getArticle(Integer aId);

	public ArticleReplyBean getOneReply(Integer arId);

	public void EditReply(ArticleReplyBean arb);

	public void PostArticle(ArticleBean ab);

	public void ReplyArticle(ArticleBean ab);

	public List<ArticleBean> getAllArticle();

	public List<ArticleReplyBean> getArticleReply(Integer aId);

	public void AddThumb(ThumbBean tb);

	public ThumbBean getArticleThumb(Integer aId, Integer mId);
	
	public ThumbBean getReplyThumb(Integer arId, Integer mId);
	
	public Long getArticleThumbCount(Integer aId,Integer Thumb);
	
	public Long getReplyThumbCount(Integer arId,Integer Thumb);
	
	public List<ArticleBean> getIndexArticle(Integer num);
}
