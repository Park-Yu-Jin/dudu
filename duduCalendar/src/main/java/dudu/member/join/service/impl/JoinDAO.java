package dudu.member.join.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dudu.member.join.service.JoinVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends EgovComAbstractDAO {
	
	/**
	 * 부서 조회
	 */
	public List<?> selectDeptList(ComDefaultVO searchVO) {
		return (List<?>) list("joinDAO.selectDeptList", searchVO);
	}
	
	/**
     * 화면에 조회된 기업회원의 정보를 데이터베이스에서 삭제
     * @param delId
     */
    public void deleteEntrprsmber(String delId){
        delete("joinDAO.deleteEntrprs_S", delId);
    }

    /**
     * 회원가입
     */
    public String insertEntrprsmber(JoinVO entrprsManageVO){
        return String.valueOf((int)insert("joinDAO.duduJoin", entrprsManageVO));
    }
    
    /**
	 * 변경된 비밀번호 저장
	 */
    public void updatePassword(JoinVO vo) throws Exception {
    	System.out.println("변경된 비밀번호 저장 DAO");
    	update("joinDAO.updatePassword", vo);
    }
    
    /**
     * 비밀번호 변경
     */
    public void updateUserPassword(JoinVO vo) throws Exception{
    	System.out.println("DuduJoinDAO 비밀번호 변경");
    	update("joinDAO.updateUserPassword", vo);
    }
    
    public int idCheck(String userEmail) throws Exception {
    	return selectOne("joinDAO.idCheck", userEmail);
    }
    
	public void updateName(JoinVO joinVO) {
		update("joinDAO.updateName", joinVO);
	}
}
