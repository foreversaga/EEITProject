package register.serviceImpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import login.HibernateUtils;
import register.dao.MemberDao;
import register.daoImpl.MemberDaoImpl;
import register.model.MemberBean;
import register.service.MemberService;

public class MemberServiceImpl implements MemberService {
	MemberDao dao;
	SessionFactory factory;

	public MemberServiceImpl() {
		this.dao = new MemberDaoImpl();
		factory = HibernateUtils.getSessionFactory();
	}

	@Override
	public boolean accountCheck(String mAccount) {
		boolean check = false;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			check = dao.checkAccount(mAccount);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}
		return check;
	}

	@Override
	public int registerMember(MemberBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			dao.registerMember(mb);
			tx.commit();
			count++;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}

		return count;
	}

	@Override
	public MemberBean queryMember(String mAccount) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			mb = dao.queryMember(mAccount);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}

		return mb;
	}

	@Override
	public MemberBean checkPassword(String mAccount, String mPassword) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			mb = dao.checkPassword(mAccount, mPassword);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				throw new RuntimeException(e);
			}
		}
		return mb;
	}

}
