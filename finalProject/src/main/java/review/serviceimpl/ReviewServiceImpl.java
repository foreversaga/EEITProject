package review.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import review.dao.ReviewDao;
import review.model.reviewBean;
import review.service.ReviewService;

@Transactional
@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao dao;

	@Override
	public List<reviewBean> getAllReviews() {
		return dao.getAllReviews();
	}

	@Override
	public void InsertNewReview(reviewBean rb) {
		dao.InsertNewReview(rb);
	}

}
