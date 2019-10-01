package forum.dao;

import java.util.List;

import forum.model.ArticleBean;
import forum.model.ArticleReplyBean;

public interface ArticleDao {

	public void setPageNo(int pageNo);
	
	public int getPageNo();

	public Long getDataCount();
	
	public ArticleBean getArticle(Integer aId);
	
	public void EditReply(ArticleReplyBean arb);

	public ArticleReplyBean getOneReply(Integer arId);
	
	public void PostArticle(ArticleBean ab);
	
	public void ReplyArticle(ArticleBean ab);
	
	public List<ArticleBean> getAllArticle();
	
	public List<ArticleReplyBean> getArticleReply(Integer aId);
}
