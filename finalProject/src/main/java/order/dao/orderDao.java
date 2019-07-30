package order.dao;

import java.sql.Connection;
import java.util.List;

import order.model.orderBean;

public interface orderDao {
	void insertOrder(orderBean ob);

	void setConnection(Connection con);

	orderBean getOrder(int oID);

	List<orderBean> getAllOrders();

	List<orderBean> getMemberOrders(String oAccount);
}
