package ljf.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ljf.pojo.Student;
import ljf.pojo.Teacher;
import ljf.service.StudentService;
import ljf.service.TeacherService;
import ljf.service.impl.StudentServiceImpl;
import ljf.service.impl.TeacherServiceImpl;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.Session;

import utils.HibernateSessionFactory;
import utils.JsonTools;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements 
		ServletRequestAware, ServletResponseAware,ModelDriven<Student> {

	Session HIsession = null;
	private HttpServletResponse resp;
	private HttpServletRequest req;
	private StudentService ss=new StudentServiceImpl();
	private TeacherService ts=new TeacherServiceImpl();
	private Map<String, Object> session=ActionContext.getContext().getSession();
	//userType String  student   teacher
	
	//password   number
	
	public String role;
	public String loginPassword;
	public String loginNumber;
	public Student stu=new Student();
	public String SNumberJudge;
	
	public String register(){
		try {
			HIsession = HibernateSessionFactory.getSession();// 获得session
			HIsession.beginTransaction();// 开启事务
			HIsession.save(stu);
			HIsession.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			HIsession.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();// 关闭事务
		}
		
		
		return "login";
	}
	
	public void getTeachers(){
		List<Teacher> list=new ArrayList<Teacher>();
		list=ts.find("from Teacher");
		
		System.out.println(list.get(0).getTname());
		writeStringToResponse(JsonTools.createJsonString(list).toString());
		
	}

	public String login() {
		if(role.equals("student")){
			if(ss.checkNumberPassword(loginNumber,loginPassword)){
				session.put("role", "student");
				session.put("number", loginNumber);
				return "loginSuccess";
			}else{
				return "loginError";
			}
		}else{
			if(ts.checkNumberPassword(loginNumber,loginPassword)){
				session.put("role", "teacher");
				session.put("number", loginNumber);
				return "loginSuccess";
			}else{
				return "loginError";
			}
		}
	}
	
	//验证学号是否已被注册
	public void judgeSNumber(){
		Student student=ss.getByHql("from Student where snumber='"+SNumberJudge+"'");
		if((student!=null)&&(student.getSid()!=null)){
			//被占用
			writeStringToResponse("1");
		}else{
			writeStringToResponse("0");
		}
	}
	
	public void writeStringToResponse(String content) {
		try {
			resp.setCharacterEncoding("utf-8");
			PrintWriter pw = resp.getWriter();
			pw.write(content);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.req = arg0;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.resp = arg0;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getLoginNumber() {
		return loginNumber;
	}

	public void setLoginNumber(String loginNumber) {
		this.loginNumber = loginNumber;
	}

	public String getSNumberJudge() {
		return SNumberJudge;
	}

	public void setSNumberJudge(String sNumberJudge) {
		SNumberJudge = sNumberJudge;
	}

	@Override
	public Student getModel() {
		// TODO Auto-generated method stub
		return stu;
	}

}
