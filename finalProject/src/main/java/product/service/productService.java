package product.service;

import java.util.List;

import product.model.productBean;

public interface productService {
	List<productBean> getAllProduct();
	
	Long getTotalPages();
	
	int insertNewProduct(productBean pb);
	
	productBean getProduct(int pId);
	
	void setPageNo(int pageNo);
	
	int getPageNo();
	
	void setDataPerPage(int dataPerPage);
	
	int getDataPerPage();
}
