package dudu.service.impL;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dudu.service.DailyVO;
import dudu.service.PageVO;
import dudu.service.ProjectVO;
import dudu.sql.CommonDAO;
import dudu.service.UserVO;
import dudu.service.adminService;

@Service
public class AdminServiceimpl implements adminService {

	@Resource(name = "commonDAO")
	private CommonDAO commondao;

	@Override
	public void updatestatus(UserVO vo) throws Exception {
		commondao.update("adminDAO.regist", vo);
	}

	@Override
	public void traderank(UserVO vo) throws Exception {
		commondao.update("adminDAO.trade", vo);
	}

	int pageLimit = 7;
	int blockLimit = 5;

	@Override
	public List<UserVO> userlistpage(int page) {
		int pagingStart = (page - 1) * pageLimit;
		Map<String, Integer> pagingParams = new HashMap<>();
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);
		List<UserVO> pagingList = commondao.selectList("adminDAO.userpage", pagingParams);
		return pagingList;
	}

	@Override
	public PageVO pagingParam(int page) {
		int count = commondao.selectOne("adminDAO.usercount");
		int maxPage = (int) (Math.ceil((double) count / pageLimit));
		System.out.println("page count = " + count);
		System.out.println("page maxPage = " + maxPage);
		int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;

		int endPage = startPage + blockLimit - 1;
		if (endPage > maxPage) {
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
