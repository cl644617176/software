package ljf.service.impl;

import ljf.pojo.Student;
import ljf.service.StudentService;

public class StudentServiceImpl extends BaseServiceImpl<Student> implements
		StudentService {

	@Override
	public boolean checkNumberPassword(String snumber, String password) {
		// TODO Auto-generated method stub
		String hql = "from Student where snumber='" + snumber
				+ "' and spassword='" + password + "'";
		Student stu = getByHql(hql);
		if (stu != null)
			return true;
		else
			return false;
	}

}
