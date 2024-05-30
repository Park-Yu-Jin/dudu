package dudu.member.login.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface DuduLoginService {
	
	/**
	 * 일반 로그인을 처리한다
	 */
    DuduLoginVO actionLogin(DuduLoginVO vo, HttpServletRequest req) throws Exception;
    
    /**
	 * 로그인인증제한을 처리한다.
	 */
    String processLoginIncorrect(DuduLoginVO vo, Map<?,?> mapLockUserInfo) throws Exception;
    
    /**
	 * 로그인인증제한을 조회한다.
	 */
    Map<?,?> selectLoginIncorrect(DuduLoginVO vo) throws Exception;
    
    /** 로그인 상태 확인 */
    public boolean isLogined(HttpServletRequest req);

}
