package kr.co.sist.user.member.vo;

/**
 * ������������ �� �� ���̵�� ��й�ȣ�� Ȯ�� 
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
