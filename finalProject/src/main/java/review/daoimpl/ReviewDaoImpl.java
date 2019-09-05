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
	public List<reviewBean> getAllReview() {
		String hql = "FROM Review";
		Session session = null;
		List<reviewBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

}
