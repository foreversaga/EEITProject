package checkout.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cart.model.orderBean;
import checkout.dao.orderDao;
import checkout.dao.orderItemDao;
import checkout.dao.impl.orderDaoImpl;
import checkout.dao.impl.orderItemDaoImpl;
import checkout.service.orderService;
import login.HibernateUtils;
import register.dao.MemberDao;
import register.daoImpl.MemberDaoImpl;

@Service
public class orderServiceImpl implements orderService {
	private SessionFactory factory;
	private orderDao odao;
	private MemberDao mdao;
	private orderItemDao oidao;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Autowired
	public void setOdao(orderDao odao) {
		this.odao = odao;
	}

	@Autowired
	public void setMdao(MemberDao mdao) {
		this.mdao = mdao;
	}

	@Autowired
	public void setOidao(orderItemDao oidao) {
		this.oidao = oidao;
	}

	public orderServiceImpl() {
//		factory = HibernateUtils.getSessionFactory();
//		oidao = new orderItemDaoImpl();
//		odao = new orderDaoImpl();
//		mdao = new MemberDaoImpl();
	}

	@Override
	@Transactional
	public List<orderBean> getMemberOrders(String mAccount) {
		List<orderBean> list = null;
		list = odao.getMemberOrders(mAccount);
		return list;
	}

	@Override
	@Transactional
	public orderBean getOrder(int getoId) {
		orderBean ob = null;
		ob = odao.getOrder(getoId);
		return ob;
	}

	@Override
	@Transactional
	public void saveOrder(orderBean ob) {
		odao.saveOrder(ob);
	}

}
