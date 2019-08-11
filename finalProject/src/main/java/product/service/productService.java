package product.service;

import java.util.List;

import product.model.productBean;

public interface productService {
	List<productBean> getAllProduct();
	
	int insertNewProduct(productBean pb);
	
	productBean getProduct(int pID);
}
