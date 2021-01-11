package kr.co.sist.mgr.member.vo;

public class MgrMemberVO {
	
	private String id,email, fNameKor, lNameKor, fNameEng, lNameEng, birthYear, birthMonth, birthDay, pType, pCountry, pNum, gender, inputDate;

	public MgrMemberVO() {
	}

	public MgrMemberVO(String id, String email, String fNameKor, String lNameKor, String fNameEng, String lNameEng,
			String birthYear, String birthMonth, String birthDay, String pType, String pCountry, String pNum,
			String gender, String inputDate) {
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
		this.inputDate = inputDate;
	}

	public String getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getfNameKor() {
		return fNameKor;
	}

	public String getlNameKor() {
		return lNameKor;
	}

	public String getfNameEng() {
		return fNameEng;
	}

	public String getlNameEng() {
		return lNameEng;
	}

	public String getBirthYear() {
		return birthYear;
	}

	public String getBirthMonth() {
		return birthMonth;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public String getpType() {
		return pType;
	}

	public String getpCountry() {
		return pCountry;
	}

	public String getpNum() {
		return pNum;
	}

	public String getGender() {
		return gender;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setfNameKor(String fNameKor) {
		this.fNameKor = fNameKor;
	}

	public void setlNameKor(String lNameKor) {
		this.lNameKor = lNameKor;
	}

	public void setfNameEng(String fNameEng) {
		this.fNameEng = fNameEng;
	}

	public void setlNameEng(String lNameEng) {
		this.lNameEng = lNameEng;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public void setpCountry(String pCountry) {
		this.pCountry = pCountry;
	}

	public void setpNum(String pNum) {
		this.pNum = pNum;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

}//class
