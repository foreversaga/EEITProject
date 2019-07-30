package product.daoImpl;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import product.dao.productDao;
import product.model.productBean;

public class productDaoImpl implements productDao,Serializable{
	private static final long serialVersionUID = 1L;
	private int pID = 0;
	private int pageNo = 0;
	private int recordsPerPage = 3;
	private int totalPages = -1;
	DataSource ds = null;

	public productDaoImpl() {
try {
	Context ctx=new InitialContext();
	ds=(DataSource) ctx.lookup(GlobalService.JNDI_DB);
}catch(Exception e) {
	e.printStackTrace();
	throw new RuntimeException("productDaoImpl建構子發生例外:"+e.getMessage());
}
	}
	@Override
	public List<productBean> getProduct() {
	productBean pb=null;
	String sql="SELECT * FROM product";
	List<productBean> list=new ArrayList<productBean>();
	try(Connection conn=ds.getConnection();
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();)
	{
			while(rs.next()) {
				pb=new productBean();
				pb.setpID(rs.getInt("pID"));
				pb.setpName(rs.getString(2));
				pb.setPinStock(rs.getInt(3));
				pb.setpPrice(rs.getInt(4));
				pb.setpContent(rs.getString(5));
				pb.setpType(rs.getString(6));
				pb.setpArea(rs.getString(7));
				pb.setpPopular(rs.getInt(8));
				pb.setpPicture(rs.getBlob(9));
				pb.setpRating(rs.getInt(10));
				pb.setpAvgRating(rs.getDouble(11));
				pb.setpDateRange(rs.getDate(12));
			list.add(pb);
		}
	} catch (SQLException e) {
		e.printStackTrace();
		throw new RuntimeException("productDaoImpl_getProduct發生例外:"+e.getMessage());
	}
		return list;
	}
	@Override
	public void insertOrder() {
		// TODO Auto-generated method stub
		
	}

}
