package product.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import login.HibernateUtils;
import product.Dao.productDao;
import product.model.productBean;

public class productDaoImpl implements productDao {
	private DataSource ds;
	SessionFactory factory;

	public productDaoImpl() {
		factory = HibernateUtils.getSessionFactory();
	}

	@Override
	public void setConnection(Connection conn) {
//		this.conn = conn;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> getAllProduct() {
		List<productBean> list = new ArrayList<productBean>();
		Session session = factory.getCurrentSession();
		String sql = "FROM productBean";
		list = session.createQuery(sql).list();
		return list;
	}

	@Override
	public int insertNewProduct(productBean pb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(pb);
		n++;
		return n;
	}

}
