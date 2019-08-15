package cart.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
	private java.sql.Timestamp oTimestamp;
	private String oPayment;
//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "FK_account") // prepare MemberBean class's instance variable to mapping
//	private MemberBean mId;
	private String mAccount;
	@OneToMany(mappedBy = "orderBean", cascade = CascadeType.ALL)
	Set<orderItemBean> itemSet = new LinkedHashSet<>();

	public Set<orderItemBean> getItemSet() {
		return itemSet;
	}

	public void setItemSet(Set<orderItemBean> itemSet) {
		this.itemSet = itemSet;
	}

	public orderBean(Integer oId, Integer oTotalAmount, Timestamp oTimestamp, String oPayment, String mAccount) {
		super();
		this.oId = oId;
		this.oTotalAmount = oTotalAmount;
		this.oTimestamp = oTimestamp;
		this.oPayment = oPayment;
		this.mAccount = mAccount;
	}

	public orderBean() {
	}

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

	public java.sql.Timestamp getoTimestamp() {
		return oTimestamp;
	}

	public void setoTimestamp(java.sql.Timestamp oTimestamp) {
		this.oTimestamp = oTimestamp;
	}

	public String getoPayment() {
		return oPayment;
	}

	public void setoPayment(String oPayment) {
		this.oPayment = oPayment;
	}

//	public MemberBean getmId() {
//		return mId;
//	}
//
//	public void setmId(MemberBean mId) {
//		this.mId = mId;
//	}

	public String getmAccount() {
		return mAccount;
	}

	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}

}
