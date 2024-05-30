package dudu.member.join.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dudu.member.join.service.JoinService;
import dudu.member.join.service.JoinVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.uss.umt.service.impl.MberManageDAO;
import egovframework.com.uss.umt.service.impl.UserManageDAO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("joinService")
public class JoinServiceImpl extends EgovAbstractServiceImpl implements JoinService {

	/** userManageDAO */
	@Resource(name = "userManageDAO")
	private UserManageDAO userManageDAO;

	/** mberManageDAO */
	@Resource(name = "mberManageDAO")
	private MberManageDAO mberManageDAO;

	/** entrprsManageDAO */
	@Resource(name = "joinDAO")
	private JoinDAO joinDAO;

	/** egovUsrCnfrmIdGnrService */
	@Resource(name = "egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;
	
	/**
	 * 부서 목록을 조회한다.
	 */
	@Override
	public List<?> selectDeptList(ComDefaultVO searchVO) {
		return joinDAO.selectDeptList(searchVO);
	}

	/** 중복 아이디 체크 */
	@Override
	public int idCheck(String userEmail) throws Exception {
		return joinDAO.idCheck(userEmail);
	}
	
	
	/**
	 * 회원가입 신청 후 로그인 화면으로 이동
	 */
	@Override
	public String insertEntrprsmber(JoinVO entrprsManageVO) throws Exception {
		String uniqId = idgenService.getNextStringId();
		entrprsManageVO.setUniqId(uniqId);
		
		System.out.println("-----");
		System.out.println(entrprsManageVO);
		
		String pass = EgovFileScrty.encryptPassword(entrprsManageVO.getEntrprsMberPassword(),
				EgovStringUtil.isNullToString(entrprsManageVO.getEntrprsmberId()));// KISA 보안약점 조치 (2018-10-29, 윤창원)
		
		System.out.println("-----");
		System.out.println(pass);
		
		entrprsManageVO.setEntrprsMberPassword(pass);

		String result = joinDAO.insertEntrprsmber(entrprsManageVO);
		
		System.out.println("-----");
		System.out.println(result);
		return result;
	}
	
    /**
     * 비밀번호 변경
     */
    @Override
    public void updatePassword(JoinVO vo) throws Exception {
        System.out.println("joinServiceImpl 비밀번호 변경");
        String encryptedPassword = EgovFileScrty.encryptPassword(vo.getEntrprsMberPassword(),
				EgovStringUtil.isNullToString(vo.getEntrprsmberId()));
        vo.setEntrprsMberPassword(encryptedPassword);
        joinDAO.updatePassword(vo);
    }

	@Override
	public void updateName(JoinVO joinVO) {
		joinDAO.updateName(joinVO);
	}

	
}
