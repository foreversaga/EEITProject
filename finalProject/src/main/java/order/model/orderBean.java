package order.model;

import java.sql.Date;

public class orderBean {
Integer oID;
String oAccount;
String oProductName;
Integer oAmount;
Integer oPrice;
java.sql.Date oDate;
String oPaymentWay;
java.sql.Date oUseDate;
Integer oProductId;
String oStatus;
public orderBean() {

}
public orderBean(Integer oID, String oAccount, String oProductName, Integer oAmount, Integer oPrice, Date oDate,
		String oPaymentWay, Date oUseDate, Integer oProductId, String oStatus) {
	super();
	this.oID = oID;
	this.oAccount = oAccount;
	this.oProductName = oProductName;
	this.oAmount = oAmount;
	this.oPrice = oPrice;
	this.oDate = oDate;
	this.oPaymentWay = oPaymentWay;
	this.oUseDate = oUseDate;
	this.oProductId = oProductId;
	this.oStatus = oStatus;
}
public Integer getoID() {
	return oID;
}
public void setoID(Integer oID) {
	this.oID = oID;
}
public String getoAccount() {
	return oAccount;
}
public void setoAccount(String oAccount) {
	this.oAccount = oAccount;
}
public String getoProductName() {
	return oProductName;
}
public void setoProductName(String oProductName) {
	this.oProductName = oProductName;
}
public Integer getoAmount() {
	return oAmount;
}
public void setoAmount(Integer oAmount) {
	this.oAmount = oAmount;
}
public Integer getoPrice() {
	return oPrice;
}
public void setoPrice(Integer oPrice) {
	this.oPrice = oPrice;
}
public java.sql.Date getoDate() {
	return oDate;
}
public void setoDate(java.sql.Date oDate) {
	this.oDate = oDate;
}
public String getoPaymentWay() {
	return oPaymentWay;
}
public void setoPaymentWay(String oPaymentWay) {
	this.oPaymentWay = oPaymentWay;
}
public java.sql.Date getoUseDate() {
	return oUseDate;
}
public void setoUseDate(java.sql.Date oUseDate) {
	this.oUseDate = oUseDate;
}
public Integer getoProductId() {
	return oProductId;
}
public void setoProductId(Integer oProductId) {
	this.oProductId = oProductId;
}
public String getoStatus() {
	return oStatus;
}
public void setoStatus(String oStatus) {
	this.oStatus = oStatus;
}
}
