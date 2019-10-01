package forum.service;

import java.util.List;

import forum.model.ArticleBean;
import forum.model.ArticleReplyBean;

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
}
