package review.service;

import java.util.List;

import review.model.reviewBean;

public interface ReviewService {
	List<reviewBean> getAllReviews();

	void InsertNewReview(reviewBean rb);
	
	void UpdateReview(reviewBean rb);

	reviewBean getOrderItemReview(Integer pId, String mAccount);
	
	List<reviewBean> getProductReview(Integer pId);
	
	List<reviewBean> getIndexReview(Integer num);
}
