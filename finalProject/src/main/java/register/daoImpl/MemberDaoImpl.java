package register.daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import register.dao.MemberDao;
import register.model.MemberBean;

public class MemberDaoImpl implements MemberDao {
	private DataSource ds = null;
	private Connection conn = null;

	public MemberDaoImpl() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ProjectDataSQLver");
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("MemberDaoImpl類別建構子發生例外:" + ex.getMessage());
		}
	}

	@Override
	public void setConnection(Connection conn) {
		this.conn = conn;

	}

	@Override
	public boolean checkAccount(String mAccount) {
		boolean exist = false;
		String sql = "SELECT * FROM member WHERE mAccount=?";
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, mAccount);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					exist = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("MemberDaoImpl類別checkAccount()發生例外:" + e.getMessage());
		}
		return exist;
	}

	@Override
	public int registerMember(MemberBean mb) {
		String sql = "INSERT INTO member(mAccount,mPassword,mName,mBirth,mPhone,mAddress,mID,mGender,mEmail)"
				+ "VALUES (?,?,?,?,?,?,?,?,?)";
		int n = 0;
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, mb.getmAccount());
			ps.setString(2, mb.getmPassword());
			ps.setString(3, mb.getmName());
			ps.setDate(4, mb.getmDate());
			ps.setInt(5, mb.getmPhone());
			ps.setString(6, mb.getmAddress());
			ps.setString(7, mb.getmID());
			ps.setString(8, mb.getmGender());
			ps.setString(9, mb.getmEmail());
			n = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("MemberDaoImpl類別registerMember()發生例外:" + e.getMessage());
		}
		return n;
	}

	@Override
	public MemberBean queryMember(String mAccount) {
		MemberBean mb = null;
		String sql = "SELECT * FROM member WHERE mAccount=?";
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, mAccount);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					mb = new MemberBean();
					mb.setmAccount(rs.getString("mAccount"));
					mb.setmPassword(rs.getString("mPassword"));
					mb.setmName(rs.getString("mName"));
					mb.setmDate(rs.getDate("mBirth"));
					mb.setmPhone(rs.getInt("mPhone"));
					mb.setmAddress(rs.getString("mAddress"));
					mb.setmID(rs.getString("mID"));
					mb.setmGender(rs.getString("mGender"));
					mb.setmEmail(rs.getString("mEmail"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("MemberDaoImpl類別queryMember()發生例外:" + e.getMessage());
		}
		return mb;
	}

	@Override
	public MemberBean checkPassword(String mAccount, String mPassword) {
		MemberBean mb = null;
		String sql = "SELECT * FROM member m WHERE m.mAccount=? AND m.mPassword=?";
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, mAccount);
			ps.setString(2, mPassword);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					mb = new MemberBean();
					mb.setmAccount(rs.getString("mAccount"));
					mb.setmPassword(rs.getString("mPassword"));
					mb.setmName(rs.getString("mName"));
					mb.setmDate(rs.getDate("mBirth"));
					mb.setmPhone(rs.getInt("mPhone"));
					mb.setmAddress(rs.getString("mAddress"));
					mb.setmID(rs.getString("mID"));
					mb.setmGender(rs.getString("mGender"));
					mb.setmEmail(rs.getString("mEmail"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("MemberDaoImpl類別checkPassword()發生例外:" + e.getMessage());
		}
		return mb;
	}

}
