package kr.co.sist.user.member.vo;

/**
 * 회원정보를 추가하는 VO
 * @author sist38
 *
 */
public class MemberAddVO {
	
	private String nameKorF, nameKorL, nameEngF, nameEngL,
			birthYear, birthMonth, birthDay, phoneType, phoneCountry, phoneNum,
			email, id,ip, pass, gender;

	public MemberAddVO() {
		
	}

	public MemberAddVO(String nameKorF, String nameKorL, String nameEngF, String nameEngL, String birthYear,
			String birthMonth, String birthDay, String phoneType, String phoneCountry, String phoneNum, String email,
			String id, String ip, String pass, String gender) {
		super();
		this.nameKorF = nameKorF;
		this.nameKorL = nameKorL;
		this.nameEngF = nameEngF;
		this.nameEngL = nameEngL;
		this.birthYear = birthYear;
		this.birthMonth = birthMonth;
		this.birthDay = birthDay;
		this.phoneType = phoneType;
		this.phoneCountry = phoneCountry;
		this.phoneNum = phoneNum;
		this.email = email;
		this.id = id;
		this.ip = ip;
		this.pass = pass;
		this.gender = gender;
	}

	public String getNameKorF() {
		return nameKorF;
	}

	public void setNameKorF(String nameKorF) {
		this.nameKorF = nameKorF;
	}

	public String getNameKorL() {
		return nameKorL;
	}

	public void setNameKorL(String nameKorL) {
		this.nameKorL = nameKorL;
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

	public String getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public String getBirthMonth() {
		return birthMonth;
	}

	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	
}