package checkout.dao;

import java.util.List;

import cart.model.orderItemBean;

public interface orderItemDao {

	int updateStock(orderItemBean ob);
	
	List<orderItemBean> getOrderItem(Integer oId);
}
