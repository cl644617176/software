package ljf.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import utils.Calculation;
import utils.Fraction;
import utils.GenerateFormula;
import utils.HibernateSessionFactory;
import ljf.pojo.Exam;
import ljf.service.ExamService;

public class ExamServiceImpl extends BaseServiceImpl<Exam> implements
		ExamService {
	Session HIsession = null;

	public static String HUAJIAN(String str) {
		// 计算真正的结果并化简
		Fraction fa = Calculation.cal(str.trim());
		if (fa.numerator * fa.denominator < 0) {
			fa.numerator = fa.numerator > 0 ? -fa.numerator : fa.numerator;
			fa.denominator = fa.denominator > 0 ? fa.denominator
					: -fa.denominator;
		}
		String trueAnswer;
		if (fa.denominator == 1) {
			trueAnswer = fa.numerator + "";
		} else {
			if (fa.numerator == 0) {
				trueAnswer = "0";
			} else {
				trueAnswer = fa.numerator + "/" + fa.denominator;
			}
		}
		return trueAnswer;
	}
	
	public static String FormatFormula(String formula){
		String str="";
		String sss="+-/*()";
		String temp="";
		char ch;
		for(int i=0;i<formula.length();){
			ch=formula.charAt(i);
			if(sss.indexOf(ch)>=0){
				i++;
				if(i==formula.length()){
					str=str+ch;
				}else{
					str=str+ch+" ";
				}
			}else{
				for(;(i<formula.length())&&(formula.charAt(i)=='@'||(formula.charAt(i)>='0'&&formula.charAt(i)<='9'));){
					temp=temp+formula.charAt(i);
					i++;
				}
				if(i==formula.length()){
					str=str+temp;
				}else{
					str=str+temp+" ";
				}
				
				temp="";
			}
		}
		str=str.replace('@', '/');
		return str;
	}

	@Override
	public List<Exam> getPrimaryExam(String gid) {
		// TODO Auto-generated method stub
		String str="";
		List<Exam> list = new ArrayList<Exam>();
		for (int i = 0; i < 20; i++) {
			Exam exam = new Exam();
			exam.setGid(gid);
			str=GenerateFormula.generatePrimaryFormula();
			exam.setExam(FormatFormula(str));
			exam.setTrueresult(HUAJIAN(str));
			try {
				HIsession = HibernateSessionFactory.getSession();// 获得session
				HIsession.beginTransaction();// 开启事务
				HIsession.save(exam);
				HIsession.getTransaction().commit();
			} catch (Exception e) {
				// TODO: handle exception
				HIsession.getTransaction().rollback();
				e.printStackTrace();
			} finally {
				HibernateSessionFactory.closeSession();// 关闭事务
			}
		}

		String hql = "from Exam where gid='" + gid + "'";
		list = find(hql);

		return list;
	}

	@Override
	public List<Exam> getMediumExam(String gid) {
		// TODO Auto-generated method stub
		String str="";
		List<Exam> list = new ArrayList<Exam>();
		for (int i = 0; i < 20; i++) {
			Exam exam = new Exam();
			exam.setGid(gid);
			str=GenerateFormula.generateMediumFormula();
			exam.setExam(FormatFormula(str));
			exam.setTrueresult(HUAJIAN(str));
			try {
				HIsession = HibernateSessionFactory.getSession();// 获得session
				HIsession.beginTransaction();// 开启事务
				HIsession.save(exam);
				HIsession.getTransaction().commit();
			} catch (Exception e) {
				// TODO: handle exception
				HIsession.getTransaction().rollback();
				e.printStackTrace();
			} finally {
				HibernateSessionFactory.closeSession();// 关闭事务
			}
		}

		String hql = "from Exam where gid='" + gid + "'";
		list = find(hql);
		return list;
	}

	@Override
	public List<Exam> getHigherExam(String gid) {
		// TODO Auto-generated method stub
		String str="";
		List<Exam> list = new ArrayList<Exam>();
		for (int i = 0; i < 20; i++) {
			Exam exam = new Exam();
			exam.setGid(gid);
			str=GenerateFormula.generateHigherFormula();
			exam.setExam(FormatFormula(str));
			exam.setTrueresult(HUAJIAN(str));
			try {
				HIsession = HibernateSessionFactory.getSession();// 获得session
				HIsession.beginTransaction();// 开启事务
				HIsession.save(exam);
				HIsession.getTransaction().commit();
			} catch (Exception e) {
				// TODO: handle exception
				HIsession.getTransaction().rollback();
				e.printStackTrace();
			} finally {
				HibernateSessionFactory.closeSession();// 关闭事务
			}
		}

		String hql = "from Exam where gid='" + gid + "'";
		list = find(hql);

		return list;
	}

	@Override
	public Exam getExamByType(String type) {
		// TODO Auto-generated method stub
		Exam exam=new Exam();
		if(type.equals("add")){
			
			exam.setExam(GenerateFormula.generateAddFormula());
			exam.setTrueresult(HUAJIAN(exam.getExam()));
		}else if(type.equals("sub")){
			
			exam.setExam(GenerateFormula.generateSubductionFormula());
			exam.setTrueresult(HUAJIAN(exam.getExam()));
		}else if(type.equals("mul")){
			
			exam.setExam(GenerateFormula.generateMultiplicationFormula());
			exam.setTrueresult(HUAJIAN(exam.getExam()));
			}
		
		else{			exam.setExam(GenerateFormula.generateDivisionFormula());
			exam.setTrueresult(HUAJIAN(exam.getExam()));
		}

		
		return exam;
	}

}
