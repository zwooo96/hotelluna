package kr.co.sist.user.member.vo;

/**
 * 로그인 결과 VO(로그인을 성공했는지 아닌지 관리자인지 아닌지)
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
