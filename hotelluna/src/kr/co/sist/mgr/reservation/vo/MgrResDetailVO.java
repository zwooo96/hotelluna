package kr.co.sist.mgr.reservation.vo;

/**
 * 관리자 화면에서 개별 예약정보를 자세하게 보여주기 위한 목적의 VO
 * @author JU
 */
public class MgrResDetailVO {

	private String id, roomName, checkIn, checkOut, request;
	private int resPerson, price, resNum;
	
	public MgrResDetailVO() {
	}

	public MgrResDetailVO(String id, String roomName, String checkIn, String checkOut, String request, int resPerson,
			int price, int resNum) {
		this.id = id;
		this.roomName = roomName;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.request = request;
		this.resPerson = resPerson;
		this.price = price;
		this.resNum = resNum;
	}

	public String getId() {
		return id;
	}

	public String getRoomName() {
		return roomName;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public String getRequest() {
		return request;
	}

	public int getResPerson() {
		return resPerson;
	}

	public int getPrice() {
		return price;
	}

	public int getResNum() {
		return resNum;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public void setResPerson(int resPerson) {
		this.resPerson = resPerson;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setResNum(int resNum) {
		this.resNum = resNum;
	}

}
