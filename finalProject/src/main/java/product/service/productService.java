package product.service;

import java.util.List;

import product.model.productBean;

public interface productService {
	List<productBean> getAllProduct();

	int getTotalPages();

	Long getDataCount();

	int insertNewProduct(productBean pb);

	productBean getProduct(int pId);

	void setPageNo(int pageNo);

	int getPageNo();

	int updateStock(int pId, int newStock);
}
