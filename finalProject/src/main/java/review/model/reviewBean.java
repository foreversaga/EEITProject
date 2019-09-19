package review.model;

import java.io.Serializable;
import java.sql.Date;
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
@Table(name = "Review")
public class reviewBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer rId;
	private String rReview;
	private String rTitle;
	private String mAccount;
	private String mName;
	private Integer pId;
	private java.sql.Timestamp rTimestamp;
	private Integer rRating;

	public reviewBean() {

	}

	public Integer getrId() {
		return rId;
	}

	public void setrId(Integer rId) {
		this.rId = rId;
	}

	public String getrReview() {
		return rReview;
	}

	public void setrReview(String rReview) {
		this.rReview = rReview;
	}

	public String getmAccount() {
		return mAccount;
	}

	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
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

	public reviewBean(Integer rId, String rReview, String rTitle, String mAccount, String mName, Integer pId,
			java.sql.Timestamp rTimestamp, Integer rRating) {
		super();
		this.rId = rId;
		this.rReview = rReview;
		this.rTitle = rTitle;
		this.mAccount = mAccount;
		this.mName = mName;
		this.pId = pId;
		this.rTimestamp = rTimestamp;
		this.rRating = rRating;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

}
