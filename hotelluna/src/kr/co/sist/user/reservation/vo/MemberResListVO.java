package kr.co.sist.user.reservation.vo;

public class MemberResListVO {
	private String resNum, roomName, checkIn, checkOut, requirements;

	public MemberResListVO() {
	}

	public MemberResListVO(String resNum, String roomName, String checkIn, String checkOut, String requirements) {
		this.resNum = resNum;
		this.roomName = roomName;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.requirements = requirements;
	}

	public String getResNum() {
		return resNum;
	}

	public void setResNum(String resNum) {
		this.resNum = resNum;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	
}//class
