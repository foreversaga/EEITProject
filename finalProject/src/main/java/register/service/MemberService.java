package register.service;

import java.util.List;

import product.model.productBean;
import register.model.MemberBean;

public interface MemberService {
	boolean accountCheck(String mAccount);

	int registerMember(MemberBean mb);

	MemberBean queryMember(String mAccount);

	public MemberBean checkPassword(String mAccount, String mPassword);
			
	
	void updateMember(MemberBean mb );
	
	MemberBean getMember(int mId);
	
	List<MemberBean> getAllMember();
}
