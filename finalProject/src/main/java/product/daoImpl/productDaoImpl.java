package product.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

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
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

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

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> getPopularFive() {
		Session session = factory.getCurrentSession();
		List<productBean> list = null;
		String hql = "FROM productBean pb ORDER BY pb.pAvgRating desc";
		list = session.createQuery(hql).setMaxResults(5).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> getProductByPriceDesc(String QueryString) {
		List<productBean> list = new ArrayList<productBean>();
		Session session = factory.getCurrentSession();
		String sql = "";
		if (QueryString == null) {
			sql = "FROM productBean pb ORDER BY pb.pPrice desc";
			int startPage = (pageNo - 1) * GlobalService.dataPerPage;
			list = session.createQuery(sql).setFirstResult(startPage).setMaxResults(GlobalService.dataPerPage).list();
		} else {
			sql = "FROM productBean pb WHERE pb.pContent LIKE :query ORDER BY pb.pPrice desc";
			int startPage = (pageNo - 1) * GlobalService.dataPerPage;
			list = session.createQuery(sql).setParameter("query", "%" + QueryString + "%").setFirstResult(startPage)
					.setMaxResults(GlobalService.dataPerPage).list();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> getProductByPriceAsc(String QueryString) {
		List<productBean> list = new ArrayList<productBean>();
		Session session = factory.getCurrentSession();
		String sql = "";
		if (QueryString == null) {
			sql = "FROM productBean pb ORDER BY pb.pPrice";
			int startPage = (pageNo - 1) * GlobalService.dataPerPage;
			list = session.createQuery(sql).setFirstResult(startPage).setMaxResults(GlobalService.dataPerPage).list();
		} else {
			sql = "FROM productBean pb WHERE pb.pContent LIKE :query ORDER BY pb.pPrice";
			int startPage = (pageNo - 1) * GlobalService.dataPerPage;
			list = session.createQuery(sql).setParameter("query", "%" + QueryString + "%").setFirstResult(startPage)
					.setMaxResults(GlobalService.dataPerPage).list();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> getProductByReviewDesc(String QueryString) {
		List<productBean> list = new ArrayList<productBean>();
		Session session = factory.getCurrentSession();
		String sql = "";
		if (QueryString == null) {
			sql = "FROM productBean pb ORDER BY pb.pAvgRating desc";
			int startPage = (pageNo - 1) * GlobalService.dataPerPage;
			list = session.createQuery(sql).setFirstResult(startPage).setMaxResults(GlobalService.dataPerPage).list();
		} else {
			sql = "FROM productBean pb WHERE pb.pContent LIKE :query ORDER BY pb.pAvgRating desc";
			int startPage = (pageNo - 1) * GlobalService.dataPerPage;
			list = session.createQuery(sql).setParameter("query", "%" + QueryString + "%").setFirstResult(startPage)
					.setMaxResults(GlobalService.dataPerPage).list();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> getProductByReviewAsc(String QueryString) {
		List<productBean> list = new ArrayList<productBean>();
		Session session = factory.getCurrentSession();
		String sql = "";
		if (QueryString == null) {
			sql = "FROM productBean pb ORDER BY pb.pAvgRating";
			int startPage = (pageNo - 1) * GlobalService.dataPerPage;
			list = session.createQuery(sql).setFirstResult(startPage).setMaxResults(GlobalService.dataPerPage).list();
		} else {
			sql = "FROM productBean pb WHERE pb.pContent LIKE :query ORDER BY pb.pAvgRating";
			int startPage = (pageNo - 1) * GlobalService.dataPerPage;
			list = session.createQuery(sql).setParameter("query", "%" + QueryString + "%").setFirstResult(startPage)
					.setMaxResults(GlobalService.dataPerPage).list();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> QueryProduct(String QueryString) {
		List<productBean> list = new ArrayList<productBean>();
		Session session = factory.getCurrentSession();
		String sql = "FROM productBean pb WHERE pb.pContent LIKE :query";
		int startPage = (pageNo - 1) * GlobalService.dataPerPage;
		list = session.createQuery(sql).setParameter("query", "%" + QueryString + "%").setFirstResult(startPage)
				.setMaxResults(GlobalService.dataPerPage).list();
		return list;
	}

	@Override
	public Long getQueryCount(String QueryString) {
		Long n = null;
		Session session = factory.getCurrentSession();
		String sql = "SELECT COUNT(*) FROM productBean pb WHERE pb.pContent LIKE :query";
		n = (Long) session.createQuery(sql).setParameter("query", "%" + QueryString + "%").uniqueResult();
		return n;
	}

	@Override
	public void updateRating(int pId, int rRating) {
		Session session = factory.getCurrentSession();
		String sql = "FROM productBean pb WHERE pb.pId = :id";
		productBean pb = (productBean) session.createQuery(sql).setParameter("id", pId).uniqueResult();
		pb.setpRating(pb.getpRating() + rRating);
		session.update(pb);
	}

	@Override
	public void updatePopular(int pId, int pPopular) {
		Session session = factory.getCurrentSession();
		String sql = "FROM productBean pb WHERE pb.pId = :id";
		productBean pb = (productBean) session.createQuery(sql).setParameter("id", pId).uniqueResult();
		pb.setpPopular(pb.getpPopular() + pPopular);
		session.update(pb);
	}

	@Override
	public void updateAvgRating(int pId) {
		Session session = factory.getCurrentSession();
		String sql1 = "FROM productBean pb WHERE pb.pId = :id";
		String sql2 = "SELECT COUNT(*) FROM reviewBean rb WHERE rb.pId= :id";
		productBean pb = (productBean) session.createQuery(sql1).setParameter("id", pId).uniqueResult();
		Long n = (long) session.createQuery(sql2).setParameter("id", pId).uniqueResult();
		Double count = Double.parseDouble(n.toString());
		Double NewRating = (double) Math.round(pb.getpRating() / count);
		pb.setpAvgRating(NewRating);
		session.update(pb);
	}

	@Override
	public void updateAmendRating(int pId, int oldRating, int newRating) {
		Session session = factory.getCurrentSession();
		String sql = "FROM productBean pb WHERE pb.pId = :id";
		productBean pb = (productBean) session.createQuery(sql).setParameter("id", pId).uniqueResult();
		pb.setpRating(pb.getpRating() - oldRating + newRating);
		session.update(pb);
	}

	@Override
	public void UpdateProduct(productBean pb) {
		Session session = factory.getCurrentSession();
		session.update(pb);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<productBean> getAllProductList() {
		String hql = "From productBean";
		Session session = factory.getCurrentSession();
		List<productBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<productBean> getProductMap(int pId) {
		Session session = factory.getCurrentSession();
		String hql1 = "FROM productBean pb WHERE pb.pId = :id";
		String hql2 = "FROM productBean";
		productBean pb = (productBean) session.createQuery(hql1).setParameter("id", pId).uniqueResult();
		Double centerLat=Double.parseDouble(pb.getpLat());
		Double centerLng=Double.parseDouble(pb.getpLng());
		List<productBean> mapList = new ArrayList<>();
		List<productBean> allList = session.createQuery(hql2).list();
		for (productBean allListPb : allList) {
			Double pbLat = Double.parseDouble(allListPb.getpLat());
			Double pbLng = Double.parseDouble(allListPb.getpLng());
			if (Math.abs(pbLat - centerLat) < 0.5&&Math.abs(pbLng - centerLng) < 0.5) {
				mapList.add(allListPb);
			}
		}
		return mapList;
	}

}
