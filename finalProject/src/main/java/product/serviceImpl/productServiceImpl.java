package product.serviceImpl;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import product.dao.productDao;
import product.model.productBean;
import product.service.productService;
import register.dao.MemberDao;

public class productServiceImpl implements productService {
	private DataSource ds;
	private productDao pdao;
	private MemberDao mdao;

	public productServiceImpl() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ProjectDataSQLver");
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public List<productBean> getAllOrders() {
		// TODO Auto-generated method stub
		return null;
	}

}
