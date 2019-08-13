package register.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Member")
public class MemberBean implements Serializable {

	public MemberBean() {

	}

	private static final long serialVersionUID = 1L;
	@Id
	private String mAccount;
	private String mPassword;
	private String mName;
	private Date mDate;
	private String mPhone;
	private String mAddress;
	private String mID;

	public MemberBean(String mPassword, String mAccount, String mName, Date mDate, String mPhone, String mAddress,
			String mID, String mGender, String mEmail) {
		super();
		this.mPassword = mPassword;
		this.mAccount = mAccount;
		this.mName = mName;
		this.mDate = mDate;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mID = mID;
		this.mGender = mGender;
		this.mEmail = mEmail;
	}

	private String mGender;
	private String mEmail;

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

	public String getmID() {
		return mID;
	}

	public void setmID(String mID) {
		this.mID = mID;
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
