package kr.co.sist.mgr.member.vo;

/**
 * Pagination�� �ϱ� ���� ������ VO
 * @author sist39
 */
public class MgrMemberListVO {
	private int startNum, endNum;

	public MgrMemberListVO() {
	}

	public MgrMemberListVO(int startNum, int endNum) {
		this.startNum = startNum;
		this.endNum = endNum;
	}

	public int getStartNum() {
		return startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

}
