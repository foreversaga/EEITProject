package register.serviceImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import product.model.productBean;
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
//		this.dao = new MemberDaoImpl();
//		factory = HibernateUtils.getSessionFactory();
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
	public MemberBean getMemberBymId(int mId) {
		MemberBean mb = null;
		mb = dao.getMemberBymId(mId);
		return mb;
	}
	
	@Transactional
	@Override
	public void updateMember(MemberBean mb) {
		if (mb.getmAccount() != null && mb.getmPassword() != null) {
			dao.updateMember(mb);
		}
	}


}
