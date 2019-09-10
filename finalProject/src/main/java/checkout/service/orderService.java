package checkout.service;

import java.util.List;

import cart.model.orderBean;
import cart.model.orderItemBean;

public interface orderService {
	List<orderBean> getMemberOrders(String mAccount);

	orderBean getOrder(int getoId);

	void saveOrder(orderBean ob);

	List<orderItemBean> getOrderItem(int oId);
}
