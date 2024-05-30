package dudu.member.login.service.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import dudu.member.login.service.DuduLoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("duduLoginDAO")
public class DuduLoginDAO extends EgovComAbstractDAO{

	/**
	 * 일반 로그인을 처리한다
	 */
    public DuduLoginVO actionLogin(DuduLoginVO vo, HttpServletRequest req) throws Exception {
    	return (DuduLoginVO)selectOne("duduLoginDAO.duduLogin", vo);
    }
    
    /**
	 * 로그인인증제한 내역을 조회한다.
	 */
	public Map<?,?> selectLoginIncorrect(DuduLoginVO vo) throws Exception {
    	return (Map<?,?>)selectOne("duduLoginDAO.selectLoginIncorrect", vo);
    }

    /**
	 * 로그인인증제한 내역을 업데이트 한다.
	 */
    public void updateLoginIncorrect(Map<?,?> map) throws Exception {
    	update("duduLoginDAO.updateLoginIncorrect"+map.get("USER_SE"), map);
    }
    
}
