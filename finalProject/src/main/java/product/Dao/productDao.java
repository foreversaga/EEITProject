package product.Dao;

import java.util.List;

import product.model.productBean;

public interface productDao {

	public List<productBean> getAllProduct();

	public Long getDataCount();

	public int insertNewProduct(productBean pb);

	public productBean getProduct(int pId);

	public int getPageNo();

	public void setPageNo(int pageNo);

	public int updateStock(int pId, int newStock);

	public void addProductDB();
}
