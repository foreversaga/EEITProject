package checkout.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cart.model.orderBean;
import cart.model.orderItemBean;
import checkout.dao.orderDao;
import checkout.dao.orderItemDao;
import checkout.dao.impl.orderDaoImpl;
import checkout.dao.impl.orderItemDaoImpl;
import checkout.service.orderService;
import login.HibernateUtils;
import register.dao.MemberDao;
import register.daoImpl.MemberDaoImpl;

@Transactional
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

	public SessionFactory getFactory() {
		return factory;
	}

	public orderDao getOdao() {
		return odao;
	}

	public MemberDao getMdao() {
		return mdao;
	}

	public orderItemDao getOidao() {
		return oidao;
	}

	public orderServiceImpl() {
	}

	@Override
	public List<orderBean> getMemberOrders(String mAccount) {
		return odao.getMemberOrders(mAccount);
	}

	@Override
	public orderBean getOrder(int getoId) {
		return odao.getOrder(getoId);
	}

	@Override
	public void saveOrder(orderBean ob) {
		odao.saveOrder(ob);
	}

	@Override
	public List<orderItemBean> getOrderItem(int oId) {
		return oidao.getOrderItem(oId);
	}

	@Override
	public orderBean updateOrderAfterCheckout(int TradeNoDB, Timestamp paymentDate, String mAccount) {
		return odao.updateOrderAfterCheckout(TradeNoDB, paymentDate, mAccount);
	}

}
