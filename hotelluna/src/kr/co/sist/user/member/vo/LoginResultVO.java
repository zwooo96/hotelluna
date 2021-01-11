package kr.co.sist.user.member.vo;

/**
 * �α��� ��� VO(�α����� �����ߴ��� �ƴ��� ���������� �ƴ���)
 * @author sist38
 *
 */
public class LoginResultVO {
	
	private String kname, ename, adminFlag;
	public LoginResultVO() {
	}
	public LoginResultVO(String kname, String ename, String adminFlag) {
		super();
		this.kname = kname;
		this.ename = ename;
		this.adminFlag = adminFlag;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getAdminFlag() {
		return adminFlag;
	}
	public void setAdminFlag(String adminFlag) {
		this.adminFlag = adminFlag;
	}
	
	
	
}
