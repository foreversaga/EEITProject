package register.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import login.HibernateUtils;
import register.dao.MemberDao;
import register.model.MemberBean;

public class MemberDaoImpl implements MemberDao {
	SessionFactory factory;

	public MemberDaoImpl() {
		this.factory = HibernateUtils.getSessionFactory();
	}

	@Override
	public void setConnection(Connection conn) {
//		this.conn = conn;
	}

	@Override
	public boolean checkAccount(String mAccount) {
		boolean exist = false;
		String sql = "FROM MemberBean m WHERE m.mAccount=:mid";
		Session session = factory.getCurrentSession();
		try {
			MemberBean mb = (MemberBean) session.createQuery(sql).setParameter("mid", mAccount).uniqueResult();
			if (mb != null) {
				exist = true;
			}
		} catch (NoResultException ex) {
			exist = false;
		} catch (NonUniqueResultException ex) {
			exist = true;
		}
		return exist;
	}

	@Override
	public int registerMember(MemberBean mb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb);
		n++;

		return n;
	}

	@Override
	public MemberBean queryMember(String mAccount) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String sql = "FROM MemberBean m WHERE m.mAccount=:mid";
		try {
			mb = (MemberBean) session.createQuery(sql).setParameter("mid", mAccount).uniqueResult();
		} catch (NonUniqueResultException ex) {
			mb = null;
		}
		return mb;
	}

	@Override
	public MemberBean checkPassword(String mAccount, String mPassword) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String sql = "FROM MemberBean m WHERE m.mAccount=:mid and m.mPassword=:pswd";
		try {
			mb = (MemberBean) session.createQuery(sql).setParameter("mid", mAccount).setParameter("pswd", mPassword)
					.uniqueResult();
		} catch (NoResultException ex) {
			mb = null;
		}

		return mb;
	}

}
