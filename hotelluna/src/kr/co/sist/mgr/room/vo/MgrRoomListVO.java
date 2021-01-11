package kr.co.sist.mgr.room.vo;

public class MgrRoomListVO {
	
	private String roomName, available;
	private int roomNum;
	
	public MgrRoomListVO() {
	}

	public MgrRoomListVO(String roomName, String available, int roomNum) {
		this.roomName = roomName;
		this.available = available;
		this.roomNum = roomNum;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	
}//class
