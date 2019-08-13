package product.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import login.HibernateUtils;
import product.Dao.productDao;
import product.daoImpl.productDaoImpl;
import product.model.productBean;
import product.service.productService;

public class productServiceImpl implements productService {
	productDao pdao;
	SessionFactory factory;

	public productServiceImpl() {
		this.pdao = new productDaoImpl();
		factory = HibernateUtils.getSessionFactory();
	}

	@Override
	public List<productBean> getAllProduct() {
		List<productBean> list = null;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			list = pdao.getAllProduct();
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
	public int insertNewProduct(productBean pb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			pdao.insertNewProduct(pb);
			tx.commit();
			n++;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}

		return n;
	}

	@Override
	public productBean getProduct(int pId) {
		productBean pb = null;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			pb = pdao.getProduct(pId);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}
		return pb;
	}

	@Override
	public void setPageNo(int pageNo) {
		pdao.setPageNo(pageNo);

	}

	@Override
	public void setDataPerPage(int dataPerPage) {
		pdao.setDataPerPage(dataPerPage);

	}

	@Override
	public int getPageNo() {
		return pdao.getPageNo();
	}

	@Override
	public int getDataPerPage() {
		return pdao.getDataPerPage();
	}

}
