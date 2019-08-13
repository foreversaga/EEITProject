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

import register.model.MemberBean;

@Entity
@Table(name = "cOrder")
public class orderBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer oId;
	private Integer oTotalAmount;
	private Integer oQty;
	private java.sql.Timestamp oTimestamp;
	private Integer oProductId;
	private String oPayment;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_account")//prepare MemberBean class's instance variable to mapping
	private MemberBean mId;
	private Integer pId;

	public Integer getoId() {
		return oId;
	}

	public void setoId(Integer oId) {
		this.oId = oId;
	}

	public Integer getoTotalAmount() {
		return oTotalAmount;
	}

	public void setoTotalAmount(Integer oTotalAmount) {
		this.oTotalAmount = oTotalAmount;
	}

	public Integer getoQty() {
		return oQty;
	}

	public void setoQty(Integer oQty) {
		this.oQty = oQty;
	}

	public java.sql.Timestamp getoTimestamp() {
		return oTimestamp;
	}

	public void setoTimestamp(java.sql.Timestamp oTimestamp) {
		this.oTimestamp = oTimestamp;
	}

	public Integer getoProductId() {
		return oProductId;
	}

	public void setoProductId(Integer oProductId) {
		this.oProductId = oProductId;
	}

	public String getoPayment() {
		return oPayment;
	}

	public void setoPayment(String oPayment) {
		this.oPayment = oPayment;
	}


	public MemberBean getmId() {
		return mId;
	}

	public void setmId(MemberBean mId) {
		this.mId = mId;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}
}
