package kr.co.sist.user.faq.vo;

public class ReqCheckVO {
	
	private String id, reqNum;
	
	public ReqCheckVO() {
	}

	public ReqCheckVO(String id, String reqNum) {
		this.id = id;
		this.reqNum = reqNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReqNum() {
		return reqNum;
	}

	public void setReqNum(String reqNum) {
		this.reqNum = reqNum;
	}
	
}
