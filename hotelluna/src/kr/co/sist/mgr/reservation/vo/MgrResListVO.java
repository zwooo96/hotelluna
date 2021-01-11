package kr.co.sist.mgr.reservation.vo;

/**
 * Pagination�� �ϱ� ���� ������ VO
 * @author sist39
 */
public class MgrResListVO {
	private int startNum, endNum;

	public MgrResListVO() {
	}

	public MgrResListVO(int startNum, int endNum) {
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
