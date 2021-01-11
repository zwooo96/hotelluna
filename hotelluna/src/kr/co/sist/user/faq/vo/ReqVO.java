package kr.co.sist.user.faq.vo;

public class ReqVO {
	private String reqType;
	private String reqTitle;
	private int reqNum;
	private String reqFlag; //문의 유형 - 예약문의는 R, 일반 문의는 D
	private String reqInputDate;
	
	public ReqVO() {
	}

	public ReqVO(String reqType, String reqTitle, int reqNum, String reqFlag, String reqInputDate) {
		this.reqType = reqType;
		this.reqTitle = reqTitle;
		this.reqNum = reqNum;
		this.reqFlag = reqFlag;
		this.reqInputDate = reqInputDate;
	}

	public String getReqType() {
		return reqType;
	}

	public void setReqType(String reqType) {
		this.reqType = reqType;
	}

	public String getReqTitle() {
		return reqTitle;
	}

	public void setReqTitle(String reqTitle) {
		this.reqTitle = reqTitle;
	}

	public int getReqNum() {
		return reqNum;
	}

	public void setReqNum(int reqNum) {
		this.reqNum = reqNum;
	}

	public String getReqFlag() {
		return reqFlag;
	}

	public void setReqFlag(String reqFlag) {
		this.reqFlag = reqFlag;
	}

	public String getReqInputDate() {
		return reqInputDate;
	}

	public void setReqInputDate(String reqInputDate) {
		this.reqInputDate = reqInputDate;
	}
	
}
