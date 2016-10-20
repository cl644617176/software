package ljf.pojo;

import java.util.Date;

/**
 * Grade entity. @author MyEclipse Persistence Tools
 */

public class Grade implements java.io.Serializable {

	// Fields

	private String gid;
	private String snumber;
	private Date gstarttime;
	private Date gendtime;
	private Integer gscore;
	private String glevel;
	private Integer gduration;
	private String gother;

	// Constructors

	/** default constructor */
	public Grade() {
	}

	/** full constructor */
	public Grade(String snumber, Date gstarttime, Date gendtime,
			Integer gscore, String glevel,
			Integer gduration, String gother) {
		this.snumber = snumber;
		this.gstarttime = gstarttime;
		this.gendtime = gendtime;
		this.gscore = gscore;
		this.glevel = glevel;
		this.gduration = gduration;
		this.gother = gother;
	}

	// Property accessors

	public String getGid() {
		return this.gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getSnumber() {
		return this.snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public Date getGstarttime() {
		return this.gstarttime;
	}

	public void setGstarttime(Date gstarttime) {
		this.gstarttime = gstarttime;
	}

	public Date getGendtime() {
		return this.gendtime;
	}

	public void setGendtime(Date gendtime) {
		this.gendtime = gendtime;
	}

	public Integer getGscore() {
		return this.gscore;
	}

	public void setGscore(Integer gscore) {
		this.gscore = gscore;
	}
	public String getGlevel() {
		return this.glevel;
	}

	public void setGlevel(String glevel) {
		this.glevel = glevel;
	}

	public Integer getGduration() {
		return this.gduration;
	}

	public void setGduration(Integer gduration) {
		this.gduration = gduration;
	}

	public String getGother() {
		return this.gother;
	}

	public void setGother(String gother) {
		this.gother = gother;
	}

}