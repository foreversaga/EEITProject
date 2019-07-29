package register.serviceImpl;

import register.dao.MemberDao;
import register.daoImpl.MemberDaoImpl;
import register.model.MemberBean;
import register.service.MemberService;

public class MemberServiceImpl implements MemberService {
	MemberDao dao;

	@Override
	public boolean accountCheck(String mAccount) {
		return dao.checkAccount(mAccount);
	}

	public MemberServiceImpl() {
		this.dao = new MemberDaoImpl();
	}

	@Override
	public int registerMember(MemberBean mb) {
		return dao.registerMember(mb);
	}

	@Override
	public MemberBean queryMember(String mAccount) {
		return dao.queryMember(mAccount);
	}

	@Override
	public MemberBean checkPassword(String mAccount, String mPassword) {
		MemberBean mb = dao.checkPassword(mAccount, mPassword);
		return mb;
	}

}
