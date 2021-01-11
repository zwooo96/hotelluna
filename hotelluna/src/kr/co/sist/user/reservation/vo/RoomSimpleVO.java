package kr.co.sist.user.reservation.vo;

public class RoomSimpleVO {
	private String roomNum, roomName, img, roomSize;
	private int price;
	
	public RoomSimpleVO() {
	}

	public RoomSimpleVO(String roomNum, String roomName, String img, String roomSize, int price) {
		super();
		this.roomNum = roomNum;
		this.roomName = roomName;
		this.img = img;
		this.roomSize = roomSize;
		this.price = price;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}//class
