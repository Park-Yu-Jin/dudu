package dudu.service;

import dudu.service.ProjectVO;
import java.util.List;
import dudu.service.DailyVO;
import dudu.service.PageVO;
import dudu.member.login.service.DuduLoginVO;

public interface ProjectService {

	public void pjinsert(ProjectVO vo) throws Exception;
	public List<ProjectVO> pjlist(DuduLoginVO vo, String keyword) throws Exception;
	public void pjupdate(ProjectVO vo) throws Exception;
	public void pjdelete(ProjectVO vo) throws Exception;
	public PageVO pagingParam(int page);
	public List<DailyVO> getDailyList(String email, String isFinish, String keyword);
	public List<ProjectVO> pagingList(int page);
	public List<ProjectVO> adminpjlist(DuduLoginVO vo, String keyword) throws Exception;
	public void insertDaily(DailyVO dailyVO);
	public DailyVO getDaily(int dailyno);
	public String selectTitle(int pjno);
}
