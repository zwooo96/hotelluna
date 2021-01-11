package kr.co.sist.user.reservation.dao;

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

import kr.co.sist.user.reservation.vo.MemberResListVO;
import kr.co.sist.user.reservation.vo.MemberResSearchVO;
import kr.co.sist.user.reservation.vo.NonMemResSearchVO;
import kr.co.sist.user.reservation.vo.ResAddVO;
import kr.co.sist.user.reservation.vo.ResDetailVO;
import kr.co.sist.user.reservation.vo.RoomDetailVO;
import kr.co.sist.user.reservation.vo.RoomSearchVO;
import kr.co.sist.user.reservation.vo.RoomSimpleVO;

/**
 * ����ڴܿ��� ��������� �̷���� �� DB�۾��� �����ϴ� Ŭ����
 * @author YL
 */
public class ResDAO {
	private static ResDAO resDAO;
	
	private ResDAO() {
	}//ResDAO
	
	public static ResDAO getInstance() {
		if(resDAO==null) {
			resDAO=new ResDAO();
		}//end if
		return resDAO;
	}//getInstance
	
	private Connection getConn() throws SQLException{
		Connection con=null;
		
		try {
			//1.JNDI ��밴ü ���� (InitialContext : �̸����� ��ü�� ã�� Ŭ���� ���)
			Context ctx = new InitialContext();
			//2.�̸����� ��ü ��� (DataSource : DBCP �ȿ��� DB�� �����ϰ� �ִ� ��ü)
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/luna_dbcp");
			//3.�� ��ü(DataSource)���� Connection���
			con=ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}//end catch
		
		return con;
	}//getConn
	
	/**
	 * ���డ���� ���� ��ȸ�Ͽ� ������ ���� ������ �����Ѵ�.
	 * @param rsVO
	 * @return
	 * @throws SQLException
	 */
	public List<RoomSimpleVO> selectEmptyRoom(RoomSearchVO rsVO) throws SQLException{
		List<RoomSimpleVO> list=new ArrayList<RoomSimpleVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConn();
			
			
			StringBuilder selectResRoomNum=new StringBuilder();
			selectResRoomNum
			.append("	select room_name, min(room_num) room_num	")
			.append("	from room_info	")
			.append("	where room_num not in(select room_num	")
			.append("	from reservation	")
			.append("	where (to_Date(?,'yyyy-mm-dd')	")
			.append("	between to_Date(checkin,'yyyy-mm-dd') and to_date(checkout,'yyyy-mm-dd'))	")
			//üũ�ΰ� üũ�ƿ� ������ ��¥�� ���ؾ���!
			.append("	or (to_Date(?,'yyyy-mm-dd')	")
			.append("	between to_Date(checkin,'yyyy-mm-dd' ) and to_date(checkout,'yyyy-mm-dd')))	")
			.append("	group by room_name	")
			;
			pstmt=con.prepareStatement(selectResRoomNum.toString());
			pstmt.setString(1, rsVO.getCheckIn());
			pstmt.setString(2, rsVO.getCheckOut());
			
			rs=pstmt.executeQuery();
			
			List<String[]> resRoomNumList=new ArrayList<String[]>();//����� ���� �̸��� ������ ����Ʈ
			while(rs.next()) {
				resRoomNumList.add( new String[]{rs.getString("room_name"), rs.getString("room_num")} );
			}//end while
			
			rs.close();
			pstmt.close();
			
			
			StringBuilder selectNotResRoom=new StringBuilder();
			selectNotResRoom
			.append("	select room_name, img1, room_size, price	")
			.append("	from room_type	")
			.append("	where  room_name in(	")
			.append("	select room_name	")
			.append("	from room_info	")
			.append("	where room_num not in(select room_num	")
			.append("	from reservation	")
			.append("	where (to_Date(?,'yyyy-mm-dd')	")
			.append("	between to_Date(checkin,'yyyy-mm-dd') and to_date(checkout,'yyyy-mm-dd'))	")
			.append("	or (to_Date(?,'yyyy-mm-dd')	")
			.append("	between to_Date(checkin,'yyyy-mm-dd' ) and to_date(checkout,'yyyy-mm-dd')))	")
			.append("	)	")
			;
			
			pstmt=con.prepareStatement(selectNotResRoom.toString());
			
			pstmt.setString(1, rsVO.getCheckIn());
			pstmt.setString(2, rsVO.getCheckOut());
			
			rs=pstmt.executeQuery();
			
			
			RoomSimpleVO rSimpleVO=null;
			String roomName=null;
			while(rs.next()) {
				roomName=rs.getString("room_name");
				for(int i=0; i<resRoomNumList.size(); i++) {
					if(resRoomNumList.get(i)[0].equals(roomName)) {
						rSimpleVO=new RoomSimpleVO(resRoomNumList.get(i)[1], roomName, rs.getString("img1"), rs.getNString("room_size"), rs.getInt("price"));
					}//end if
				}//end for
				list.add(rSimpleVO);
			}//end while
			
		}finally {
			if(rs!=null) { rs.close(); }//end if
			if(pstmt!=null) { pstmt.close(); }//end if
			if(con!=null) { con.close(); }//end if
		}//end finally
		
