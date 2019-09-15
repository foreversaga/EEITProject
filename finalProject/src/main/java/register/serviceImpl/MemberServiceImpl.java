package register.serviceImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import register.dao.MemberDao;
import register.model.MemberBean;
import register.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	@Autowired
	SessionFactory factory;

	public MemberDao getDao() {
		return dao;
	}

	@Autowired
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	public SessionFactory getFactory() {
		return factory;
	}

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public MemberServiceImpl() {
	}

	@Override
	@Transactional
	public boolean accountCheck(String mAccount) {
		boolean check = false;
		check = dao.checkAccount(mAccount);
		return check;
	}

	@Override
	@Transactional
	public int registerMember(MemberBean mb) {
		int count = 0;
		dao.registerMember(mb);
		count++;
		return count;
	}

	@Override
	@Transactional
	public MemberBean queryMember(String mAccount) {
		MemberBean mb = null;
		mb = dao.queryMember(mAccount);
		return mb;
	}

	@Override
	@Transactional
	public MemberBean checkPassword(String mAccount, String mPassword) {
		MemberBean mb = null;
		mb = dao.checkPassword(mAccount, mPassword);
		return mb;
	}

	
	@Transactional
	@Override
	public void updateMember(MemberBean mb) {
		if (mb.getmAccount() != null && mb.getmPassword() != null && mb.getmAddress() != null && mb.getmEmail() != null && mb.getmPhone() != null) {
			dao.updateMember(mb);
		}
	}


}
