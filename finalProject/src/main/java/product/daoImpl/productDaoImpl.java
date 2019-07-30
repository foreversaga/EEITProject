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

public class productDaoImpl implements productDao {
	private DataSource ds;
	private productDao pdao;
	private Connection conn = null;

	public productDaoImpl() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ProjectDataSQLver");
		} catch (Exception e) {
			throw new RuntimeException("productDaoImpl建構子發生例外" + e.getMessage());
		}
	}

	@Override
	public void setConnection(Connection conn) {
		this.conn = conn;

	}

	@Override
	public List<productBean> getAllProduct() {
		List<productBean> list = new ArrayList<productBean>();
		productBean pb = null;
		String sql = "SELECT * FROM product";
		try (Connection con = ds.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			while (rs.next()) {
				pb = new productBean();
				pb.setpDateRange(rs.getDate("pDateRange"));
				pb.setpName(rs.getString("pName"));
				pb.setPinStock(rs.getInt("PinStock"));
				pb.setpPrice(rs.getInt("pPrice"));
				pb.setpAvgRating(rs.getDouble("pAvgRating"));
				list.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("productDaoImpl發生錯誤:" + e.getMessage());
		}
		return list;
	}

	@Override
	public int insertNewProduct(productBean pb) {
		String sql = "INSERT INTO product (pName,pPrice,PinStock,pDateRange,pContent) VALUES (?,?,?,?,?)";
		int n=0;
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, pb.getpName());
			ps.setInt(2, pb.getpPrice());
			ps.setInt(3, pb.getPinStock());
			ps.setDate(4, pb.getpDateRange());
			ps.setString(5, pb.getpContent());
			n = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("productDaoImpl類別inserNewProduct發生例外:" + e.getMessage());
		}
		return n;
	}

}
