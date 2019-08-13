package cart.model;

public class orderItem {
	private Integer oNo;
	private Integer iPrice;
	private Integer pId;
	private Integer iQty;
	private String pName;

	public orderItem(Integer oNo, Integer iPrice, Integer pId, Integer iQty, String pName) {
		super();
		this.oNo = oNo;
		this.iPrice = iPrice;
		this.pId = pId;
		this.iQty = iQty;
		this.pName = pName;
	}

	public Integer getiPrice() {
		return iPrice;
	}

	public void setiPrice(Integer iPrice) {
		this.iPrice = iPrice;
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

	public Integer getoNo() {
		return oNo;
	}

	public void setoNo(Integer oNo) {
		this.oNo = oNo;
	}

}
