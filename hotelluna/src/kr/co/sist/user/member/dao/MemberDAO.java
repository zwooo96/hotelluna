package kr.co.sist.user.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.sist.user.member.vo.IdVO;
import kr.co.sist.user.member.vo.LoginResultVO;
import kr.co.sist.user.member.vo.LoginVO;
import kr.co.sist.user.member.vo.MemberAddVO;
import kr.co.sist.user.member.vo.MemberInfoVO;
import kr.co.sist.user.member.vo.MemberModifyVO;
import kr.co.sist.user.member.vo.PassCheckVO;
import kr.co.sist.user.member.vo.PassModifyVO;
import kr.co.sist.user.member.vo.PassVO;

public class MemberDAO {
	
	private static MemberDAO memberDAO;
	
	private MemberDAO() {
		
	}//MemberDAO
	
	public static MemberDAO getInstance() {
		
		if(memberDAO == null) {
			memberDAO = new MemberDAO();
		}//end if
		
		
		return memberDAO;
	}//getInstance
	
	
	private Connection getConn() throws SQLException {
		
		Connection con = null;
		
		try {
			//1. JNDI(Java Naming Datebase Interface) ��밴ü ����
			Context ctx = new InitialContext();
			//2. DBCP���� DB ���� ��ü ���
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/luna_dbcp");
			//3. Connection ���
			con = ds.getConnection();
		} catch (NamingException e ) {
			e.printStackTrace();
		}//end catch
		return con;
		
	}//getConn
	
	
	
	
	
	
	/**
	 * ȸ�������Ҷ� �ʿ��� ���� 
	 * @param memAddVO
	 * @throws SQLException
	 */
	public void insertMember(MemberAddVO memAddVO) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = getConn();
			
			StringBuilder insertMember = new StringBuilder();
			
			insertMember.append("	insert into	hotel_member")
			.append("(id, pass, name_kor_f, name_kor_l, name_eng_f, name_eng_l, country_num, phone, phone_type, birthday, gender, email, ip)")
			.append("	values(?,?,?,?,?,?,?,?,?,?,?,?,?)	");
			
			pstmt = con.prepareStatement(insertMember.toString());
			
			pstmt.setString(1, memAddVO.getId()); //���̵� 
			pstmt.setString(2, memAddVO.getPass()); //�н����� 
			pstmt.setString(3, memAddVO.getNameKorF()); // �ѱ� �̸� 
			pstmt.setString(4, memAddVO.getNameKorL()); // �ѱ� �� 
			pstmt.setString(5, memAddVO.getNameEngF()); // ���� �̸� 
			pstmt.setString(6, memAddVO.getNameEngL()); // ���� �� 
			pstmt.setString(7, memAddVO.getPhoneCountry()); // ������ ���� ��ȣ ��
			pstmt.setString(8, memAddVO.getPhoneNum());	 // ���ѹ� 
			pstmt.setString(9, memAddVO.getPhoneType()); // ��������� �������� 

			StringBuilder birthday=new StringBuilder();
			
			birthday.append(memAddVO.getBirthYear()).append("-").append(memAddVO.getBirthMonth()).append("-")
					.append(memAddVO.getBirthDay());
			
			pstmt.setString(10, birthday.toString()); // ��,��,���� birthday�� �ٿ��� ����
			pstmt.setString(11, memAddVO.getGender()); // ����
			
			pstmt.setString(12, memAddVO.getEmail()); 
			pstmt.setString(13, memAddVO.getIp()); 
			
