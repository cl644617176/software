package ljf.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import ljf.pojo.Grade;
import ljf.pojo.Rank;
import ljf.service.GradeService;

public class GradeServiceImpl extends BaseServiceImpl<Grade> implements GradeService{
	
	//通过学号得到学生的考试记录，并按考试开始时间排列
	@Override
	public List<Grade> getFrontRecord(String snumber) {
		// TODO Auto-generated method stub
		List<Grade> list=new ArrayList<Grade>();
		//asc是升序   desc是降序
		list=find("from Grade where snumber='"+snumber+"' order by gstarttime desc");
		return list;
	}
	
	//通过学号得到学生的考试记录，并按考试开始时间排列
		@Override
		public List<Grade> getFrontRecordByLevel(String snumber,String level) {
			// TODO Auto-generated method stub
			List<Grade> list=new ArrayList<Grade>();
			//asc是升序   desc是降序
			list=find("from Grade where snumber='"+snumber+"' and glevel='"+level+"' order by gstarttime desc");
			return list;
		}

	
	@Override
	public List<Grade> getRank() {
		// TODO Auto-generated method stub
		List<Grade> list=new ArrayList<Grade>();
		list=find("from Grade order by gscore desc");
		return list;
	}
	
	//

}
