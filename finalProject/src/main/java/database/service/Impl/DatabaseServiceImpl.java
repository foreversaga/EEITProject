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
	DatabaseDao dDao;

	@Override
	public void addProductDB() {
		dDao.addProductDB();
	}

	@Override
	public void addReviewDB() {
		dDao.addReviewDB();
	}

	@Override
	public void addMemberDB() {
		dDao.addMemberDB();
	}

}
