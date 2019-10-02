package forum.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ArticleThumb")
public class ThumbBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer atId;
	private Integer mId;
	private Integer aId;
	private Integer arId;
	private Integer atThumb;

	public Integer getAtId() {
		return atId;
	}

	public void setAtId(Integer atId) {
		this.atId = atId;
	}

	public Integer getmId() {
		return mId;
	}

	public void setmId(Integer mId) {
		this.mId = mId;
	}

	public Integer getaId() {
		return aId;
	}

	public void setaId(Integer aId) {
		this.aId = aId;
	}

	public Integer getAtThumb() {
		return atThumb;
	}

	public void setAtThumb(Integer atThumb) {
		this.atThumb = atThumb;
	}

	public Integer getArId() {
		return arId;
	}

	public void setArId(Integer arId) {
		this.arId = arId;
	}

	public ThumbBean() {

	}

}
