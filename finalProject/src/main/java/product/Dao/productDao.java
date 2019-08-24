package product.Dao;

import java.sql.Connection;
import java.util.List;

import product.model.productBean;

public interface productDao {
	public void setConnection(Connection conn);

	public List<productBean> getAllProduct();
	
	public Long getDataCount();
	
	public int insertNewProduct(productBean pb);
	
	public productBean getProduct(int pId);
	
	public int getPageNo();
	
	public int getDataPerPage();
	
	public void setPageNo(int pageNo);
	
	public void setDataPerPage(int dataPerPage);
}
