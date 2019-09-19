package review.dao;

import java.util.List;

import review.model.reviewBean;

public interface ReviewDao {
	List<reviewBean> getAllReviews();

	void InsertNewReview(reviewBean rb);
}
