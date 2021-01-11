package kr.co.sist.user.reservation.vo;

public class ResDetailVO {
	private String resNum, checkIn, checkOut, resPerson, roomName, requirements;
	private int totalPrice;
	
	public ResDetailVO() {
	}

	public ResDetailVO(String resNum, String checkIn, String checkOut, String resPerson, String roomName,
			String requirements, int totalPrice) {
		this.resNum = resNum;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.resPerson = resPerson;
		this.roomName = roomName;
		this.requirements = requirements;
		this.totalPrice = totalPrice;
	}

	public String getResNum() {
		return resNum;
	}

	public void setResNum(String resNum) {
		this.resNum = resNum;
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

	public String getResPerson() {
		return resPerson;
	}

	public void setResPerson(String resPerson) {
		this.resPerson = resPerson;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "ResDetailVO [resNum=" + resNum + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", resPerson="
				+ resPerson + ", roomName=" + roomName + ", requirements=" + requirements + ", totalPrice=" + totalPrice
				+ "]";
	}
	
}//class
