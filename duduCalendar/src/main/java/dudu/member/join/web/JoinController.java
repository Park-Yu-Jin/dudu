package dudu.member.join.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dudu.member.join.service.JoinService;
import dudu.member.join.service.JoinVO;
import dudu.member.login.service.DuduLoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class JoinController {

	/** duduUserJoinService */
	@Resource(name = "joinService")
	private JoinService joinService;

	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** propertiesService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(JoinController.class);
	
	/** 아이디 중복 검사 */
	@RequestMapping(value="/join.idchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String idChkPOST(String userEmail) throws Exception {
		LOGGER.info("idChk() 진입");
		
		int result = joinService.idCheck(userEmail);
		
		LOGGER.info("결과값= " + result);
		
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	/**
	 * 회원 가입 화면으로 이동
	 */
	@RequestMapping("/join.do")
	public String joinDo(@ModelAttribute("JoinVO") JoinVO joinVO) throws Exception {
		LOGGER.debug("회원가입 페이지 진입");
		return "dudu/member/join";
	}

	/**
	 * 회원가입 신청 후 로그인 화면으로 이동
	 */
	@RequestMapping("/join.done.do")
	public String sbscrbEntrprsMber(@ModelAttribute("joinVO") JoinVO joinVO) throws Exception {

		try {
//			joinVO.setEntrprsMberSttus("A");
			joinService.insertEntrprsmber(joinVO);
			return "forward:/main.do";
		} catch (Exception e) {
			e.printStackTrace();
			return "error-page";
		}
	}
	
	@RequestMapping("/updatepwd.do")
	public String updatepwd(@ModelAttribute("joinVO") JoinVO joinvo,ModelMap model, HttpServletRequest request) throws Exception{
	    System.out.println("DuduUserJoinController 비밀번호 변경 시작");
	    String newPassword = request.getParameter("entrprsMberPassword");
	    System.out.println(request.getParameter("entrprsMberPassword"));
	    try {
	    	joinvo.setEntrprsMberPassword(newPassword);
	        joinService.updatePassword(joinvo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return "redirect:/main.do";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(@RequestParam(value="update", required = false) String update, ModelMap map) throws Exception{
		map.addAttribute("update", update);
		return "/dudu/member/myPage";
	}
	
	@RequestMapping("/userUpdate.do")
	public String userUpdate(RedirectAttributes redirect, JoinVO joinVO, HttpServletRequest request) throws Exception{
		joinService.updateName(joinVO);
		
		HttpSession session = request.getSession();
		DuduLoginVO user = (DuduLoginVO) session.getAttribute("loginMember");
		user.setName(joinVO.getCmpnyNm());
	    session.setAttribute("loginMember", user);
		return "redirect:/mypage.do?update=1";
	}
	
}
