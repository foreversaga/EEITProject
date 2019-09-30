package forum.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "Article")
public class ArticleBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer aId;
	private String aTitle;
	private String aContent;
	private String mId;
	private String mName;
	private java.sql.Timestamp aAddTime;
	private java.sql.Timestamp aEditTime;
	@OneToMany(mappedBy = "ArticleBean", cascade = CascadeType.ALL)
	Set<ArticleReplyBean> itemSet = new LinkedHashSet<>();
	
	
	public Integer getaId() {
		return aId;
	}


	public void setaId(Integer aId) {
		this.aId = aId;
	}


	public String getaTitle() {
		return aTitle;
	}


	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}


	public String getaContent() {
		return aContent;
	}


	public void setaContent(String aContent) {
		this.aContent = aContent;
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


	public java.sql.Timestamp getaAddTime() {
		return aAddTime;
	}


	public void setaAddTime(java.sql.Timestamp aAddTime) {
		this.aAddTime = aAddTime;
	}


	public java.sql.Timestamp getaEditTime() {
		return aEditTime;
	}


	public void setaEditTime(java.sql.Timestamp aEditTime) {
		this.aEditTime = aEditTime;
	}


	public Set<ArticleReplyBean> getItemSet() {
		return itemSet;
	}


	public void setItemSet(Set<ArticleReplyBean> itemSet) {
		this.itemSet = itemSet;
	}


	public ArticleBean() {
	}


	
}
