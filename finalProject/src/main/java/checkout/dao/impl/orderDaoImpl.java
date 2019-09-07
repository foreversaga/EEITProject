package checkout.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cart.model.orderBean;
import checkout.dao.orderDao;
import login.HibernateUtils;

@Repository
public class orderDaoImpl implements orderDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public SessionFactory getFactory() {
		return factory;
	}

	private String mAccount = null;
	int oId = 0;

	public orderDaoImpl() {
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<orderBean> getMemberOrders(String mAccount) {
		List<orderBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM orderBean ob WHERE ob.mAccount=:mid";
		list = session.createQuery(hql).setParameter("mid", mAccount).list();
		return list;
	}

	@Override
	public orderBean getOrder(int oId) {
		orderBean ob = null;
		Session session = factory.getCurrentSession();
		ob = session.get(orderBean.class, oId);
		return ob;
	}

	@Override
	public void saveOrder(orderBean ob) {
		Session session = factory.getCurrentSession();
		session.save(ob);
	}

	public String getmAccount() {
		return mAccount;
	}

	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}

}
