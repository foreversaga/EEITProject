package review.daoimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import review.dao.ReviewDao;
import review.model.reviewBean;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	@Override
	@SuppressWarnings("unchecked")
	public List<reviewBean> getAllReviews() {
		String hql = "From reviewBean";
		Session session = factory.getCurrentSession();
		List<reviewBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void InsertNewReview(reviewBean rb) {
		Session session = factory.getCurrentSession();
		session.save(rb);
	}

	@Override
	public reviewBean getOrderItemReview(Integer pId, String mAccount) {
		Session session = factory.getCurrentSession();
		reviewBean rb = null;
		String hql = "FROM reviewBean rb WHERE rb.pId=:pid AND rb.mAccount=:account";
		rb = (reviewBean) session.createQuery(hql).setParameter("pid", pId).setParameter("account", mAccount)
				.uniqueResult();
		return rb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<reviewBean> getProductReview(Integer pId) {
		Session session = factory.getCurrentSession();
		List<reviewBean> rb = null;
		String hql = "FROM reviewBean rb WHERE rb.pId=:pid";
		rb = session.createQuery(hql).setParameter("pid", pId).list();
		return rb;
	}

	@Override
	public void UpdateReview(reviewBean rb) {
		Session session = factory.getCurrentSession();
		session.update(rb);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<reviewBean> getIndexReview(Integer num) {
		Session session = factory.getCurrentSession();
		List<reviewBean> list = null;
		String hql = "FROM reviewBean ORDER BY newID()";
		list = session.createQuery(hql).setMaxResults(num).list();
		return list;
	}

	@Override
	public reviewBean getReview(int rId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM reviewBean rb WHERE rb.rId = :id";
		reviewBean rb = (reviewBean) session.createQuery(hql).setParameter("id", rId).uniqueResult();
		return rb;
	}

}
