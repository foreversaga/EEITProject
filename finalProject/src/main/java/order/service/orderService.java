package order.service;

import java.util.List;

import order.model.orderBean;

public interface orderService {
	List<orderBean> getAllOrders();

	List<orderBean> getMemberOrders(String oAccount);
}
