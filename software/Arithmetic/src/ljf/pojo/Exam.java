package ljf.pojo;

/**
 * Exam entity. @author MyEclipse Persistence Tools
 */

public class Exam implements java.io.Serializable {

	// Fields

	private Integer eid;
	private String gid;
	private String exam;
	private String trueresult;
	private String studentanswer;

	// Constructors

	/** default constructor */
	public Exam() {
	}

	/** full constructor */
	public Exam(String gid, String exam, String trueresult,
			String studentanswer) {
		this.gid = gid;
		this.exam = exam;
		this.trueresult = trueresult;
		this.studentanswer = studentanswer;
	}

	// Property accessors

	public Integer getEid() {
		return this.eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public String getGid() {
		return this.gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getExam() {
		return this.exam;
	}

	public void setExam(String exam) {
		this.exam = exam;
	}

	public String getTrueresult() {
		return this.trueresult;
	}

	public void setTrueresult(String trueresult) {
		this.trueresult = trueresult;
	}

	public String getStudentanswer() {
		return this.studentanswer;
	}

	public void setStudentanswer(String studentanswer) {
		this.studentanswer = studentanswer;
	}

}