package dudu.project.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dudu.project.service.ProjectLogsService;
import dudu.project.service.ProjectLogsVO;
import dudu.service.ProjectVO;

@Controller
public class ProjectLogsController {
	
	@Resource(name = "projectLogsService")
	private ProjectLogsService projectLogsService;
	
	@RequestMapping("getplogno.do")
	public String plLogDo(ProjectLogsVO plvo, @RequestParam(value="dudu")String dudu, ModelMap model) throws Exception {
//		List<?> logsList = projectLogsService.getLogNum(pjvo);
//		System.out.println("마 2: " + projectLogsService.getLogNum(pjvo).toString());
		List<?> logsList = projectLogsService.getLogNum(plvo);
		System.out.println("마 2: " + projectLogsService.getLogNum(plvo).toString());
		ProjectLogsVO firstLog = (ProjectLogsVO) logsList.get(0);
		String firstLogNo = firstLog.getLogNo();
		String fistLogPNo = firstLog.getPjno();
		System.out.println("firstLogNo: " + firstLogNo + ", firstLogPNo: " + fistLogPNo );
		if(dudu.equals("calendar")) {
			return "redirect:/duducalendar.do";
		}
		return "forward:/pllist.do";
	}
	
	@RequestMapping("pllist.do")
	public String plListDo(ProjectLogsVO plvo, ModelMap model) throws Exception  {
//		List<?> logsList = projectLogsService.getLogNum(pjvo);
		List<?> logsList = projectLogsService.getLogNum(plvo);
		System.out.println(logsList);
		
		model.addAttribute("logResult", logsList);
		
		return "dudu/pllist";
	}
}
