package ljf.service.impl;

import ljf.pojo.Teacher;
import ljf.service.TeacherService;

public class TeacherServiceImpl extends BaseServiceImpl<Teacher> implements TeacherService{

	@Override
	public boolean checkNumberPassword(String tnumber, String password) {
		String hql = "from Teacher where tnumber='" + tnumber
				+ "' and tpassword='" + password + "'";
		Teacher teacher=getByHql(hql);
		if (teacher != null)
			return true;
		else
			return false;
	}

}
