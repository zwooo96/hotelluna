package kr.co.sist.mgr.room.vo;

public class MgrRoomVO {
	private String roomName, amenity, roomInputDate, intro, roomSize,img1, img2, img3, img4, img5;
	private int roomCnt, price, maxGuest, roomNum;
	
	public MgrRoomVO() {
	}

	public MgrRoomVO(String roomName, String amenity, String roomInputDate, String intro, String roomSize, String img1,
			String img2, String img3, String img4, String img5, int roomCnt, int price, int maxGuest, int roomNum) {
		super();
		this.roomName = roomName;
		this.amenity = amenity;
		this.roomInputDate = roomInputDate;
		this.intro = intro;
		this.roomSize = roomSize;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.img5 = img5;
		this.roomCnt = roomCnt;
		this.price = price;
		this.maxGuest = maxGuest;
		this.roomNum = roomNum;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getAmenity() {
		return amenity;
	}

	public void setAmenity(String amenity) {
		this.amenity = amenity;
	}

	public String getRoomInputDate() {
		return roomInputDate;
	}

	public void setRoomInputDate(String roomInputDate) {
		this.roomInputDate = roomInputDate;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public String getImg5() {
		return img5;
	}

	public void setImg5(String img5) {
		this.img5 = img5;
	}

	public int getRoomCnt() {
		return roomCnt;
	}

	public void setRoomCnt(int roomCnt) {
		this.roomCnt = roomCnt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMaxGuest() {
		return maxGuest;
	}

	public void setMaxGuest(int maxGuest) {
		this.maxGuest = maxGuest;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}


		
	
	
}//class
