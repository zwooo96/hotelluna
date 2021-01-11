package kr.co.sist.user.intro.dao;

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

import kr.co.sist.user.intro.vo.IntroVO;

public class IntroDAO {
	
	private static IntroDAO introDAO;
	
	private IntroDAO() {
	}
	
	public static IntroDAO getInstance() {
		if(introDAO == null) {
			introDAO = new IntroDAO();
		}
		return introDAO;
	}
	
	private Connection getConn() throws SQLException{
		Connection con = null;
		Context ctx = null;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/luna_dbcp");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public IntroVO selectRoomIntro(String roomName) throws SQLException {
		IntroVO iVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConn();
			String selectAllRoom = "select room_intro, img1, img2 from room_type where room_name=?";
			pstmt = con.prepareStatement(selectAllRoom);
			pstmt.setString(1, roomName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				iVO = new IntroVO(roomName, rs.getString("img1"), rs.getString("img2"), rs.getString("room_intro"));
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
		return iVO;
	}
	
	public List<String> selecctAllRoomName() throws SQLException {
		List<String> roomNameList = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConn();
			String selectAllRoom = "select room_name from room_type";
			pstmt = con.prepareStatement(selectAllRoom);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(roomNameList == null) {
					roomNameList = new ArrayList<String>();
				}
				String name = rs.getString("room_name");
				roomNameList.add(name);
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
		return roomNameList;
	}
	
	
	
}
