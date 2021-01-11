package kr.co.sist.user.faq.vo;

public class ReqDetailVO {
	private String type, title;
	private String reqContent;
	private String reply;
	private String replyInputdate;
	
	public ReqDetailVO() {
	}

	public ReqDetailVO(String type, String title, String reqContent) {
		this.type = type;
		this.title = title;
		this.reqContent = reqContent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReqContent() {
		return reqContent;
	}

	public void setReqContent(String reqContent) {
		this.reqContent = reqContent;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReplyInputdate() {
		return replyInputdate;
	}

	public void setReplyInputdate(String replyInputdate) {
		this.replyInputdate = replyInputdate;
	}
	
	
	
	
}
