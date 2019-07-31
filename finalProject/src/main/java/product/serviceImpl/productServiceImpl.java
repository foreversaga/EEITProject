package product.serviceImpl;

import java.util.List;

import product.Dao.productDao;
import product.daoImpl.productDaoImpl;
import product.model.productBean;
import product.service.productService;

public class productServiceImpl implements productService {
	productDao pdao;

	public productServiceImpl() {
		this.pdao = new productDaoImpl();
	}

	@Override
	public List<productBean> getAllProduct() {

		return pdao.getAllProduct();
	}

	@Override
	public int insertNewProduct(productBean pb) {
	
		return pdao.insertNewProduct(pb);
	}

}
