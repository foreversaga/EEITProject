package order.serviceImpl;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import order.dao.orderDao;
import order.model.orderBean;
import order.service.orderService;
import register.dao.MemberDao;

public class orderServiceImpl implements orderService {
private DataSource ds;
private orderDao odao;
private MemberDao mdao;
	
	public orderServiceImpl() {
try {
	Context ctx=new InitialContext();
	ds=ctx.lookup()
}catch(Exception e) {
	throw new RuntimeException(e.getMessage());
}
	}
	
	@Override
	public List<orderBean> getAllOrders() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<orderBean> getMemberOrders(String oAccount) {
		// TODO Auto-generated method stub
		return null;
	}



}
