package ljf.pojo;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private Integer sid;
	private String snumber;
	private String sname;
	private String spassword;
	private String tnumber;

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String snumber) {
		this.snumber = snumber;
	}

	/** full constructor */
	public Student(String snumber, String sname, String spassword,
			String tnumber) {
		this.snumber = snumber;
		this.sname = sname;
		this.spassword = spassword;
		this.tnumber = tnumber;
	}

	// Property accessors

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSnumber() {
		return this.snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSpassword() {
		return this.spassword;
	}

	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}

	public String getTnumber() {
		return this.tnumber;
	}

	public void setTnumber(String tnumber) {
		this.tnumber = tnumber;
	}

}