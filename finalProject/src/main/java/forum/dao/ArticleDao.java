package forum.dao;

import java.util.List;

import forum.model.ArticleBean;
import forum.model.ArticleReplyBean;
import forum.model.ThumbBean;

public interface ArticleDao {

	public void setPageNo(int pageNo);

	public int getPageNo();

	public Long getDataCount();

	public void EditReply(ArticleReplyBean arb);

	public void PostArticle(ArticleBean ab);

	public void ReplyArticle(ArticleBean ab);

	public void AddThumb(ThumbBean tb);

	public ArticleBean getArticle(Integer aId);

	public ArticleReplyBean getOneReply(Integer arId);

	public ThumbBean getArticleThumb(Integer aId, Integer mId);

	public ThumbBean getReplyThumb(Integer arId, Integer mId);

	public Long getArticleThumbCount(Integer aId, Integer Thumb);
	
	public Long getReplyThumbCount(Integer arId, Integer Thumb);

	public List<ArticleBean> getAllArticle();

	public List<ArticleBean> getIndexArticle(Integer num);

	public List<ArticleReplyBean> getArticleReply(Integer aId);
}
