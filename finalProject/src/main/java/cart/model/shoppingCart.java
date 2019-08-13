package cart.model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class shoppingCart {

	private Map<Integer, orderItem> cart = new LinkedHashMap<Integer, orderItem>();

	public shoppingCart() {
	}

	public Map<Integer, orderItem> getContent() {
		return cart;
	}

	public void addToCart(int pId, orderItem oi) {
		if (oi.getiQty() <= 0) {
			return;
		}
		if (cart.get(pId) == null) {
			cart.put(pId, oi);
		} else {
			orderItem oib = cart.get(pId);
			oib.setiQty(oi.getiQty() + oib.getiQty());
		}
	}

	public int getTotal() {
		int totalAmount = 0;
		Set<Integer> set = cart.keySet();
		for (int n : set) {
			int price = cart.get(n).getiPrice();
			int qty = cart.get(n).getiQty();
			totalAmount = price * qty;
		}

		return totalAmount;
	}

}
