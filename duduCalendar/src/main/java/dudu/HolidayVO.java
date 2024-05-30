package dudu;

public class HolidayVO {
	private Long holidayIndex;
    private String holidayStart;
    private String holidayEnd;
    private String holidayName;
    
	public Long getHolidayIndex() {
		return holidayIndex;
	}
	public void setHolidayIndex(Long holidayIndex) {
		this.holidayIndex = holidayIndex;
	}

	public String getHolidayName() {
		return holidayName;
	}
	public void setHolidayName(String holidayName) {
		this.holidayName = holidayName;
	}
	public String getHolidayStart() {
		return holidayStart;
	}
	public void setHolidayStart(String holidayStart) {
		this.holidayStart = holidayStart;
	}
	public String getHolidayEnd() {
		return holidayEnd;
	}
	public void setHolidayEnd(String holidayEnd) {
		this.holidayEnd = holidayEnd;
	}
	@Override
	public String toString() {
		return "HolidayVO [holidayIndex=" + holidayIndex + ", holidayStart=" + holidayStart + ", holidayEnd="
				+ holidayEnd + ", holidayName=" + holidayName + "]";
	}

}
