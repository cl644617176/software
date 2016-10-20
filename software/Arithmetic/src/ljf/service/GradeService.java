package ljf.service;

import java.util.List;

import ljf.pojo.Grade;
import ljf.pojo.Rank;

public interface GradeService extends BaseService<Grade> {
	public List<Grade> getFrontRecord(String snumber);
	public List<Grade> getRank();
	public List<Grade> getFrontRecordByLevel(String snumber,String level);
}
