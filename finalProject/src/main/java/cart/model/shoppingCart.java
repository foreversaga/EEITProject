package cart.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class shoppingCart {

	private Map<Integer, orderItem> cart = new LinkedHashMap<Integer, orderItem>();

	public shoppingCart() {
	}

	public Map<Integer, orderItem> getContent() {// let checkCart.jsp get cart object via session
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

	public void UpdateCartItem(int pId, int iQty) {
		orderItem oib = cart.get(pId);
		oib.setiQty(iQty);
	}

	public int getTotal() {
		int totalAmount = 0;
		Set<Integer> set = cart.keySet();
		for (int n : set) {
			int price = cart.get(n).getpPrice();
			int qty = cart.get(n).getiQty();
			totalAmount += price * qty;
		}
		return totalAmount;
	}

	public List<orderItem> getCartItem() {
		List<orderItem> list = new ArrayList<>();
		Set<Integer> set = cart.keySet();
		for (Integer k : set) {
			orderItem oi = null;
			oi.setiQty(cart.get(k).getiQty());
			oi.setpId(cart.get(k).getpId());
			oi.setpName(cart.get(k).getpName());
			oi.setpPrice(cart.get(k).getpPrice());
			list.add(oi);
		}
		return list;
	}

	public int deleteProduct(int pId) {
		if (cart.get(pId) != null) {
			cart.remove(pId);
			return 1;
		} else {
			return 0;
		}
	}

}
