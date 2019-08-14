package cart.model;

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
public class orderItemBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	private Integer orderNo;
	private Integer pId;
	private String description;
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

	public orderItemBean(Integer seqno, Integer orderNo, Integer pId, String description, Integer iQty,
			Integer unitPrice) {
		super();
		this.seqno = seqno;
		this.orderNo = orderNo;
		this.pId = pId;
		this.description = description;
		this.iQty = iQty;
		this.unitPrice = unitPrice;

	}

	public Integer getSeqno() {
		return seqno;
	}

	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
