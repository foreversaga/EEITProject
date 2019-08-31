package product.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import config.GlobalService;
import product.Dao.productDao;
import product.model.productBean;

@Repository
public class productDaoImpl implements productDao {
	int pageNo = 0;
	SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public productDaoImpl() {
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> getAllProduct() {
		List<productBean> list = new ArrayList<productBean>();
		Session session = factory.getCurrentSession();
		String sql = "FROM productBean";
		int startPage = (pageNo - 1) * GlobalService.dataPerPage;
		list = session.createQuery(sql).setFirstResult(startPage).setMaxResults(GlobalService.dataPerPage).list();
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

	@Override
	public productBean getProduct(int pId) {
		productBean pb = null;
		Session session = factory.getCurrentSession();
		String sql = "FROM productBean p WHERE p.pId=:pid";
		pb = (productBean) session.createQuery(sql).setParameter("pid", pId).uniqueResult();
		return pb;
	}

	@Override
	public Long getDataCount() {
		Long n = null;
		Session session = factory.getCurrentSession();
		String sql = "SELECT COUNT(*) FROM productBean";
		n = (Long) session.createQuery(sql).uniqueResult();
		return n;
	}

	@Override
	public int getPageNo() {
		return pageNo;
	}

	@Override
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public int updateStock(int pId, int newStock) {
		int n = 0;
		Session session = factory.getCurrentSession();
		String sql = "UPDATE productBean b SET b.pInstock = :stock WHERE b.pId = :id";
		n = session.createQuery(sql).setParameter("stock", newStock).setParameter("id", pId).executeUpdate();
		return n;
	}

}
