package kr.co.sist.mgr.reservation.vo;

/**
 * ������ ȭ�鿡�� �������� �����ϰ� �����ֱ� ���� ������ VO
 * @author JU
 */
public class MgrResVO {

	private int resNum;
	private String id, checkIn, checkOut;

	public MgrResVO() {
	}

	public MgrResVO(int resNum, String id, String checkIn, String checkOut) {
		this.resNum = resNum;
		this.id = id;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
	}

	public int getResNum() {
		return resNum;
	}

	public String getId() {
		return id;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setResNum(int resNum) {
		this.resNum = resNum;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

}
