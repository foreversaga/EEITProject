package forum.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
	private Integer mId;
	private String mName;
	private Integer aDisplay;
	private String aPreContent;
	@Column(columnDefinition = "varchar(max)")
	private String aContent;
	private java.sql.Timestamp aAddTime;
	private java.sql.Timestamp aEditTime;
	private String aLike;
	private String aDislike;
	@OneToMany(mappedBy = "ArticleBean", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	Set<ArticleReplyBean> ReplySet = new LinkedHashSet<>();
	
	
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

	public Integer getmId() {
		return mId;
	}


	public void setmId(Integer mId) {
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


	public Set<ArticleReplyBean> getReplySet() {
		return ReplySet;
	}


	public void setReplySet(Set<ArticleReplyBean> ReplySet) {
		this.ReplySet = ReplySet;
	}


	public ArticleBean() {
	}


	public Integer getaDisplay() {
		return aDisplay;
	}


	public void setaDisplay(Integer aDisplay) {
		this.aDisplay = aDisplay;
	}


	public String getaPreContent() {
		return aPreContent;
	}


	public void setaPreContent(String aPreContent) {
		this.aPreContent = aPreContent;
	}


	public String getaContent() {
		return aContent;
	}


	public void setaContent(String aContent) {
		this.aContent = aContent;
	}


	public String getaLike() {
		return aLike;
	}


	public void setaLike(String aLike) {
		this.aLike = aLike;
	}


	public String getaDislike() {
		return aDislike;
	}


	public void setaDislike(String aDislike) {
		this.aDislike = aDislike;
	}


	
}
