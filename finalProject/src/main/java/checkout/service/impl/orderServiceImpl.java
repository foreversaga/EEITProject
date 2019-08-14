package checkout.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import cart.model.orderBean;
import checkout.dao.orderDao;
import checkout.dao.orderItemDao;
import checkout.dao.impl.orderDaoImpl;
import checkout.dao.impl.orderItemDaoImpl;
import checkout.service.orderService;
import login.HibernateUtils;
import register.dao.MemberDao;
import register.daoImpl.MemberDaoImpl;

public class orderServiceImpl implements orderService {
	private SessionFactory factory;
	private orderDao odao;
	private MemberDao mdao;
	private orderItemDao oidao;

	public orderServiceImpl() {
		factory = HibernateUtils.getSessionFactory();
		oidao = new orderItemDaoImpl();
		odao = new orderDaoImpl();
		mdao = new MemberDaoImpl();
	}

	@Override
	public List<orderBean> getMemberOrders(String mAccount) {
		List<orderBean> list = null;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			list = odao.getMemberOrders(mAccount);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}
		return list;
	}

	@Override
	public orderBean getOrder(int getoId) {
		orderBean ob = null;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			ob = odao.getOrder(getoId);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}

		return ob;
	}

	@Override
	public void saveOrder(orderBean ob) {
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			odao.saveOrder(ob);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}
	}

}
