package checkout.dao.impl;

import org.springframework.stereotype.Repository;

import cart.model.orderItemBean;
import checkout.dao.orderItemDao;

@Repository
public class orderItemDaoImpl implements orderItemDao {

	public orderItemDaoImpl() {

	}

	@Override
	public int updateStock(orderItemBean ob) {

		return 0;
	}

}
