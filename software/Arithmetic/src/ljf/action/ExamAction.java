package ljf.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ljf.pojo.Exam;
import ljf.pojo.Grade;
import ljf.pojo.Student;
import ljf.service.ExamService;
import ljf.service.GradeService;
import ljf.service.StudentService;
import ljf.service.impl.ExamServiceImpl;
import ljf.service.impl.GradeServiceImpl;
import ljf.service.impl.StudentServiceImpl;

import org.apache.poi.hssf.record.formula.functions.T;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.Session;

import utils.HibernateSessionFactory;
import utils.JsonTools;
import utils.Tools;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ExamAction  extends ActionSupport implements 
ServletRequestAware, ServletResponseAware  {
	
	Session HIsession=null;
	public HttpServletResponse resp;
	public HttpServletRequest req;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	private GradeService gs=new GradeServiceImpl();
	private ExamService es=new ExamServiceImpl();
	private StudentService ss=new StudentServiceImpl();
	
	public String flag="";
	public String practiceType;
	public String examContent;
	public String answers;
	public String type;
	
	public void practiceExam(){
		//add   sub   mul  div
		//根据操作符返回五组测试题
		List<Exam> list=new ArrayList<Exam>();
		Exam exam=new Exam();
		for(int i=0;i<5;i++){
			exam=es.getExamByType(practiceType);
			list.add(exam);
		}
		try {
			System.out.println(JsonTools.createJsonString(list));
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print(JsonTools.createJsonString(list));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void ListJson(){
		Exam exam=es.getExamByType("+");
		Exam exam1=es.getExamByType("+");
		List<Exam> list=new ArrayList<Exam>();
		list.add(exam);
		list.add(exam1);
		try {
			System.out.println(JsonTools.createJsonString(list));
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print(JsonTools.createJsonString(list));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String goExam(){
		System.out.println(flag);
		req.setAttribute("flag", flag);
		
		return "goExam";
	}
	
	
	public void startExam(){
		
		Grade grade=new Grade();
		List<Exam> list=new ArrayList<Exam>();
		try {
			//SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd HH:mm:ss");
			grade.setGid(UUID.randomUUID().toString().replace("-","").substring(0, 10));
			//grade.setSnumber((String)session.get("number"));
			grade.setSnumber("2016218001");
			grade.setGstarttime(new Date());
			grade.setGlevel(flag);
			HIsession = HibernateSessionFactory.getSession();// 获得session
			HIsession.beginTransaction();// 开启事务 
			HIsession.save(grade);
			HIsession.getTransaction().commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("获取用户名报错");
			HIsession.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateSessionFactory.closeSession();// 关闭事务
		}
		if(flag.equals("primary")){
			//
			list=es.getPrimaryExam(grade.getGid());
			
		}else if(flag.equals("medium")){
			list=es.getMediumExam(grade.getGid());
			
		}else{
			//higher
			list=es.getHigherExam(grade.getGid());
		}
		session.put("start", grade.getGstarttime().getTime()+"");
		session.put("end", (grade.getGstarttime().getTime()+20*60)+"");
		//String str=JsonTools.createJsonString(list);
		//System.out.println(str);
		//req.setAttribute("examContent", str);
		//session.put("exams", str);
		//session.put("examList", list);
		try {
			System.out.println(JsonTools.createJsonString(list));
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print(JsonTools.createJsonString(list));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public String endExam(){
		System.out.println(examContent);
		System.out.println(answers);
		List<Exam> listExam=JsonTools.getListByJson(examContent);
		List<String> listAnswer=new ArrayList<String>();
		String[] answersList=answers.split("@");
		for(int i=0;i<20;i++){
			if((i+1)>=answersList.length){
				listExam.get(i).setStudentanswer("-");
			}else{
				listExam.get(i).setStudentanswer(Tools.FormatAnswer(answersList[i+1]));
			}
			
		}
		//List<Exam> listExam=(List<Exam>)session.get("examList");
		Grade grade=gs.getByHql("from Grade where gid='"+listExam.get(0).getGid()+"'");
		int score=0;
		try {
			HIsession = HibernateSessionFactory.getSession();// 获得session
			HIsession.beginTransaction();// 开启事务 
			for(int i=0;i<listExam.size();i++){
				//listExam.get(i).setStudentanswer(Tools.FormatAnswer(listExam.get(i).getStudentanswer()));
				if(listExam.get(i).getStudentanswer().equals(listExam.get(i).getTrueresult())){
					score++;
				}
				HIsession.update(listExam.get(i));
				//es.update();
			}
			
			grade.setGendtime(new Date());
			grade.setGscore(score*5);
			grade.setGduration((int)((grade.getGendtime().getTime()-grade.getGstarttime().getTime())/1000));
			HIsession.update(grade);
			HIsession.getTransaction().commit();
			//gs.update(grade);
		} catch (Exception e) {
			// TODO: handle exception
			HIsession.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateSessionFactory.closeSession();// 关闭事务
		}
		
		//返回一个grade  和一个list《exam》
		//根据学号查姓名
		Student stu=ss.getByHql("from Student where snumber='"+grade.getSnumber()+"'");
		
		req.setAttribute("grade", grade);
		req.setAttribute("listExam", listExam);
		req.setAttribute("name", stu.getSname());
	
		
		return "gradeDetail";
	}
	
	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}

	
	
	public String getPracticeType() {
		return practiceType;
	}

	public void setPracticeType(String practiceType) {
		this.practiceType = practiceType;
	}
	

	public String getExamContent() {
		return examContent;
	}

	public void setExamContent(String examContent) {
		this.examContent = examContent;
	}

	public String getAnswers() {
		return answers;
	}

	public void setAnswers(String answers) {
		this.answers = answers;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.req = arg0;
	}
	
	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.resp = arg0;
	}

}
