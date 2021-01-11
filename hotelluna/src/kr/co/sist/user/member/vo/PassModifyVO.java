package kr.co.sist.user.member.vo;

/**
 * 비밀번호 변경
 * @author sist38
 *
 */
public class PassModifyVO {

	private String id, pass, newPass;
	boolean hasCurPass;

	public PassModifyVO() {
	}

	public PassModifyVO(String id, String pass, String newPass, boolean hasCurPass) {
		super();
		this.id = id;
		this.pass = pass;
		this.newPass = newPass;
		this.hasCurPass = hasCurPass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	public boolean isHasCurPass() {
		return hasCurPass;
	}

	public void setHasCurPass(boolean hasCurPass) {
		this.hasCurPass = hasCurPass;
	}
	
	
	
	
}
