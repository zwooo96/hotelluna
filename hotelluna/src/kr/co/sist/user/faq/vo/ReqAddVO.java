package kr.co.sist.user.faq.vo;

/**
 * 사용자 - 문의사항 등록시 사용되는 클래스
 * @author sist37
 */
public class ReqAddVO {
	
	private String reqType;
	private String reqTitle;
	private String reqContent;
	private String userId;

	public ReqAddVO() {
	}

	public ReqAddVO(String userId, String reqType, String reqTitle, String reqContent) {
		this.reqType = reqType;
		this.reqTitle = reqTitle;
		this.reqContent = reqContent;
		this.userId = userId;
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

	public String getReqContent() {
		return reqContent;
	}

	public void setReqContent(String reqContent) {
		this.reqContent = reqContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
