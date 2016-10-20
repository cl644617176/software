package ljf.service;

import ljf.pojo.Teacher;

public interface TeacherService extends BaseService<Teacher> {
	public boolean checkNumberPassword(String tnumber,String password);

}
