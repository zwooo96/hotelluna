package kr.co.sist.user.reservation.vo;

public class ResAddVO {
	private String id, checkIn, checkOut, requirements, roomName, roomNum;
	private int totalPrice, resPerson;
	
	public ResAddVO() {
	}

	public ResAddVO(String id, String checkIn, String checkOut, String requirements, String roomName, String roomNum,
			int totalPrice, int resPerson) {
		super();
		this.id = id;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.requirements = requirements;
		this.roomName = roomName;
		this.roomNum = roomNum;
		this.totalPrice = totalPrice;
		this.resPerson = resPerson;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getResPerson() {
		return resPerson;
	}

	public void setResPerson(int resPerson) {
		this.resPerson = resPerson;
	}
	
}//class