		return list;
	}//selectEmptyRoom
	
	
	public RoomDetailVO selectRoomDetail(String roomName) throws SQLException {
		RoomDetailVO rdVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConn();
			//select room_name, amenity, img1, img2, img3, img4, img5, room_size, price
			//from room_type
			//where room_name='testroom'
			StringBuilder selectRoomDetail=new StringBuilder();
			selectRoomDetail
			.append("	select room_name, amenity, img1, img2, img3, img4, img5, room_size, price	")
			.append("	from room_type	")
			.append("	where room_name=?	")
			;
			pstmt=con.prepareStatement(selectRoomDetail.toString());
			pstmt.setString(1, roomName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rdVO=new RoomDetailVO(rs.getString("room_name"), rs.getString("amenity"), rs.getString("room_size"),
						rs.getString("img1"), rs.getString("img2"), rs.getString("img3"), rs.getString("img4"), rs.getString("img5"), rs.getInt("price"));
			}//end if
		}finally {
			if(rs!=null) { rs.close(); }//end if
			if(pstmt!=null) { pstmt.close(); }//end if
			if(con!=null) { con.close(); }//end if
		}//end finally
		
		return rdVO;
	}//selectRoomDetail
	
	
	public String insertResInfo(ResAddVO raVO) throws SQLException{
		String resNum="";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConn();
			//insert into reservation(RES_NUM, ID, ROOM_NUM, CHECKIN, CHECKOUT, requirements, ROOM_NAME, RES_PERSON, TOTAL_PRICE)
			//values(seq_res_num.nextval, 'guest1', 't_101','2020-08-07','2020-08-08','����','testroom',1,330000);
			StringBuilder insertResInfo=new StringBuilder();
			insertResInfo
			.append("	insert into reservation")
			.append("(res_num, id, room_num, checkin, checkout, requirements, room_name, res_person, total_price)")
			.append("	values")
			.append("(seq_res_num.nextval, ?, ?, ?, ?, ?, ?, ?, ?)")
			;
			pstmt=con.prepareStatement(insertResInfo.toString());
			//���ε� ������ �� �ֱ�
			pstmt.setString(1, raVO.getId());
			pstmt.setString(2, raVO.getRoomNum());
			pstmt.setString(3, raVO.getCheckIn());
			pstmt.setString(4, raVO.getCheckOut());
			pstmt.setString(5, raVO.getRequirements());
			pstmt.setString(6, raVO.getRoomName());
			pstmt.setInt(7, raVO.getResPerson());
			pstmt.setInt(8, raVO.getTotalPrice());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			String getResNum="select seq_res_num.currval from dual";
			pstmt=con.prepareStatement(getResNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				resNum=rs.getString("currval");
			}//end if
			
		}finally {
			if(rs!=null) { rs.close(); }//end if
			if(pstmt!=null) { pstmt.close(); }//end if
			if(con!=null) { con.close(); }//end if
		}//end finally
		
		return resNum;
	}//insertResAddInfo
	
	public List<MemberResListVO> selectResList(String id) throws SQLException{
		List<MemberResListVO> list=new ArrayList<MemberResListVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConn();
			StringBuilder selectResList=new StringBuilder();
			//select res.res_num, ri.room_name, res.checkin, res.checkout, res.requirements
			//from room_info ri, reservation res
			selectResList
			.append("	select res.res_num, ri.room_name, res.checkin, res.checkout, res.requirements	")
			.append("	from room_info ri, reservation res	")
			.append("	where res.room_num=ri.room_num and res.id=?	")
			.append("	order by res.res_num desc	")
			;
			pstmt=con.prepareStatement(selectResList.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			MemberResListVO mrsVO=null;
			while(rs.next()) {
				mrsVO=new MemberResListVO(rs.getString("res_num"), rs.getString("room_name"), rs.getNString("checkin"), rs.getString("checkout"), rs.getString("requirements"));
				list.add(mrsVO);
			}//end while
			
		}finally {
			if(rs!=null) { rs.close(); }//end if
			if(pstmt!=null) { pstmt.close(); }//end if
			if(con!=null) { con.close(); }//end if
		}//end finally
		
		return list;
	}//selectResList
	
	public int deleteRes(String resNum) throws SQLException{
		int result=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=getConn();
			String deleteRes="delete from reservation where res_num=?";
			pstmt=con.prepareStatement(deleteRes);
			
			pstmt.setString(1, resNum);
			result=pstmt.executeUpdate();
			
		}finally {
			
		}//end finally
		
		return result;
	}//deleteRes
	
	public ResDetailVO selectResInfo(MemberResSearchVO mrsVO) throws SQLException {
		ResDetailVO rdVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConn();
			StringBuilder selectResInfo=new StringBuilder();
			selectResInfo
			.append("	select res_num, checkin, checkout, res_person, room_name, requirements, total_price ")
			.append("	from reservation	")
			.append("	where id=? and res_num=?	")
			;
			pstmt=con.prepareStatement(selectResInfo.toString());
			pstmt.setString(1, mrsVO.getId());
			pstmt.setString(2, mrsVO.getResNum());
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rdVO=new ResDetailVO(rs.getString("res_num"), rs.getString("checkin"), rs.getString("checkout"), rs.getString("res_person"), rs.getString("room_name"), rs.getString("requirements"), rs.getInt("total_price"));
			}//end if
			
		}finally {
			if(rs!=null) { rs.close(); }//end if
			if(pstmt!=null) { pstmt.close(); }//end if
			if(con!=null) { con.close(); }//end if
		}//end finally
		
		return rdVO;
	}//selectResInfo
	
	public ResDetailVO selectResInfo(NonMemResSearchVO nmrsVO) throws SQLException {
		ResDetailVO rdVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConn();
			StringBuilder selectResInfo=new StringBuilder();
			selectResInfo
			.append("	select res.res_num, res.checkin, res.checkout, res.res_person, res.room_name, res.requirements, res.total_price ")
			.append("	from reservation res, hotel_member hm	")
			.append("	where res.id=hm.id and res_num=? and name_eng_f=? and name_eng_l=?	")
			;
			pstmt=con.prepareStatement(selectResInfo.toString());
			pstmt.setString(1, nmrsVO.getResNum());
			pstmt.setString(2, nmrsVO.getNameEngF());
			pstmt.setString(3, nmrsVO.getNameEngL());
			
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rdVO=new ResDetailVO(rs.getString("res_num"), rs.getString("checkin"), rs.getString("checkout"), rs.getString("res_person"), rs.getString("room_name"), rs.getString("requirements"), rs.getInt("total_price"));
			}//end if
			
			
		}finally {
			if(rs!=null) { rs.close(); }//end if
			if(pstmt!=null) { pstmt.close(); }//end if
			if(con!=null) { con.close(); }//end if
		}//end finally
		
		return rdVO;
	}//selectResInfo	
}//class
