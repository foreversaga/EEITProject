package forum.model;

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
@Table(name = "ArticleReply")
public class ArticleReplyBean implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer arId;
	private String arTitle;
	private String arContent;
	private String mId;
	private String mName;
	private java.sql.Timestamp arAddTime;
	private java.sql.Timestamp arEditTime;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_ArticleId")
	private ArticleBean ArticleBean;
	
	
	public Integer getArId() {
		return arId;
	}


	public void setArId(Integer arId) {
		this.arId = arId;
	}


	public String getArTitle() {
		return arTitle;
	}


	public void setArTitle(String arTitle) {
		this.arTitle = arTitle;
	}


	public String getArContent() {
		return arContent;
	}


	public void setArContent(String arContent) {
		this.arContent = arContent;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	public java.sql.Timestamp getArAddTime() {
		return arAddTime;
	}


	public void setArAddTime(java.sql.Timestamp arAddTime) {
		this.arAddTime = arAddTime;
	}


	public java.sql.Timestamp getArEditTime() {
		return arEditTime;
	}


	public void setArEditTime(java.sql.Timestamp arEditTime) {
		this.arEditTime = arEditTime;
	}


	public ArticleBean getArticleBean() {
		return ArticleBean;
	}


	public void setArticleBean(ArticleBean articleBean) {
		ArticleBean = articleBean;
	}


	public ArticleReplyBean() {
	}
	
}