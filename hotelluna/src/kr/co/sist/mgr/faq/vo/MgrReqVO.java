package kr.co.sist.mgr.faq.vo;

/**
 * 관리자 화면에서 문의목록을 간단하게 보여주기 위한 목적의 VO
 * @author JU
 */
public class MgrReqVO {

	private int reqNum;
	private String reqType, reqTitle, id, reqFlag;

	public MgrReqVO() {
	}

	public MgrReqVO(int reqNum, String reqType, String reqTitle, String id, String reqFlag) {
		this.reqNum = reqNum;
		this.reqType = reqType;
		this.reqTitle = reqTitle;
		this.id = id;
		this.reqFlag = reqFlag;
	}

	public int getReqNum() {
		return reqNum;
	}

	public String getReqType() {
		return reqType;
	}

	public String getReqTitle() {
		return reqTitle;
	}

	public String getId() {
		return id;
	}

	public String getReqFlag() {
		return reqFlag;
	}

	public void setReqNum(int reqNum) {
		this.reqNum = reqNum;
	}

	public void setReqType(String reqType) {
		this.reqType = reqType;
	}

	public void setReqTitle(String reqTitle) {
		this.reqTitle = reqTitle;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setReqFlag(String reqFlag) {
		this.reqFlag = reqFlag;
	}

}
