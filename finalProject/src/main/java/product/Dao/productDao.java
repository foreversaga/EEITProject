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

	public List<productBean> getPopularFive();
	
	public List<productBean> getProductMap(int pId);

	public Long getDataCount();

	public Long getQueryCount(String QueryString);

	public productBean getProduct(int pId);

	public int getPageNo();

	public int insertNewProduct(productBean pb);

	public int updateStock(int pId, int newStock);

	public void setPageNo(int pageNo);

	public void updateRating(int pId, int rRating);

	public void updateAmendRating(int pId, int oldRating, int newRating);
	
	public void updatePopular(int pId, int pPopular);
	
	public void updateAvgRating(int pId);
	
	void UpdateProduct(productBean pb);
	
	public List<productBean> getAllProductList();
}
