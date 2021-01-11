package kr.co.sist.user.member.vo;

/**
 * 아이디 찾기
 * @author sist38
 *
 */
public class IdVO {
	
	private String nameEngF, nameEngL, email1, email2;

	public IdVO() {
	}

	public IdVO(String nameEngF, String nameEngL, String email1, String email2) {
		super();
		this.nameEngF = nameEngF;
		this.nameEngL = nameEngL;
		this.email1 = email1;
		this.email2 = email2;
	}

	public String getNameEngF() {
		return nameEngF;
	}

	public void setNameEngF(String nameEngF) {
		this.nameEngF = nameEngF;
	}

	public String getNameEngL() {
		return nameEngL;
	}

	public void setNameEngL(String nameEngL) {
		this.nameEngL = nameEngL;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	

}
