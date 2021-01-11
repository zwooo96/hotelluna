package kr.co.sist.mgr.room.dao;

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

import kr.co.sist.mgr.room.vo.MgrRoomInfoVO;
import kr.co.sist.mgr.room.vo.MgrRoomListVO;
import kr.co.sist.mgr.room.vo.MgrRoomModifyVO;
import kr.co.sist.mgr.room.vo.MgrRoomVO;

public class MgrRoomDAO {
	
	private static MgrRoomDAO mgrRoomDAO;
	
	public MgrRoomDAO() {
	}
	
	public static MgrRoomDAO getInstance() {
		if(mgrRoomDAO == null) {
			mgrRoomDAO = new MgrRoomDAO();
		}//end if
		return mgrRoomDAO;
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
	
	/**
	 * 룸 정보 넣기
	 * @param mrVO
	 * @throws SQLException
	 */
	public void insertRoomInfo(MgrRoomVO mrVO) throws SQLException {		
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=getConn();
			
			StringBuilder insertRoomInfo= new StringBuilder();
			
			insertRoomInfo
			.append("	insert into room_info( room_name, room_num ) 	")
			.append("	values(?,?)	");
			
			pstmt=con.prepareStatement(insertRoomInfo.toString());
			pstmt.setString(1, mrVO.getRoomName());
			pstmt.setInt(2, mrVO.getRoomNum());
			
			rs=pstmt.executeQuery();
			
			pstmt.close();
			
			StringBuilder insertRoomType = new StringBuilder();
			
			insertRoomType
			.append("	insert into room_type( room_num, room_name, room_size, price, max_guest, amenity, room_intro, img1, img2, img3, img4, img5) 	")
			.append("	values(?,?,?,?,?,?,?,?,?,?,?,?)	");
			
			pstmt=con.prepareStatement(insertRoomType.toString());
			
			pstmt.setInt(1, mrVO.getRoomNum());
			pstmt.setString(2, mrVO.getRoomName());
			pstmt.setString(3, mrVO.getRoomSize());
			pstmt.setInt(4, mrVO.getPrice());
			pstmt.setInt(5, mrVO.getMaxGuest());
			pstmt.setString(6, mrVO.getAmenity());
			pstmt.setString(7, mrVO.getIntro());
			pstmt.setString(8, mrVO.getImg1());
			pstmt.setString(9, mrVO.getImg2());
			pstmt.setString(10, mrVO.getImg3());
			pstmt.setString(11, mrVO.getImg4());
			pstmt.setString(12, mrVO.getImg5());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			con.setAutoCommit(false);
			
			StringBuilder insertRoomCnt = new StringBuilder(); 
			insertRoomCnt
			.append("	insert into room_info(room_name, room_num)	")
			.append("	values(?, seq_room_num.nextval)	");
			
			pstmt=con.prepareStatement(insertRoomCnt.toString());
			
			pstmt.setString(1, mrVO.getRoomName());
			for(int i=0; i<mrVO.getRoomCnt()-1; i++) {
				pstmt.executeUpdate();
			}//end for
			            
			con.commit();
			con.setAutoCommit(true);
			
		}finally {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		}//end catch
	}//insertRoomInfo
	
