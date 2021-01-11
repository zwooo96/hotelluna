package kr.co.sist.user.member.vo;

/**
 * 마이페이지 VO
 * @author sist38
 *
 */
public class MemberInfoVO {
	
	private String nameKorL, nameKorF, nameEngF, nameEngL,
			birthDay, phoneType, phoneCountry, phoneNum,
			email1, email2, id, gender;

	public MemberInfoVO() {
	}

	public MemberInfoVO(String nameKorL, String nameKorF, String nameEngF, String nameEngL, String birthDay,
			String phoneType, String phoneCountry, String phoneNum, String email1, String email2, String id,
			String gender) {
		super();
		this.nameKorL = nameKorL;
		this.nameKorF = nameKorF;
		this.nameEngF = nameEngF;
		this.nameEngL = nameEngL;
		this.birthDay = birthDay;
		this.phoneType = phoneType;
		this.phoneCountry = phoneCountry;
		this.phoneNum = phoneNum;
		this.email1 = email1;
		this.email2 = email2;
		this.id = id;
		this.gender = gender;
	}

	public String getNameKorL() {
		return nameKorL;
	}

	public void setNameKorL(String nameKorL) {
		this.nameKorL = nameKorL;
	}

	public String getNameKorF() {
		return nameKorF;
	}

	public void setNameKorF(String nameKorF) {
		this.nameKorF = nameKorF;
	}

	public String getNameEngF() {
		return nameEngF;
	}

	public void setNameEngF(String nameEngF) {
		this.nameEngF = nameEngF;
	}

	public String getNameEngL() {
		return nameEngL;
	}

	public void setNameEngL(String nameEngL) {
		this.nameEngL = nameEngL;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getPhoneType() {
		return phoneType;
	}

	public void setPhoneType(String phoneType) {
		this.phoneType = phoneType;
	}

	public String getPhoneCountry() {
		return phoneCountry;
	}

	public void setPhoneCountry(String phoneCountry) {
		this.phoneCountry = phoneCountry;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	
	

}
