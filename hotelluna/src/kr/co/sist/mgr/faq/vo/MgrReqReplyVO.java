package kr.co.sist.mgr.faq.vo;

/**
 * 관리자 화면에서 문의에 답변을 달 때 그 내용을 저장하기 위한 목적의 VO
 * @author JU
 */
public class MgrReqReplyVO {

	private int reqNum;
	private String reply;

	public MgrReqReplyVO() {
	}

	public MgrReqReplyVO(int reqNum, String reply) {
		this.reqNum = reqNum;
		this.reply = reply;
	}

	public int getReqNum() {
		return reqNum;
	}

	public String getReply() {
		return reply;
	}

	public void setReqNum(int reqNum) {
		this.reqNum = reqNum;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

}
