package kr.co.sist.mgr.faq.dao;

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

import kr.co.sist.mgr.faq.vo.MgrReqDetailVO;
import kr.co.sist.mgr.faq.vo.MgrReqListVO;
import kr.co.sist.mgr.faq.vo.MgrReqReplyVO;
import kr.co.sist.mgr.faq.vo.MgrReqVO;

/**
 * 문의사항 목록 조회, 개별 문의사항 디테일 조회, 문의사항 답변 추가, 문의사항 답변 수정, Pagination
 * @author JU
 */
public class MgrReqDAO {

	private static MgrReqDAO mrq_dao;
	
	private MgrReqDAO() {
	}

	public static MgrReqDAO getInstance() {
		if(mrq_dao == null) {
			mrq_dao = new MgrReqDAO();
		}//end if
		return mrq_dao;
	}//getInstance
	
	private Connection getConn() throws SQLException {
		Connection con = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/luna_dbcp");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}//end catch
		
		return con;
	}//getConn
	
	/**
	 * 전체 문의목록 조회
	 * @return
	 * @throws SQLException 
	 */
	public List<MgrReqVO> selectSearchReq(MgrReqListVO mrlVO) throws SQLException{
		
		List<MgrReqVO> reqList = new ArrayList<MgrReqVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConn();
			StringBuilder selectSearch = new StringBuilder();
			selectSearch
			.append("	select req_num, req_type, req_title, id, req_flag	")
			.append("	from(select row_number() over(order by req_num desc) r_num, req_num, req_type, req_title, id, req_flag	")
			.append("	from faq)	")
			.append("	where r_num between ? and ?	");
			pstmt = con.prepareStatement(selectSearch.toString());
			pstmt.setInt(1, mrlVO.getStartNum());
			pstmt.setInt(2, mrlVO.getEndNum());
			rs = pstmt.executeQuery();
		
			MgrReqVO mrVO = null;
			
			while(rs.next()) {
				mrVO = new MgrReqVO(rs.getInt("req_num"), rs.getString("req_type"),
																	rs.getString("req_title"), rs.getString("id"), rs.getString("req_flag"));
				reqList.add(mrVO);
			}//end while
			
		}finally {
			if( rs != null ) {rs.close();} //end if
			if( pstmt != null ) {pstmt.close();} //end if
			if( con != null ) {con.close();} //end if
		}//end finally
		
		return reqList;
		
	}//selectSearchReq
	
	/**
	 * 개별 문의내역 디테일 조회
	 * @param reqNum 문의번호
	 * @return
	 * @throws SQLException
	 */
	public MgrReqDetailVO selectReq(int reqNum) throws SQLException {
		
		MgrReqDetailVO mrdVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConn();
			
			StringBuilder selectOneReq = new StringBuilder();
			selectOneReq
			.append("	select f.req_type, hm.id, hm.email, hm.phone, f.req_title, f.req_content, fr.reply	")
			.append("	from	faq f, hotel_member hm, faq_reply fr")
			.append("	where (f.id = hm.id and fr.req_num (+)= f.req_num)	and f.req_num=? ");
			
			pstmt = con.prepareStatement(selectOneReq.toString());
			pstmt.setInt(1, reqNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mrdVO = new MgrReqDetailVO(rs.getString("req_type"), rs.getString("req_title"), rs.getString("req_content"),
																rs.getString("id"), rs.getString("email"), rs.getString("phone"), rs.getString("reply"));
			}//end if
			
		}finally {
			if( rs != null ) {rs.close();} //end if
			if( pstmt != null ) {pstmt.close();} //end if
			if( con != null ) {con.close();} //end if
		}//end finally
		
		return mrdVO;
		
	}//selectReq
	
	/**
	 * 개별 문의내역 답변추가
	 * @param mrrVO
	 * @throws SQLException
	 */
	public void insertReply(MgrReqReplyVO mrrVO) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConn();
			
			StringBuilder insertReply = new StringBuilder();
			insertReply
			.append("	insert into faq_reply	")
			.append("	(req_num, reply)	")
			.append("	values(?,?)	");
			
			pstmt = con.prepareStatement(insertReply.toString());
			pstmt.setInt(1, mrrVO.getReqNum());
			pstmt.setString(2, mrrVO.getReply());
			pstmt.executeUpdate();
			
			pstmt.close();
			
			StringBuilder updateReplyFlag = new StringBuilder();
			updateReplyFlag
			.append("	update faq	")
			.append("	set req_flag='T'	")
			.append("	where req_num=?	");
			
			pstmt=con.prepareStatement(updateReplyFlag.toString());
			pstmt.setInt(1, mrrVO.getReqNum());
			pstmt.executeUpdate();
			
		}finally {
			if( pstmt != null ) {pstmt.close();} //end if
			if( con != null ) {con.close();} //end if
		}//end finally
		
	}//insertReply

	/**
	 * 개별 문의내역 답변추가
	 * @param mrrVO
	 * @throws SQLException
	 */
	public void updateReply(MgrReqReplyVO mrrVO) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConn();
			
			StringBuilder updateReply = new StringBuilder();
			updateReply
			.append("	update faq_reply	")
			.append("	set reply=?	")
			.append("	where req_num=?	");
			
			pstmt = con.prepareStatement(updateReply.toString());
			pstmt.setString(1, mrrVO.getReply());
			pstmt.setInt(2, mrrVO.getReqNum());
			pstmt.executeUpdate();
			
		}finally {
			if( pstmt != null ) {pstmt.close();} //end if
			if( con != null ) {con.close();} //end if
		}//end finally
		
	}//updateReply
	
	/**
	 * 게시물 개수 조회
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCnt() throws SQLException {
		
		int totalCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConn();
			
			String selectCnt = "select count(*) cnt from faq";
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
