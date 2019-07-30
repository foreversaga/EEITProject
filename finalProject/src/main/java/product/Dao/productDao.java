package product.Dao;

import java.sql.Connection;
import java.util.List;

import product.model.productBean;

public interface productDao {
	public void setConnection(Connection conn);

	public List<productBean> getAllProduct();
	
	public int insertNewProduct(productBean pb);
}
