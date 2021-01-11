package kr.co.sist.mgr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.sist.mgr.member.vo.MgrMemberListVO;
import kr.co.sist.mgr.member.vo.MgrMemberVO;


public class MgrMemberDAO {
	
	private static MgrMemberDAO mgrMemberDAO;
	
	public static MgrMemberDAO getInstance() {
		if(mgrMemberDAO == null) {
			mgrMemberDAO = new MgrMemberDAO();
		}//end if
		return mgrMemberDAO;
	}//getInstance
	
	private Connection getConn() throws SQLException{

		Connection con=null;
		//1. JNDI 사용객체 생성
		try {
			Context ctx = new InitialContext();
		//2. DBCP에서 DB연결 객체 얻기.
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/luna_dbcp");
		//3. Connection 얻기
			con=ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}//end catch
		
		return con; 
	}//getConn
	
	
	
	private MgrMemberDAO() {
	}

	/**
	 * 모든 고객을 조회하기 위한 메소드
	 * @return
	 * @throws SQLException
	 */
	public List<MgrMemberVO> selectAllMember(MgrMemberListVO mmlVO) throws SQLException{
		List<MgrMemberVO> memberList = new ArrayList<MgrMemberVO>();
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=getConn();
			
			StringBuilder selectAllMember = new StringBuilder();
			selectAllMember
			.append("	select id, name_kor_l, name_kor_f, name_eng_l, name_eng_f, phone_type, country_num, phone, email, gender, birthday, input_date	")
			.append("	from(select row_number() over(order by input_date desc) r_num, id, name_kor_l, name_kor_f, name_eng_l, name_eng_f, phone_type, country_num, phone, email, gender, birthday, input_date	")
			.append("	from hotel_member)	")
			.append("	where r_num between ? and ?	");
			
			pstmt=con.prepareStatement(selectAllMember.toString());
			pstmt.setInt(1, mmlVO.getStartNum());
			pstmt.setInt(2, mmlVO.getEndNum());
			
			rs=pstmt.executeQuery();
			
			MgrMemberVO mmVO = null;
			
			while(rs.next()) {
//				mmVO=new MgrMemberVO(rs.getString("id"), rs.getString("email"), rs.getString("name_kor_f"), rs.getString("name_kor_l"), rs.getString("name_eng_f"), rs.getString("name_eng_l"),
//						,rs.getString("birthday"), rs.getString("phone_type"), rs.getString("country_num"), rs.getString("phone"), rs.getString("gender"));
				String birthDay = rs.getString("birthday");
				System.out.println(birthDay);
				String birthYear = birthDay.split("-")[0];
				System.out.println(birthYear);
				String birthMonth= birthDay.split("-")[1];
				System.out.println(birthMonth);
				String birthday = birthDay.split("-")[2];
				System.out.println(birthday);
				mmVO = new MgrMemberVO(rs.getString("id"), rs.getString("email"),rs.getString("name_kor_f"),
										rs.getString("name_kor_l"),rs.getString("name_eng_f"),
										rs.getString("name_eng_l"),
										birthYear,birthMonth,birthday,
										rs.getString("phone_type"),
										rs.getString("country_num"),rs.getString("phone"),
										rs.getString("gender"), rs.getString("input_date")
										);
											
				memberList.add(mmVO);
			}//end while
			
		}finally {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		}//end catch
		
		
		return memberList;
	}//selectAllMember
	
	/**
	 * 게시물 개수 세기
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCnt() throws SQLException{
		int totalCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConn();
			
			String selectCnt = "select count(*) cnt from hotel_member";
			pstmt = con.prepareStatement(selectCnt);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			}//end if
			
		}finally {
			if( rs != null ) {rs.close();} //end if
			if( pstmt != null ) {pstmt.close();} //end if
			if( con != null ) {con.close();} //end if
		}//end finally
		
		return totalCnt;
	}//selectTotalCnt
	
	
}//class

















