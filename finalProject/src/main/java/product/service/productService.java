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

	int getTotalPages();

	int getQueryPages(String QueryString);

	Long getDataCount();

	Long getQueryCount(String QueryString);

	int insertNewProduct(productBean pb);

	productBean getProduct(int pId);

	void setPageNo(int pageNo);

	int getPageNo();

	int updateStock(int pId, int newStock);

	void addProductDB();

	List<productBean> getPopularFive();
}
