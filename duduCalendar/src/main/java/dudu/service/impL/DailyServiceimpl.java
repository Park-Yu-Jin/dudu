package dudu.service.impL;

import dudu.service.DailyVO;
import dudu.service.PageVO;
import dudu.service.ProjectVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import dudu.sql.CommonDAO;
import dudu.service.DailyService;

@Service
public class DailyServiceimpl implements DailyService {
	@Resource(name = "commonDAO")
	private CommonDAO commondao;
	
	/*일일업무 등록*/
	@Override
	public void Dailyinsert(DailyVO vo) throws Exception{
		commondao.insert("DailyDAO.dailyinsert",vo);
	}
	
	/*일일업무 수정*/
	@Override
	public void Dailyupdate(DailyVO vo) throws Exception{
		commondao.update("DailyDAO.dailyupdate",vo);
	}
	
	/*일일업무 삭제*/
	@Override
	public void Dailydelete(DailyVO vo)throws Exception{
		commondao.delete("DailyDAO.dailydelete",vo);
	}
	
	/* 일일업무 날짜 이동 */
	@Override
	public void DailyDateupdate(DailyVO vo) throws Exception{
		commondao.update("DailyDAO.dailyDateupdate",vo);
	}
	
	/*프로젝트 선택*/
	@Override
	public List<ProjectVO> project(String name) throws Exception{
		Map<String, String> pj = new HashMap<>();
		pj.put("name", name);
		List<ProjectVO> project = commondao.selectList("projectDAO.project",pj);
		return project;
		
	}
	
	int pageLimit = 7;
	int blockLimit = 5;

	@Override
	public List<DailyVO> pagingList(int page, int pjno) {
		int pagingStart = (page - 1) * pageLimit;
		Map<String, Integer> pagingParams = new HashMap<>();
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);
		pagingParams.put("pjno", pjno);
		List<DailyVO> pagingList = commondao.selectList("DailyDAO.dailyListPage",pagingParams);
		System.out.println("pagingList = "+pagingList);
		return pagingList;
	}

	@Override
	public PageVO pagingParam(int page, int pjno) {
	int count = commondao.selectOne("DailyDAO.count", pjno);
	
	int maxPage = (int)(Math.ceil((double) count / pageLimit));
	int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
	
	int endPage = startPage + blockLimit - 1;
	if(endPage > maxPage) {
		endPage = maxPage;
	}
	
	PageVO pagevo = new PageVO();
	
	pagevo.setPage(page);
	pagevo.setMaxPage(maxPage);
	pagevo.setStartPage(startPage);
	pagevo.setEndpage(endPage);
	return pagevo;
	}
}
