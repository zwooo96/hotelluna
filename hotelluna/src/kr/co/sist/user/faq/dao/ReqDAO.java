package kr.co.sist.user.faq.dao;

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

import kr.co.sist.user.faq.vo.ReqAddVO;
import kr.co.sist.user.faq.vo.ReqCheckVO;
import kr.co.sist.user.faq.vo.ReqDetailVO;
import kr.co.sist.user.faq.vo.ReqVO;

/**
 * 사용자 - 문의사항 화면에 대한 DAO
 * @author sist37
 */
public class ReqDAO {

	private static ReqDAO rDAO;
	
	private ReqDAO() {
	}
	
	public static ReqDAO getInstance() {
		if(rDAO == null) {
			rDAO = new ReqDAO();
		}
		return rDAO;
	}
	
	private Connection getConn() throws SQLException{
		Connection con = null;
		
		Context ctx = null;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/luna_dbcp");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * 문의사항을 DB에 삽입한다.
	 * @param raVO 문의사항에 대한 VO
	 * @throws SQLException insert는 1건이므로 삽입 실패하면 SQLException이 발생한다.
	 */
	public void insertReq(ReqAddVO raVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConn();
			String insertQuery = "insert into faq(req_num, req_type, req_title, req_content, id) values(seq_req_num.nextval, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(insertQuery);
			
			pstmt.setString(1, raVO.getReqType());
			pstmt.setString(2, raVO.getReqTitle());
			pstmt.setString(3, raVO.getReqContent());
			pstmt.setString(4, raVO.getUserId());
			pstmt.executeUpdate();
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
	}
	
	public List<ReqVO> selectMyReqList(String id) throws SQLException {
		List<ReqVO> reqList = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConn();
			
			String selectQuery = "select req_num, req_type, req_title, req_content, req_flag, to_char(req_input_date,'yyyy-mm-dd hh:mm') req_input_date from faq where id=? order by req_num desc";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(reqList == null) {
					reqList = new ArrayList<ReqVO>();
				}
				reqList.add(new ReqVO(rs.getString("req_type"),
															  rs.getString("req_title"), 
															  rs.getInt("req_num"), 
															  rs.getString("req_flag"),
															  rs.getString("req_input_date")
															 )
										);
				
			}
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		return reqList;
	}
	
	public ReqDetailVO selectMyReqDetail(ReqCheckVO rcVO) throws SQLException {
		ReqDetailVO rdVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConn();

			String selectQuery = "select req_type, req_title, req_content, req_flag from faq where id=? and req_num=?";
			
			pstmt = conn.prepareStatement(selectQuery);
			pstmt.setString(1, rcVO.getId());
			pstmt.setString(2, rcVO.getReqNum());
			
			rs = pstmt.executeQuery();
			boolean hasReply = false;
			if(rs.next()) {
				rdVO = new ReqDetailVO();
				rdVO.setType(rs.getString("req_type"));
				rdVO.setTitle(rs.getString("req_title"));
				rdVO.setReqContent(rs.getString("req_content"));
				hasReply = rs.getString("req_flag").equalsIgnoreCase("T")?true:false;
			}
			
			pstmt.close();
			if(hasReply) {
				String selectReplyQuery = "select reply, to_char(reply_inputdate,'yyyy-mm-dd hh:mm') reply_inputdate from faq_reply where req_num=?";
				pstmt = conn.prepareStatement(selectReplyQuery);
				pstmt.setString(1, rcVO.getReqNum());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					rdVO.setReply(rs.getString("reply"));
					rdVO.setReplyInputdate(rs.getString("reply_inputdate"));
				}
			}
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		
		return rdVO;
	}
	
	
}
