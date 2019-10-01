package forum.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import config.GlobalService;
import forum.dao.ArticleDao;
import forum.model.ArticleBean;
import forum.model.ArticleReplyBean;

@Repository
public class ArticleDaoImpl implements ArticleDao {
	int pageNo = 0;
	@Autowired
	SessionFactory factory;

	@Override
	public void PostArticle(ArticleBean ab) {
		Session session = factory.getCurrentSession();
		session.save(ab);
	}

	@Override
	public void ReplyArticle(ArticleBean ab) {
		Session session = factory.getCurrentSession();
		session.update(ab);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getAllArticle() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ArticleBean";
		int startPage = (pageNo - 1) * GlobalService.dataPerPage;
		List<ArticleBean> list = null;
		list = session.createQuery(hql).setFirstResult(startPage).setMaxResults(GlobalService.dataPerPage).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleReplyBean> getArticleReply(Integer aId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ArticleReplyBean arb WHERE arb.ArticleBean.aId = :aId";
		List<ArticleReplyBean> list = null;
		list = session.createQuery(hql).setParameter("aId", aId).list();
		return list;
	}

	@Override
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;

	}

	@Override
	public int getPageNo() {
		return pageNo;
	}

	@Override
	public Long getDataCount() {
		Long n = null;
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM ArticleBean";
		n = (Long) session.createQuery(hql).uniqueResult();
		return n;
	}

	@Override
	public ArticleBean getArticle(Integer aId) {
		ArticleBean ab = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM ArticleBean ab WHERE ab.aId = :id";
		ab = (ArticleBean) session.createQuery(hql).setParameter("id", aId).uniqueResult();
		return ab;
	}

	@Override
	public ArticleReplyBean getOneReply(Integer arId) {
		ArticleReplyBean arb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM ArticleReplyBean arb WHERE arb.arId = :id";
		arb = (ArticleReplyBean) session.createQuery(hql).setParameter("id", arId).uniqueResult();
		return arb;
	}

	@Override
	public void EditReply(ArticleReplyBean arb) {
		Session session = factory.getCurrentSession();
		session.update(arb);

	}

}
