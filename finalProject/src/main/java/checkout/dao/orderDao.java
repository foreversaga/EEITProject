package checkout.dao;

import java.util.List;

import cart.model.orderBean;

public interface orderDao {
	List<orderBean> getMemberOrders(String mAccount);

	orderBean getOrder(int oId);

	orderBean updateOrderAfterCheckout(int TradeNoDB, java.sql.Timestamp paymentDate, String mAccount);

	void saveOrder(orderBean ob);
}
