package kr.co.sist.mgr.room.vo;

public class MgrMemberVO {
	
	private String id,email, fNameKor, lNameKor, fNameEng, lNameEng, birthYear, birthMonth, birthDay, pType, pCountry, pNum, gender;

	public MgrMemberVO() {
	}

	public MgrMemberVO(String id, String email, String fNameKor, String lNameKor, String fNameEng, String lNameEng,
			String birthYear, String birthMonth, String birthDay, String pType, String pCountry, String pNum,
			String gender) {
		super();
		this.id = id;
		this.email = email;
		this.fNameKor = fNameKor;
		this.lNameKor = lNameKor;
		this.fNameEng = fNameEng;
		this.lNameEng = lNameEng;
		this.birthYear = birthYear;
		this.birthMonth = birthMonth;
		this.birthDay = birthDay;
		this.pType = pType;
		this.pCountry = pCountry;
		this.pNum = pNum;
		this.gender = gender;
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

	public String getfNameKor() {
		return fNameKor;
	}

	public void setfNameKor(String fNameKor) {
		this.fNameKor = fNameKor;
	}

	public String getlNameKor() {
		return lNameKor;
	}

	public void setlNameKor(String lNameKor) {
		this.lNameKor = lNameKor;
	}

	public String getfNameEng() {
		return fNameEng;
	}

	public void setfNameEng(String fNameEng) {
		this.fNameEng = fNameEng;
	}

	public String getlNameEng() {
		return lNameEng;
	}

	public void setlNameEng(String lNameEng) {
		this.lNameEng = lNameEng;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
}//class
