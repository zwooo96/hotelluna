package kr.co.sist.user.reservation.vo;

public class RoomSearchVO {
	private String checkIn, checkOut;
	private int maxGuest;
	
	public RoomSearchVO() {
	}

	public RoomSearchVO(String checkIn, String checkOut, int maxGuest) {
		super();
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.maxGuest = maxGuest;
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

	public int getMaxGuest() {
		return maxGuest;
	}

	public void setMaxGuest(int maxGuest) {
		this.maxGuest = maxGuest;
	}

}//class
