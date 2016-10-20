package ljf.pojo;

public class Rank implements java.io.Serializable  {
	private String name;
	private String snumber;
	private String gid;
	private Integer gscore;
	private String glevel;
	private Integer gduration;

	/** default constructor */
	public Rank() {
	}
	public Rank(String name,String snumber, String gid, Integer gscore, String glevel,
			Integer gduration) {
		super();
		this.name=name;
		this.snumber = snumber;
		this.gid = gid;
		this.gscore = gscore;
		this.glevel = glevel;
		this.gduration = gduration;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSnumber() {
		return snumber;
	}
	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	
	
	public Integer getGscore() {
		return gscore;
	}
	public void setGscore(Integer gscore) {
		this.gscore = gscore;
	}
	public String getGlevel() {
		return glevel;
	}
	public void setGlevel(String glevel) {
		this.glevel = glevel;
	}
	public Integer getGduration() {
		return gduration;
	}
	public void setGduration(Integer gduration) {
		this.gduration = gduration;
	}
	
	
}