			pstmt.executeUpdate();
			
			
		}finally {
			//���� ����
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
		}//end finally
	
		
		
	}//insertMember
	
	/**
	 * �����ڿ� ������� id�� �����ϴ� method
	 * @param logVO
	 * @return
	 * @throws SQLException
	 */
	public LoginResultVO selectLoginName(LoginVO logVO) throws SQLException {
		
		
		LoginResultVO lRVO =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			
			StringBuilder selectLoginName = new StringBuilder();
			selectLoginName.append(" select concat(name_kor_l,name_kor_f) kname, concat(name_eng_f,name_eng_l) ename, admin_flag ")
							.append(" from hotel_member ")
							.append(" where id= ? and pass =? ");	

			
			
			pstmt = con.prepareStatement(selectLoginName.toString());
			pstmt.setString(1, logVO.getId());
			pstmt.setString(2, logVO.getPass());
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String kname = rs.getString("kname");
				String ename = rs.getString("ename");
				String flag = rs.getString("admin_flag");
				lRVO = new LoginResultVO(kname,ename,flag);
			}
			//name�� ���ٸ� �α��� ���� 
			
		    }finally {
			//���� ���� 
			if(rs!=null) {
				rs.close();
			}//end if
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
		}//end finally
	
		return lRVO;
	}//selectLoginName

	/**
	 * ���̵� ã��
	 * @param idVO
	 * @return
	 * @throws SQLException
	 */
	public String selectMemberById(IdVO idVO)throws SQLException{
		
		String result="";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			StringBuilder selectMemberById = new StringBuilder();
			
			selectMemberById.append(" select id ")
							.append(" from hotel_member ")
							.append(" where NAME_ENG_F=? and NAME_ENG_L=? and EMAIL=? ");	
			
			pstmt = con.prepareStatement(selectMemberById.toString());
			pstmt.setString(1, idVO.getNameEngF());
			pstmt.setString(2, idVO.getNameEngL());
			
			StringBuilder email = new StringBuilder();
			email.append(idVO.getEmail1()).append("@").append(idVO.getEmail2());
			
			pstmt.setString(3, email.toString());

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString("id");
			}//end if
			
			
		    }finally {
			//���� ���� 
			if(rs!=null) {
				rs.close();
			}//end if
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
			
		}//end finally
		
		return result;
	}//selectMemberById
	
	/**
	 * ��й�ȣ ã�� 
	 * @param passVO
	 * @return
	 * @throws SQLException
	 */
