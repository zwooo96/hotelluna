package kr.co.sist.user.intro.vo;

/**
 * 사용자 - 호텔 방 소개 정보를 가진 클래스
 * 
 * @author BEAN
 */
public class IntroVO {
	private String roomName;
	private String img1;
	private String img2;
	private String roomInfo;
	
	public IntroVO() {
	}

	public IntroVO(String roomName, String img1, String img2, String roomInfo) {
		this.roomName = roomName;
		this.img1 = img1;
		this.img2 = img2;
		this.roomInfo = roomInfo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
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

	public String getRoomInfo() {
		return roomInfo;
	}

	public void setRoomInfo(String roomInfo) {
		this.roomInfo = roomInfo;
	}
}
