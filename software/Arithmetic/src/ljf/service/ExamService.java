package ljf.service;

import java.util.List;

import ljf.pojo.Exam;

public interface ExamService extends BaseService<Exam>{
	public List<Exam> getPrimaryExam(String gid);
	public List<Exam> getMediumExam(String gid);
	public List<Exam> getHigherExam(String gid);
	public Exam getExamByType(String type);

}
