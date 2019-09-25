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
	public int getQueryPages(String QueryString) {
		int QueryPages = (int) (Math.ceil(getQueryCount(QueryString) / (double) GlobalService.dataPerPage));
		return QueryPages;
	}
	
	@Override
	public Long getDataCount() {

		return pdao.getDataCount();
	}
	
	@Override
	public Long getQueryCount(String QueryString) {
		return pdao.getQueryCount(QueryString);
	}

	@Override
	public int updateStock(int pId, int newStock) {
		return pdao.updateStock(pId, newStock);
	}

	@Override
	public List<productBean> getPopularFive() {
		return pdao.getPopularFive();
	}



	@Override
	public List<productBean> getProductByPriceDesc(String QueryString) {
		return pdao.getProductByPriceDesc(QueryString);
	}

	@Override
	public List<productBean> getProductByPriceAsc(String QueryString) {
		return pdao.getProductByPriceAsc(QueryString);
	}

	@Override
	public List<productBean> getProductByReviewDesc(String QueryString) {
		return pdao.getProductByReviewDesc(QueryString);
	}

	@Override
	public List<productBean> getProductByReviewAsc(String QueryString) {
		return pdao.getProductByReviewAsc(QueryString);
	}

	@Override
	public List<productBean> QueryProduct(String QueryString) {
		return pdao.QueryProduct(QueryString);
	}

	@Override
	public void updateRating(int pId, int rRating) {
		pdao.updateRating(pId, rRating);
	}

	@Override
	public void updatePopular(int pId, int pPopular) {
		pdao.updatePopular(pId, pPopular);
	}

	@Override
	public void updateAvgRating(int pId) {
		pdao.updateAvgRating(pId);
	}

	@Override
	public void updateAmendRating(int pId, int oldRating, int newRating) {
		pdao.updateAmendRating(pId, oldRating, newRating);
	}


}
