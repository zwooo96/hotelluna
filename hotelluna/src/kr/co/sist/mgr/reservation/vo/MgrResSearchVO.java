package kr.co.sist.mgr.reservation.vo;

/**
 * �����ȣ �Ǵ� ���̵� �̿��� �˻��ϱ� ���� ������ VO
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
