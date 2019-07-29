package product.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

public class productBean implements Serializable{

	private static final long serialVersionUID = 1L;
private Integer pID;
private String pName;
private Integer pinStock;
private Integer pPrice;
private String pContent;
private String pType;
private String pArea;
private Integer pPopular;
private Integer pRating;
private java.sql.Date pDateRange;
private Double pAvgRating;
private Blob pPicture;
public productBean() {

}
public Integer getpID() {
	return pID;
}
public void setpID(Integer pID) {
	this.pID = pID;
}
public String getpName() {
	return pName;
}
public void setpName(String pName) {
	this.pName = pName;
}
public Integer getPinStock() {
	return pinStock;
}
public void setPinStock(Integer pinStock) {
	this.pinStock = pinStock;
}
public Integer getpPrice() {
	return pPrice;
}
public void setpPrice(Integer pPrice) {
	this.pPrice = pPrice;
}
public String getpContent() {
	return pContent;
}
public void setpContent(String pContent) {
	this.pContent = pContent;
}
public String getpType() {
	return pType;
}
public void setpType(String pType) {
	this.pType = pType;
}
public String getpArea() {
	return pArea;
}
public void setpArea(String pArea) {
	this.pArea = pArea;
}
public Integer getpPopular() {
	return pPopular;
}
public void setpPopular(Integer pPopular) {
	this.pPopular = pPopular;
}
public Integer getpRating() {
	return pRating;
}
public void setpRating(Integer pRating) {
	this.pRating = pRating;
}
public java.sql.Date getpDateRange() {
	return pDateRange;
}
public void setpDateRange(java.sql.Date pDateRange) {
	this.pDateRange = pDateRange;
}
public Double getpAvgRating() {
	return pAvgRating;
}
public void setpAvgRating(Double pAvgRating) {
	this.pAvgRating = pAvgRating;
}
public Blob getpPicture() {
	return pPicture;
}
public void setpPicture(Blob pPicture) {
	this.pPicture = pPicture;
}
public productBean(Integer pID, String pName, Integer pinStock, Integer pPrice, String pContent, String pType,
		String pArea, Integer pPopular, Integer pRating, Date pDateRange, Double pAvgRating, Blob pPicture) {
	super();
	this.pID = pID;
	this.pName = pName;
	this.pinStock = pinStock;
	this.pPrice = pPrice;
	this.pContent = pContent;
	this.pType = pType;
	this.pArea = pArea;
	this.pPopular = pPopular;
	this.pRating = pRating;
	this.pDateRange = pDateRange;
	this.pAvgRating = pAvgRating;
	this.pPicture = pPicture;
}
}
