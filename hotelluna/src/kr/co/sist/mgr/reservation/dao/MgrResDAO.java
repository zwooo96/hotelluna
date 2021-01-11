package kr.co.sist.mgr.reservation.dao;

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

import kr.co.sist.mgr.reservation.vo.MgrResDetailVO;
import kr.co.sist.mgr.reservation.vo.MgrResListVO;
import kr.co.sist.mgr.reservation.vo.MgrResSearchVO;
import kr.co.sist.mgr.reservation.vo.MgrResVO;

/**
 * 예약목록 조회, 개별 예약사항 디테일 조회, 예약 삭제, Pagination
 * @author JU
 */
public class MgrResDAO {

	private static MgrResDAO mrs_dao;
	
	private MgrResDAO() {
	}
	
	public static MgrResDAO getInstance() {
		if(mrs_dao == null) {
			mrs_dao = new MgrResDAO();
		}//end if
		return mrs_dao;
	}//getInstance
	
	private Connection getConn() throws SQLException {
		Connection con = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/luna_dbcp");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}//end catch
		
		return con;
	}//getConn
	
	/**
	 * 검색어를 받아 예약 목록을 조회
	 * @param mrsVO
	 * @param mrlVO
	 * @return
	 * @throws SQLException
	 */
	public List<MgrResVO> selectSearchList(MgrResSearchVO mrsVO, MgrResListVO mrlVO) throws SQLException{
		
		List<MgrResVO> resList = new ArrayList<MgrResVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConn();
			
			StringBuilder selectSearch = new StringBuilder();
			selectSearch
			.append("	select res_num, id, checkin, checkout	")
			.append("	from(select row_number() over(order by res_num desc) r_num, res_num, id, checkin, checkout	")
			.append("	from reservation)	")
			.append(" where ");
			
			if( (mrsVO.getKeyword() != null) && (!"".equals(mrsVO.getKeyword())) ) {
				selectSearch.append(mrsVO.getType()).append(" like '%'||?||'%' and ");
			}//end if
			
			selectSearch.append("		r_num between ? and ?	");
			
			pstmt = con.prepareStatement(selectSearch.toString());
			
			int index=0;
			if( (mrsVO.getKeyword() != null) && (!"".equals(mrsVO.getKeyword())) ) {
				pstmt.setString(++index, mrsVO.getKeyword());
			}//end if
			
			pstmt.setInt(++index, mrlVO.getStartNum());
			pstmt.setInt(++index, mrlVO.getEndNum());
			
			rs = pstmt.executeQuery();
			
			MgrResVO mrVO = null;
			
			while(rs.next()) {
				mrVO = new MgrResVO(rs.getInt("res_num"), rs.getString("id"), rs.getString("checkin"), rs.getString("checkout"));
				resList.add(mrVO);
			}//end while
			
		}finally {
			if( rs != null ) {rs.close();} //end if
			if( pstmt != null ) {pstmt.close();} //end if
			if( con != null ) {con.close();} //end if
		}//end finally
		
		return resList;
		
	}//selectSearchList
	
	/**
	 * 개별 예약 디테일 조회
	 * @param resNum 예약번호
	 * @return
	 * @throws SQLException
	 */
	public MgrResDetailVO selectResDetail(int resNum) throws SQLException {
		
		MgrResDetailVO mrdVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConn();
			
			StringBuilder selectOneRes = new StringBuilder();
			selectOneRes
			.append("	select id, res_num, checkin, checkout, res_person, room_name, requirements, total_price	")
			.append("	from reservation	")
			.append("	where res_num=?	");
			
			pstmt = con.prepareStatement(selectOneRes.toString());
			pstmt.setInt(1, resNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mrdVO = new MgrResDetailVO(rs.getString("id"), rs.getString("room_name"),
															rs.getString("checkin"), rs.getString("checkout"), rs.getString("requirements"),
															rs.getInt("res_person"), rs.getInt("total_price"), rs.getInt("res_num"));
			}//end if
			
		}finally {
			if( rs != null ) {rs.close();} //end if
			if( pstmt != null ) {pstmt.close();} //end if
			if( con != null ) {con.close();} //end if
		}//end finally
		
		return mrdVO;
		
	}//selectResDetail
	
	/**
	 * 개별 예약 삭제
	 * @param resNum 예약번호
	 * @return
	 * @throws SQLException 
	 */
	public int deleteResInfo(int resNum) throws SQLException {
		
		int deleteCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConn();
			String deleteRes = "delete from reservation where res_num=?";
			pstmt = con.prepareStatement(deleteRes);
			pstmt.setInt(1, resNum);
			deleteCnt = pstmt.executeUpdate();
		}finally {
			if( pstmt != null ) {pstmt.close();} //end if
			if( con != null ) {con.close();} //end if
		}//end finally
		
		return deleteCnt;
		
	}//deleteResInfo
	
	/**
	 * 게시물 개수 조회
	 * @param mrsVO
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCnt(MgrResSearchVO mrsVO) throws SQLException {
		
		int totalCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConn();
			
			StringBuilder selectCnt = new StringBuilder();
			selectCnt
			.append("	select count(*) cnt from reservation	");
			
			if( (mrsVO.getKeyword() != null) && (!"".equals(mrsVO.getKeyword())) ){
				selectCnt.append(" where ").append(mrsVO.getType()).append(" like '%'||?||'%'");
			}//end if

			pstmt = con.prepareStatement(selectCnt.toString());
			
			if( (mrsVO.getKeyword() != null) && (!"".equals(mrsVO.getKeyword())) ){
				pstmt.setString(1, mrsVO.getKeyword());
			}//end if

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
