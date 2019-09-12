package checkout.service;

import java.util.List;

import cart.model.orderBean;
import cart.model.orderItemBean;

public interface orderService {
	List<orderBean> getMemberOrders(String mAccount);

	orderBean getOrder(int getoId);
	
	orderBean updateOrderAfterCheckout(int TradeNoDB,java.sql.Timestamp paymentDate,String mAccount);

	void saveOrder(orderBean ob);

	List<orderItemBean> getOrderItem(int oId);
}
