package ljf.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ljf.pojo.Grade;
import ljf.pojo.Student;
import ljf.service.ExamService;
import ljf.service.GradeService;
import ljf.service.StudentService;
import ljf.service.impl.ExamServiceImpl;
import ljf.service.impl.GradeServiceImpl;
import ljf.service.impl.StudentServiceImpl;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import utils.JsonTools;

import com.opensymphony.xwork2.ActionSupport;

public class TeacherAction extends ActionSupport implements
		ServletRequestAware, ServletResponseAware {
	private HttpServletResponse resp;
	private HttpServletRequest req;
	private GradeService gs = new GradeServiceImpl();
	private ExamService es = new ExamServiceImpl();
	private StudentService ss = new StudentServiceImpl();

	// 优秀平均成绩80分以上。。。良好60-80 一般就是60以下

	// 根据老师的学号获取其所有学生

	public String getStudent() {
		//平均分在80分以上的所有学生
				List<Student> stu=ss.find("from Student where tnumber='110'");
				List<Student> listY=new ArrayList<Student>();
				for(int i=0;i<stu.size();i++){
					List<Grade> listG=gs.find("from Grade where snumber='"+stu.get(i).getSnumber()+"'");
					int total=0;
					for(int j=0;j<listG.size();j++){
						total+=listG.get(j).getGscore();
					}
					if(listG.size()!=0&&total/listG.size()>=80)
						listY.add(stu.get(i));
				}
				List<Student> listL=new ArrayList<Student>();
				for(int i=0;i<stu.size();i++){
					List<Grade> listG=gs.find("from Grade where snumber='"+stu.get(i).getSnumber()+"'");
					int total=0;
					for(int j=0;j<listG.size();j++){
						total+=listG.get(j).getGscore();
					}
					if(listG.size()!=0&&total/listG.size()>=60&&total/listG.size()<80)
						listL.add(stu.get(i));
				}
				List<Student> listB=new ArrayList<Student>();
				for(int i=0;i<stu.size();i++){
					List<Grade> listG=gs.find("from Grade where snumber='"+stu.get(i).getSnumber()+"'");
					int total=0;
					for(int j=0;j<listG.size();j++){
						total+=listG.get(j).getGscore();
					}
					if(listG.size()!=0&&total/listG.size()<60)
						listB.add(stu.get(i));
				}
				System.out.println(listY.size()+"JJ"+listL.size()+"JJJ"+listB.size());
				req.setAttribute("listY", listY);
				req.setAttribute("listL", listL);
				req.setAttribute("listB", listB);
				return "students";
				
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

}
