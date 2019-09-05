package review.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import review.dao.ReviewDao;
import review.model.reviewBean;
import review.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDao dao;

	@Transactional
	@Override
	public List<reviewBean> getAllReviews() {
		return dao.getAllReview();
	}

}
