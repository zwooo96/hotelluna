package kr.co.sist.user.member.vo;

/**
 * 마이페이지 수정 
 * @author sist38
 *
 */
public class MemberModifyVO {

	private String id, email, pType, pCountry, pNum;

	public MemberModifyVO() {
	}

	public MemberModifyVO(String id, String email, String pType, String pCountry, String pNum) {
		super();
		this.id = id;
		this.email = email;
		this.pType = pType;
		this.pCountry = pCountry;
		this.pNum = pNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public String getpCountry() {
		return pCountry;
	}

	public void setpCountry(String pCountry) {
		this.pCountry = pCountry;
	}

	public String getpNum() {
		return pNum;
	}

	public void setpNum(String pNum) {
		this.pNum = pNum;
	}

	
	
}
