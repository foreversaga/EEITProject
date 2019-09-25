package product.service;

import java.util.List;

import product.model.productBean;

public interface productService {
	List<productBean> getAllProduct();

	List<productBean> getProductByPriceDesc(String QueryString);

	List<productBean> getProductByPriceAsc(String QueryString);

	List<productBean> getProductByReviewDesc(String QueryString);

	List<productBean> getProductByReviewAsc(String QueryString);

	List<productBean> QueryProduct(String QueryString);

	List<productBean> getPopularFive();

	int getTotalPages();

	int getQueryPages(String QueryString);

	Long getDataCount();

	Long getQueryCount(String QueryString);

	productBean getProduct(int pId);

	int getPageNo();

	int insertNewProduct(productBean pb);

	void setPageNo(int pageNo);

	int updateStock(int pId, int newStock);

	void updateRating(int pId, int rRating);
	
	void updateAmendRating(int pId, int oldRating, int newRating);

	void updatePopular(int pId, int pPopular);
	
	void updateAvgRating(int pId);
	
	void UpdateProduct(productBean pb);
	
	public List<productBean> getAllProductList();
}
