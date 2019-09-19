package review.daoimpl;

import java.util.ArrayList;
import java.util.List;

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

}
