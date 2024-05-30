package dudu.web;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import dudu.service.HolidayService;

@Controller
public class HolidayController {
	
	@Resource(name = "HolidayService")
    private HolidayService holidayService;
	
	//공휴일 정보
    @GetMapping("/holiday")
    public ResponseEntity<?> getHolidayController() throws IOException {
        return ResponseEntity.ok(holidayService.getHolidayService());
    }
}