public String selectMemberByPass(PassVO passVO) throws SQLException{
		
		String pass = "";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			StringBuilder selectMemberByPass = new StringBuilder();
			
			selectMemberByPass.append(" select pass ")
							.append(" from hotel_member ")
							.append(" where id=? and NAME_ENG_F=? and NAME_ENG_L=? and EMAIL=? ");	
			
			pstmt = con.prepareStatement(selectMemberByPass.toString());
			pstmt.setString(1, passVO.getId());
			pstmt.setString(2, passVO.getNameEngF());
			pstmt.setString(3, passVO.getNameEngL());
			
			StringBuilder email = new StringBuilder();
			email.append(passVO.getEmail1()).append("@").append(passVO.getEmail2());
			
			pstmt.setString(4, email.toString());

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pass = rs.getString("pass"); //insertMember���� �̹� ��ȣȭ�Ǿ� ���� �ִ� pass�� ���� �´�
			}
			
			
		    }finally {
			//���� ���� 
			if(rs!=null) {
				rs.close();
			}//end if
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
			
		}//end finally
		
		return pass;
		
	}//selectMemberByPass
	
	/**
	 * �̸��� �ߺ� Ȯ�� 
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean selectDupEmail(String email)throws SQLException{
		
		boolean mailFlag= false; //false�� �̸��� �ߺ��� 

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			StringBuilder selectMemberByPass = new StringBuilder();
			
			selectMemberByPass.append(" select email ")
							.append(" from hotel_member ")
							.append(" where email = ? ");
			
			pstmt = con.prepareStatement(selectMemberByPass.toString());
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				
				mailFlag = true; //
			}
			
		    }finally {
			//���� ���� 
			if(rs!=null) {
				rs.close();
			}//end if
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
			
		}//end finally
		
		return mailFlag;
		
		
	}//selectDupEmail
	
	/**
	 * ���̵� �ߺ�
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean selectDupId(String id)throws SQLException{
		
		boolean idFlag = false; //false�� id�� �ߺ�
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			StringBuilder selectMemberByPass = new StringBuilder();
			
			selectMemberByPass.append(" select id ")
							.append(" from hotel_member ")
							.append(" where id = ? ");
			
			pstmt = con.prepareStatement(selectMemberByPass.toString());
			pstmt.setString(1,id );
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				
				idFlag = true; //
			}
			
		    }finally {
			//���� ���� 
			if(rs!=null) {
				rs.close();
			}//end if
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
			
		}//end finally
		
		return idFlag;
		
	}//selectDupId
	
	/**
	 * ������������ �� �� ���̵�� ��й�ȣ�� Ȯ��
	 * @param passchekVO
	 * @return
	 * @throws SQLException
	 */
	public boolean selectCheckPass(PassCheckVO passchekVO) throws SQLException{
		
		boolean passChkFlag = false; //false�� ��й�ȣ�� Ʋ��
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			StringBuilder selectMemberByPass = new StringBuilder();
			
			selectMemberByPass.append(" select id ")
							.append(" from hotel_member ")
							.append(" where id = ? and pass=?");
			
			pstmt = con.prepareStatement(selectMemberByPass.toString());
			pstmt.setString(1, passchekVO.getId());
			pstmt.setString(2, passchekVO.getPass());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				passChkFlag = true; //pass�� ������ 
			}
			
		    }finally {
			//���� ���� 
			if(rs!=null) {
				rs.close();
			}//end if
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
			
		}//end finally
		
		return passChkFlag;
	}//selectCheckPass
	
	/**
	 * myPage�� �������� ������ 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public MemberInfoVO selectMemberInfo(String id)throws SQLException{
		MemberInfoVO memInfoVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			StringBuilder selectMemberInfo = new StringBuilder();
			
			selectMemberInfo.append(" select id,name_kor_l, name_kor_f , name_eng_f, name_eng_l, ")
							.append(" country_num, phone_type, phone,  birthday, gender, email ")
							.append(" from hotel_member ")
							.append(" where id = ? ");
			
			
			

			
			pstmt = con.prepareStatement(selectMemberInfo.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String email=rs.getString("email");
				String email1= email.substring(0,email.indexOf("@"));
				String email2= email.substring(email.lastIndexOf("@")+1);

				
				memInfoVO = new MemberInfoVO(rs.getString("name_kor_l"),rs.getString("name_kor_f"),rs.getString("name_eng_f"),
											rs.getString("name_eng_l"), rs.getString("birthday"),rs.getString("phone_type"),rs.getString("country_num"),
											rs.getString("phone"),email1,email2,rs.getString("id"),rs.getString("gender"));
		
			}
			
			
			}finally {
			//���� ���� 
			if(rs!=null) {
				rs.close();
			}//end if
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
			
		}//end finally
		
		
		return memInfoVO;
	}//selectMemberInfo
	
	/**
	 * ���������� ����
	 * @param memModifyVO
	 * @return
	 * @throws SQLException
	 */
	public int updateMember(MemberModifyVO memModiVO) throws SQLException{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			con = getConn();
			StringBuilder updateMember = new StringBuilder();
			
			updateMember.append(" update hotel_member ")
							.append(" set email=?,phone_type=?,country_num=?,phone=? ")
							.append(" where id = ? ");

			pstmt = con.prepareStatement(updateMember.toString());
			//���ε� ������ �� �ֱ�
			pstmt.setString(1, memModiVO.getEmail());
			pstmt.setString(2,memModiVO.getpType());
			pstmt.setString(3, memModiVO.getpCountry());
			pstmt.setString(4, memModiVO.getpNum());
			pstmt.setString(5, memModiVO.getId() );
			
			
			result = pstmt.executeUpdate();
			
			
			}finally {
			//���� ���� 
			if(pstmt!=null) {
				pstmt.close();
			}//end if
			if(con!=null) {
				con.close();
			}//end if
			
		}//end finally
		
		return result;
	
	}//updateMember
	
	
	
	/**
	 * ��й�ȣ ���� 
	 * @param passModiVO
	 * @return
	 * @throws SQLException
	 */
	public int updatePass(PassModifyVO passModiVO) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			
			StringBuilder updatePass = new StringBuilder();
			
			updatePass.append("	update hotel_member	")
					  .append("	set	pass =? ")
					  .append("	where id = ? and pass=? ");
			
			
			pstmt = con.prepareStatement(updatePass.toString());
			pstmt.setString(1, passModiVO.getNewPass() );
			pstmt.setString(2, passModiVO.getId());
			pstmt.setString(3, passModiVO.getPass());
			
			result = pstmt.executeUpdate();
			
			
		}finally {
			
			if(rs!=null){rs.close();}//end if
			if(pstmt!=null){pstmt.close();}//end if
			if(con!=null){con.close();}//end if
			
		}//end finally
		
		
		return result;
	}//updatePass
	
}//class
