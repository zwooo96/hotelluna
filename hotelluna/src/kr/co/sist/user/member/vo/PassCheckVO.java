package kr.co.sist.user.member.vo;

/**
 * 마이페이지를 들어갈 때 아이디와 비밀번호를 확인 
 * @author sist38
 *
 */
public class PassCheckVO {

	private String id, pass;

	public PassCheckVO() {
	}

	public PassCheckVO(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
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

	
}
