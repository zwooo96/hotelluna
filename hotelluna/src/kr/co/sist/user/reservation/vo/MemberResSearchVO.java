package kr.co.sist.user.reservation.vo;

public class MemberResSearchVO {
	private String id, resNum;

	public MemberResSearchVO() {
	}

	public MemberResSearchVO(String id, String resNum) {
		this.id = id;
		this.resNum = resNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getResNum() {
		return resNum;
	}

	public void setResNum(String resNum) {
		this.resNum = resNum;
	}
	
}//class
