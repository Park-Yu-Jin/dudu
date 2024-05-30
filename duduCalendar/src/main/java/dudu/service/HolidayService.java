package dudu.service;

import java.io.IOException;
import java.util.List;

import dudu.HolidayVO;

public interface HolidayService {
	
	List<HolidayVO> getHolidayService() throws IOException;

	List<HolidayVO> getHoliday();

}
