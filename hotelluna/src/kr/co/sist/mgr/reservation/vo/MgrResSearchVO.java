package kr.co.sist.mgr.reservation.vo;

/**
 * 예약번호 또는 아이디를 이용해 검색하기 위한 목적의 VO
 * @author sist39
 */
public class MgrResSearchVO {
	private String type, keyword;
	//type : id(String), resNum(int)
	
	public MgrResSearchVO() {
	}

	public MgrResSearchVO(String type, String keyword) {
		this.type = type;
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
