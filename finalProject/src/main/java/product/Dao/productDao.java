package product.Dao;

import java.util.List;

import product.model.productBean;

public interface productDao {

	public List<productBean> getAllProduct();

	public List<productBean> getProductByPriceDesc(String QueryString);
	
	public List<productBean> getProductByPriceAsc(String QueryString);
	
	public List<productBean> getProductByReviewDesc(String QueryString);
	
	public List<productBean> getProductByReviewAsc(String QueryString);
	
	public List<productBean> QueryProduct(String QueryString);
	
	public Long getDataCount();
	
	public Long getQueryCount(String QueryString);

	public int insertNewProduct(productBean pb);

	public productBean getProduct(int pId);

	public int getPageNo();

	public void setPageNo(int pageNo);

	public int updateStock(int pId, int newStock);
	
	public List<productBean> getPopularFive();
}
