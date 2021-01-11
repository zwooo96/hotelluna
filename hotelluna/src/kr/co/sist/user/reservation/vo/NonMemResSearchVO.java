package kr.co.sist.user.reservation.vo;

public class NonMemResSearchVO {
	private String resNum, nameEngF, nameEngL;

	public NonMemResSearchVO() {
	}

	public NonMemResSearchVO(String resNum, String nameEngF, String nameEngL) {
		super();
		this.resNum = resNum;
		this.nameEngF = nameEngF;
		this.nameEngL = nameEngL;
	}

	public String getResNum() {
		return resNum;
	}

	public void setResNum(String resNum) {
		this.resNum = resNum;
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

}//class
