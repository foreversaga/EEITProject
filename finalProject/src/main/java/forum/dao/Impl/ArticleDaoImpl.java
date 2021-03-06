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
import forum.model.ThumbBean;
import review.model.reviewBean;

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
		session.saveOrUpdate(arb);

	}

	@Override
	public void AddThumb(ThumbBean tb) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(tb);
	}

	@Override
	public ThumbBean getArticleThumb(Integer aId, Integer mId) {
		ThumbBean tb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM ThumbBean tb WHERE tb.aId =:aId and tb.mId =:mId";
		tb = (ThumbBean) session.createQuery(hql).setParameter("aId", aId).setParameter("mId", mId).uniqueResult();
		return tb;
	}

	@Override
	public ThumbBean getReplyThumb(Integer arId, Integer mId) {
		ThumbBean tb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM ThumbBean tb WHERE tb.arId =:arId and tb.mId =:mId";
		tb = (ThumbBean) session.createQuery(hql).setParameter("arId", arId).setParameter("mId", mId).uniqueResult();
		return tb;
	}

	@Override
	public Long getArticleThumbCount(Integer aId, Integer Thumb) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM ThumbBean tb WHERE tb.aId =:aId and tb.atThumb =:thumb";
		Long n = (Long) session.createQuery(hql).setParameter("aId", aId).setParameter("thumb", Thumb).uniqueResult();
		return n;
	}

	@Override
	public Long getReplyThumbCount(Integer arId, Integer Thumb) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM ThumbBean tb WHERE tb.arId =:arId and tb.atThumb =:thumb";
		Long n = (Long) session.createQuery(hql).setParameter("arId", arId).setParameter("thumb", Thumb).uniqueResult();
		return n;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> getIndexArticle(Integer num) {
		Session session = factory.getCurrentSession();
		List<ArticleBean> list = null;
		String hql = "FROM ArticleBean ORDER BY newID()";
		list = session.createQuery(hql).setMaxResults(num).list();
		return list;
	}

}