	/**
	 * (룸 관리 처음화면)모든 룸을 리스트로 출력 
	 * @return
	 * @throws SQLException
	 */
	public List<String> selectAllRoom() throws SQLException{
		
		List<String> allRoomList = new ArrayList<String>();
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=getConn();
			pstmt=con.prepareStatement("select room_name from room_type");
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				allRoomList.add(rs.getString("room_name"));
			}//end while
			
			
		}finally {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		}//end catch
		
		
		return allRoomList;
	}//selectAllMember
	
	/**
	 * 룸 선택
	 * @param roomName
	 * @return
	 * @throws SQLException
	 */
	public MgrRoomListVO[] selectRoomList(String roomName) throws SQLException{
		MgrRoomListVO[] mrlList = null;
		
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=getConn();
			
			// 방 갯수가 총 몇개인지 알기 위해 select query로 조회
			StringBuilder selectRoomList= new StringBuilder();
			selectRoomList.append(" select count(*) roomCnt from room_info where room_name=? ");
			pstmt=con.prepareStatement(selectRoomList.toString());
			pstmt.setString(1, roomName);
			
			rs = pstmt.executeQuery();
			
			int roomCnt = 0;
			if(rs.next()) {
				roomCnt = rs.getInt("roomCnt");
			}
			mrlList = new MgrRoomListVO[roomCnt];

			// 쿼리 다시 날리기 위해 초기화
			rs.close();
			pstmt.close();
			
			selectRoomList.setLength(0);
			selectRoomList
			.append("	select room_name, available,  room_num 	")	 
			.append("	from room_info	")		 
			.append("	where room_name=?	");
			
			pstmt=con.prepareStatement(selectRoomList.toString());
			pstmt.setString(1, roomName);
			
			rs=pstmt.executeQuery();
			int index=0;
			while(rs.next()) {
				mrlList[index] = new MgrRoomListVO(rs.getString("room_name"), rs.getString("available"), rs.getInt("room_num"));
				index++;
			}//end while
			
		}finally {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		}//end catch
		
		return mrlList;
	}//selectAllMember
	
	
	/**
	 * 룸수정 눌렀을 때 룸 정보 변경
	 * @param mrmVO
	 * @return
	 * @throws SQLException
	 */
	public boolean updateRoomInfo(MgrRoomModifyVO mrmVO) throws SQLException {
		boolean flag = false;
		
		Connection con=null;
		PreparedStatement pstmt = null;
		
		try {
			con=getConn();
			
			StringBuilder updateInfo= new StringBuilder();
			updateInfo
			.append("	update room_type	")
			.append("	set room_size=?, price=?, max_guest=?, amenity=?, room_intro=?, img1=?,img2=?, img3=?, img4=?, img5=?	")
			.append("	where room_name=?	");
			
			pstmt=con.prepareStatement(updateInfo.toString());
			
			pstmt.setString(1, mrmVO.getRoomSize());
			pstmt.setInt(2, mrmVO.getPrice());
			pstmt.setInt(3, mrmVO.getMaxGuest());
			pstmt.setString(4, mrmVO.getAmenity());
			pstmt.setString(5, mrmVO.getIntro());
			pstmt.setString(6, mrmVO.getImg1());
			pstmt.setString(7, mrmVO.getImg2());
			pstmt.setString(8, mrmVO.getImg3());
			pstmt.setString(9, mrmVO.getImg4());
			pstmt.setString(10, mrmVO.getImg5());
			pstmt.setString(11, mrmVO.getRoomName());
			
			flag=pstmt.executeUpdate() == 1;
			
		}finally {
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		}//end catch
		
		return flag;
	}//updateRoomInfo
	
	/**
	 * 방 비활성화 여부를 업데이트
	 * @param flag
	 * @return
	 * @throws SQLException
	 */
	//메소드에서 List로 받아서 뿌리기
	public int updateRoomDisable(List<MgrRoomInfoVO> mrInfoVO) throws SQLException{
		int cnt = 0;
		
		Connection con=null;
		PreparedStatement pstmt = null;
		
		try {
			con=getConn();
			
			// 여러 쿼리를 update 하기 위해 auto commit 잠시 false로 변경
			con.setAutoCommit(false);
			
			String chkDisable="	update room_info set available=? where room_num=?	";
			
			for(int i=0; i<mrInfoVO.size(); i++) {
				pstmt=con.prepareStatement(chkDisable);
				
				MgrRoomInfoVO mrInfo = mrInfoVO.get(i);
				if(mrInfo.isInfoFlag()) {
					pstmt.setString(1, "T");
				}else {
					pstmt.setString(1, "F");
				}//end else
				
				pstmt.setInt(2, mrInfo.getInfoRoomNum());
				
				cnt+=pstmt.executeUpdate();
				pstmt.close();
			}//end for
			
			con.commit();
			con.setAutoCommit(true);
		}finally {
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		}//end catch
			
		return cnt;
	}//updateRoomDisable
	
	/**
	 * 
	 * 방 상세페이지 조회
	 * @param roomName
	 * @return
	 * @throws SQLException
	 */
	public MgrRoomVO selectRoomInfo(String roomName) throws SQLException {
		MgrRoomVO mrVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConn();
			StringBuilder sb = new StringBuilder();
			sb.append("select amenity, room_size, max_guest, price, room_intro, input_date, room_num,")
			  .append(" img1, img2, img3, img4, img5 ")
			  .append(" from room_type where room_name=?");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, roomName);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mrVO = new MgrRoomVO();
				mrVO.setRoomName(roomName);
				mrVO.setAmenity(rs.getString("amenity"));
				mrVO.setRoomInputDate(rs.getString("input_date"));
				mrVO.setIntro(rs.getString("room_intro"));
				mrVO.setRoomSize(rs.getString("room_size"));
				mrVO.setImg1(rs.getString("img1"));
				mrVO.setImg2(rs.getString("img2"));
				mrVO.setImg3(rs.getString("img3"));
				mrVO.setImg4(rs.getString("img4"));
				mrVO.setImg5(rs.getString("img5"));
				mrVO.setMaxGuest(rs.getInt("max_guest"));
				mrVO.setPrice(rs.getInt("price"));
				mrVO.setRoomNum(rs.getInt("room_num"));
				//count 필요
				
				rs.close();
				pstmt.close();
				
				sb.setLength(0);
				sb.append("select count(*) room_cnt from room_info where room_name=?");
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, roomName);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					int roomCnt = rs.getInt("room_cnt");
					mrVO.setRoomCnt(roomCnt);
				}
			}
			
		} finally{
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		
		return mrVO;
	}
	
}//class
