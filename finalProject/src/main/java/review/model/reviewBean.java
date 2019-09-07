package review.model;

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

@Entity
@Table(name = "review")
public class reviewBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer rId;
	private String rMessage;
	private String mAccount;  
	private String pId;
	private java.sql.Timestamp rTimestamp;
	private Integer rRating;
	
//@ManyToOne(cascade=CascadeType.ALL)
//	Set<reviewBean> reviewSet = new LinkedHashSet<>();

	
	
	public Integer getrId() {
		return rId;
	}
	public void setrId(Integer rId) {
		this.rId = rId;
	}
	public String getrMessage() {
		return rMessage;
	}
	public void setrMessage(String rMessage) {
		this.rMessage = rMessage;
	}
	public String getmAccount() {
		return mAccount;
	}
	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public java.sql.Timestamp getrTimestamp() {
		return rTimestamp;
	}
	public void setrTimestamp(java.sql.Timestamp rTimestamp) {
		this.rTimestamp = rTimestamp;
	}
	public Integer getrRating() {
		return rRating;
	}
	public void setrRating(Integer rRating) {
		this.rRating = rRating;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	
	public reviewBean( Integer rId, String rMessage, String mAccount,String pId, java.sql.Timestamp rTimestamp,Integer rRating) {
		super();
		this.rId=rId;
		this.rMessage=rMessage;
		this.mAccount=mAccount;
		this.pId=pId;
		this.rTimestamp=rTimestamp;
		this.rRating=rRating;
	}
	

	







}
