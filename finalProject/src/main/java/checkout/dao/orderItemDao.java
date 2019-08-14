package checkout.dao;

import cart.model.orderItemBean;

public interface orderItemDao {

	int updateStock(orderItemBean ob);
	
}
