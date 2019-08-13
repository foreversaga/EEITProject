package register.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import cart.model.orderBean;

@Entity
@Table(name = "Member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;

	public MemberBean() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mId;
	private String mAccount;
	private String mPassword;
	private String mName;
	private Date mDate;
	private String mPhone;
	private String mAddress;
	private String mGender;
	private String mEmail;
	@OneToMany(mappedBy = "mId", cascade = CascadeType.ALL)//set object mapped by mId
	Set<orderBean> set = new LinkedHashSet<>();

	public Set<orderBean> getSet() {
		return set;
	}

	public void setSet(Set<orderBean> set) {
		this.set = set;
	}

	public MemberBean(String mPassword, String mAccount, String mName, Date mDate, String mPhone, String mAddress,
			Integer mId, String mGender, String mEmail) {
		super();
		this.mPassword = mPassword;
		this.mAccount = mAccount;
		this.mName = mName;
		this.mDate = mDate;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mId = mId;
		this.mGender = mGender;
		this.mEmail = mEmail;
	}

	public Integer getmId() {
		return mId;
	}

	public void setmId(Integer mId) {
		this.mId = mId;
	}
	
	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmAccount() {
		return mAccount;
	}

	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

}
