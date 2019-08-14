package cart.model;

public class orderItem {
	
	private Integer pPrice;
	private Integer pId;
	private Integer iQty;
	private String pName;

	public orderItem(Integer pPrice, Integer pId, Integer iQty, String pName) {
		super();
		
		this.pPrice = pPrice;
		this.pId = pId;
		this.iQty = iQty;
		this.pName = pName;
	}

	public orderItem() {
	}

	public Integer getpPrice() {
		return pPrice;
	}

	public void setpPrice(Integer pPrice) {
		this.pPrice = pPrice;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public Integer getiQty() {
		return iQty;
	}

	public void setiQty(Integer iQty) {
		this.iQty = iQty;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}


}
