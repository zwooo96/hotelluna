package kr.co.sist.mgr.faq.vo;

/**
 * 관리자 화면에서 개별 문의내용을 자세하게 보여주기 위한 목적의 VO
 * @author JU
 */
public class MgrReqDetailVO {
	
	private String reqType, reqTitle, reqContent, userId, userEmail, userPhone, reqReply;

	public MgrReqDetailVO() {
	}

	public MgrReqDetailVO(String reqType, String reqTitle, String reqContent, String userId, String userEmail,
			String userPhone, String reqReply) {
		this.reqType = reqType;
		this.reqTitle = reqTitle;
		this.reqContent = reqContent;
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.reqReply = reqReply;
	}

	public String getReqType() {
		return reqType;
	}

	public String getReqTitle() {
		return reqTitle;
	}

	public String getReqContent() {
		return reqContent;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public String getReqReply() {
		return reqReply;
	}

	public void setReqType(String reqType) {
		this.reqType = reqType;
	}

	public void setReqTitle(String reqTitle) {
		this.reqTitle = reqTitle;
	}

	public void setReqContent(String reqContent) {
		this.reqContent = reqContent;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public void setReqReply(String reqReply) {
		this.reqReply = reqReply;
	}
	
}
