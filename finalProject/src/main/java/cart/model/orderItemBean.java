package cart.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "orderItem")
public class orderItemBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	private Integer pId;
	private String iDes;
	private Integer iQty;
	private Integer unitPrice;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_orderNo")
	private orderBean orderBean;

	public orderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(orderBean orderBean) {
		this.orderBean = orderBean;
	}

	public orderItemBean() {

	}

	public orderItemBean(Integer iNo, Integer pId, String iDes, Integer iQty,
			Integer unitPrice) {
		super();
		this.iNo = iNo;
		this.pId = pId;
		this.iDes = iDes;
		this.iQty = iQty;
		this.unitPrice = unitPrice;

	}

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}


	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public String getiDes() {
		return iDes;
	}

	public void setiDes(String iDes) {
		this.iDes = iDes;
	}

	public Integer getiQty() {
		return iQty;
	}

	public void setiQty(Integer iQty) {
		this.iQty = iQty;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

}
