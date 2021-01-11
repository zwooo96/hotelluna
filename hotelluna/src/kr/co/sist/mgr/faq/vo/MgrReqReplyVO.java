package kr.co.sist.mgr.faq.vo;

/**
 * ������ ȭ�鿡�� ���ǿ� �亯�� �� �� �� ������ �����ϱ� ���� ������ VO
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
