package dudu.member.login.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import dudu.member.login.service.DuduLoginService;
import dudu.member.login.service.DuduLoginVO;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cop.ems.service.EgovSndngMailRegistService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("duduLoginService")
public class DuduLoginServiceImpl extends EgovAbstractServiceImpl implements DuduLoginService {
	
	@Resource(name="duduLoginDAO")
    private DuduLoginDAO loginDAO;

    /** EgovSndngMailRegistService */
	@Resource(name = "sndngMailRegistService")
    private EgovSndngMailRegistService sndngMailRegistService;

	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;

    /**
	 * 일반 로그인을 처리한다
	 */
    @Override
	public DuduLoginVO actionLogin(DuduLoginVO vo, HttpServletRequest req) throws Exception {
    	// 1. 입력한 비밀번호를 암호화한다.
		String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), EgovStringUtil.isNullToString(vo.getEmail()));
    	vo.setPassword(enpassword);
    	
    	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	DuduLoginVO loginVO = loginDAO.actionLogin(vo, req);
    	
    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getEmail().equals("") && loginVO.getPassword().equals(vo.getPassword())) {
    		System.out.println(">>>>>>>>>>>>>>>>>>>>>>" + loginVO.getName());
    		req.getSession().setAttribute("loginMember", loginVO);
    		req.getSession().setMaxInactiveInterval(900); //15분
    		return loginVO;
    	} else {
    		System.out.println(">>>>>>>>>>>>>>>>>>>>>>로그인 실패");
    		loginVO = new DuduLoginVO();
    	}
    	return loginVO;
    }
    
    public boolean isLogined(HttpServletRequest req) {
    	DuduLoginVO loginVO = (DuduLoginVO) req.getSession().getAttribute("loginMember");
    	if (loginVO != null) {
    		return true;
    	} else {
    		req.getSession().setAttribute("err_msg", "로그인 세션 만료");
    		return false;
    	}
    }
    
    /**
	 * 로그인인증제한을 조회한다.
	 */
    public Map<?,?> selectLoginIncorrect(DuduLoginVO vo) throws Exception{
    	return loginDAO.selectLoginIncorrect(vo);
    }
    
    /**
	 * 로그인인증제한을 처리한다.
	 */
    public String processLoginIncorrect(DuduLoginVO vo, Map<?,?> mapLockUserInfo) throws Exception{    	
    	String sRtnCode = "C";
    	//KISA 보안약점 조치 (2018-10-29, 윤창원)
    	String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), EgovStringUtil.isNullToString(vo.getId()));
    	Map<String,String> mapParam = new HashMap<String,String>();
    	mapParam.put("USER_SE", vo.getUserSe());
		mapParam.put("id", EgovStringUtil.isNullToString(vo.getId()));//KISA 보안약점 조치 (2018-10-29, 윤창원)
    	//잠김시 
		if("Y".equals(((String)mapLockUserInfo.get("lockAt")))){
			sRtnCode = "L";
		//패드워드 인증시 
		}else if( ((String)mapLockUserInfo.get("userPw")).equals(enpassword) ){
    		//LOCK 해제
    		mapParam.put("updateAt", "E");
    		loginDAO.updateLoginIncorrect(mapParam);
    		sRtnCode = "E";
        //패드워드 비인증시 
    	}else if(!"Y".equals(((String)mapLockUserInfo.get("lockAt")))){
    		//LOCK 설정
    		if( Integer.parseInt(String.valueOf(mapLockUserInfo.get("lockCnt")))+1 >= egovLoginConfig.getLockCount() ){    			
	    		mapParam.put("updateAt", "L");
	    		loginDAO.updateLoginIncorrect(mapParam);
	    		sRtnCode = "L";
	    	//LOCK 증가
    		}else{
	    		mapParam.put("updateAt", "C");
	    		loginDAO.updateLoginIncorrect(mapParam);
	    		sRtnCode = "C";
    		}
    	}
    	return sRtnCode;
    }

}
