package register.dao;

import java.sql.Connection;
import java.util.List;

import product.model.productBean;
import register.model.MemberBean;

public interface MemberDao {
	public void setConnection(Connection conn);

	public boolean checkAccount(String mAccount);

	public int registerMember(MemberBean mb);

	public MemberBean queryMember(String mAccount);

	public MemberBean checkPassword(String mAccount, String mPassword);

	public void updateMember(MemberBean mb);
	
	
}
