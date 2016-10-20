package ljf.service;

import ljf.pojo.Student;

public interface StudentService extends BaseService<Student>{
	public boolean checkNumberPassword(String snumber,String password);
}
