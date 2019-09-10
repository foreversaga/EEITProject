package checkout.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cart.model.orderBean;
import cart.model.orderItemBean;
import checkout.dao.orderItemDao;
import checkout.service.orderService;

@Repository
public class orderItemDaoImpl implements orderItemDao {
	@Autowired
	SessionFactory factory;
	@Autowired
	orderService oService;

	public SessionFactory getSession() {
		return factory;
	}

	public void setSession(SessionFactory factory) {
		this.factory = factory;
	}

	public orderItemDaoImpl() {
	}

	@Override
	public int updateStock(orderItemBean ob) {
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<orderItemBean> getOrderItem(Integer oId) {
		List<orderItemBean> list = null;
		orderBean ob=oService.getOrder(oId);
		String hql = "FROM orderItemBean b WHERE b.orderBean=:oId";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("oId", ob).list();
		return list;
	}

}
