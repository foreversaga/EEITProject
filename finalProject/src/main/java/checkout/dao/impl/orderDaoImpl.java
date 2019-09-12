package checkout.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cart.model.orderBean;
import checkout.dao.orderDao;

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

	@Override
	public orderBean updateOrderAfterCheckout(int TradeNoDB, Timestamp paymentDate, String mAccount) {
		Session session = factory.getCurrentSession();
		String hql = "FROM orderBean ob WHERE ob.mAccount=:account and ob.oId=:id";
		orderBean ob = (orderBean) session.createQuery(hql).setParameter("account", mAccount)
				.setParameter("id", TradeNoDB).uniqueResult();
		ob.setoPaymentDate(paymentDate);
		ob.setoPaymentStatus("已付款");
		session.update(ob);
		return ob;
	}

}
