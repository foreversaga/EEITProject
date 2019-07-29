package register.service;

import register.model.MemberBean;

public interface MemberService {
	boolean accountCheck(String mAccount);

	int registerMember(MemberBean mb);

	MemberBean queryMember(String mAccount);

	public MemberBean checkPassword(String mAccount, String mPassword);
}
