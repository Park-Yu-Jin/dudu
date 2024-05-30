package dudu.project.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dudu.project.service.ProjectLogsVO;
import dudu.service.ProjectVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("projectLogsDAO")
public class ProjectLogsDAO extends EgovComAbstractDAO {
	
	public List<?> getLogNum(String string) throws Exception {
		List<?> noList = selectList("projectLogsDAO.logList", string);
		return noList;
	}
	
	public void plInsert(ProjectLogsVO plvo) throws Exception {
		insert("projectLogsDAO.logFirstInsert", plvo);
	}
	
	public int plListChk(ProjectLogsVO plvo) throws Exception {
    	return selectOne("projectLogsDAO.logListChk", plvo);
    }
	
	public void plCopyInsert(ProjectLogsVO plvo) throws Exception {
		insert("projectLogsDAO.insertNewToOld", plvo);
	}
	
	public List<ProjectLogsVO> plList(ProjectLogsVO plvo) throws Exception {
		List<ProjectLogsVO> logList = selectList("projectLogsDAO.logList", plvo);
		return logList; 
	}
	
	public void plUpdate(ProjectLogsVO plvo) throws Exception {
		update("projectLogsDAO.logUpdate", plvo);
	}
}
