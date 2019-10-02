package database.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import database.dao.DatabaseDao;
import database.service.DatabaseService;

@Service
@Transactional
public class DatabaseServiceImpl implements DatabaseService {
	@Autowired
	DatabaseDao dao;

	@Override
	public void addProductDB() {
		dao.addProductDB();
	}

	@Override
	public void addReviewDB() {
		dao.addReviewDB();
	}

	@Override
	public void addMemberDB() {
		dao.addMemberDB();
	}

	@Override
	public void addOrderDB() {
		dao.addOrderDB();
	}

	@Override
	public void addArticleDB() {
		dao.addArticleDB();
	}

	@Override
	public void addReplyDB() {
		dao.addReplyDB();
	}

}
