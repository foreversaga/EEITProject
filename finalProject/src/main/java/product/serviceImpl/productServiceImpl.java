package product.serviceImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import config.GlobalService;
import product.Dao.productDao;
import product.model.productBean;
import product.service.productService;

@Transactional
@Service
public class productServiceImpl implements productService {
	productDao pdao;
	SessionFactory factory;

	public productDao getPdao() {
		return pdao;
	}

	public SessionFactory getFactory() {
		return factory;
	}

	@Autowired
	public void setPdao(productDao pdao) {
		this.pdao = pdao;
	}

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public productServiceImpl() {

	}

	@Override
	public List<productBean> getAllProduct() {
		return pdao.getAllProduct();
	}

	@Override
	public int insertNewProduct(productBean pb) {
		int n = 0;
		pdao.insertNewProduct(pb);
		n++;
		return n;
	}

	@Override
	public productBean getProduct(int pId) {
		return pdao.getProduct(pId);
	}

	@Override
	public void setPageNo(int pageNo) {
		pdao.setPageNo(pageNo);

	}

	@Override
	public int getPageNo() {
		return pdao.getPageNo();
	}

	@Override
	public int getTotalPages() {
		int totalPages = (int) (Math.ceil(getDataCount() / (double) GlobalService.dataPerPage));
		return totalPages;
	}

	@Override
	public Long getDataCount() {

		return pdao.getDataCount();
	}

	@Override
	public int updateStock(int pId, int newStock) {
		return pdao.updateStock(pId, newStock);
	}

	@Override
	public void addProductDB() {
		pdao.addProductDB();
	}

	@Override
	public List<productBean> getPopularFive() {
		return pdao.getPopularFive();
	}



	@Override
	public List<productBean> getProductByPriceDesc() {
		return pdao.getProductByPriceDesc();
	}

	@Override
	public List<productBean> getProductByPriceAsc() {
		return pdao.getProductByPriceAsc();
	}

	@Override
	public List<productBean> getProductByReviewDesc() {
		return pdao.getProductByReviewDesc();
	}

	@Override
	public List<productBean> getProductByReviewAsc() {
		return pdao.getProductByReviewAsc();
	}
}
