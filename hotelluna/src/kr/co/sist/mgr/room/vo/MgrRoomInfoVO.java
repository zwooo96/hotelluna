package kr.co.sist.mgr.room.vo;

public class MgrRoomInfoVO {
	
	private boolean infoFlag; 
	private int infoRoomNum;
	
	public MgrRoomInfoVO() {
		
	}

	public MgrRoomInfoVO(boolean infoFlag, int infoRoomNum) {
		super();
		this.infoFlag = infoFlag;
		this.infoRoomNum = infoRoomNum;
	}

	public boolean isInfoFlag() {
		return infoFlag;
	}

	public void setInfoFlag(boolean infoFlag) {
		this.infoFlag = infoFlag;
	}

	public int getInfoRoomNum() {
		return infoRoomNum;
	}

	public void setInfoRoomNum(int infoRoomNum) {
		this.infoRoomNum = infoRoomNum;
	}
	
	
	
}