package dudu.service;

import java.util.List;

import dudu.member.login.service.DuduLoginVO;
import dudu.service.ApprovalVO;
import dudu.service.PageVO;

public interface ApprovalService {
	public void appinsert(ApprovalVO vo) throws Exception;
	public List<ApprovalVO> applist(DuduLoginVO vo,int page, String appstatus)throws Exception;
	public ApprovalVO detailapp(int appauto);
	public void appupdate(ApprovalVO vo) throws Exception;
	public void appback(ApprovalVO vo);
	public PageVO pagingParam(int page,String appstatus,DuduLoginVO loginvo);
	public int CCC(DuduLoginVO loginvo,String appstatus);
}
