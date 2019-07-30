package product.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import product.Dao.productDao;
import product.model.productBean;

public class productDaoImpl implements productDao{
	private DataSource ds;
	private productDao pdao;
	private Connection conn = null;

	public productDaoImpl() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ProjectDataSQLver");
		} catch (Exception e) {
			throw new RuntimeException("productDaoImpl建構子發生例外"+e.getMessage());
		}
	}

	@Override
	public void setConnection(Connection conn) {
		this.conn=conn;
		
	}

	@Override
	public List<productBean> getAllProduct() {
		List<productBean> list=new ArrayList<productBean>();
		productBean pb=null;
		String sql="SELECT * FROM product";
		try(Connection con=ds.getConnection();
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();)
		{
			while(rs.next()) {
				pb=new productBean();
				pb.setpID(rs.getInt("pID"));
				pb.setpName(rs.getString("pName"));
				pb.setPinStock(rs.getInt("PinStock"));
				pb.setpPrice(rs.getInt("pPrice"));
				list.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("productSer");
		}
		return list;
	}

}
