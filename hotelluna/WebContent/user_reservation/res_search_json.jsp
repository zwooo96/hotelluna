<%@page import="kr.co.sist.user.reservation.vo.RoomSearchVO"%>
<%@page import="kr.co.sist.user.reservation.vo.RoomDetailVO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.user.reservation.vo.RoomSimpleVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.reservation.dao.ResDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String checkIn=request.getParameter("checkin");
String checkOut=request.getParameter("checkout");
//int roomCnt=Integer.parseInt(request.getParameter("room"));
int maxGuest=Integer.parseInt(request.getParameter("people"));
ResDAO rDAO=ResDAO.getInstance();
RoomSearchVO rSearchVO=new RoomSearchVO(checkIn, checkOut, maxGuest);
List<RoomSimpleVO> list=rDAO.selectEmptyRoom(rSearchVO);


JSONArray jArr=new JSONArray();
JSONObject jObj=null;
RoomSimpleVO rsVO=null;
for(int i=0;i<list.size();i++){
	jObj=new JSONObject();
	rsVO=list.get(i);
	jObj.put("roomNum",rsVO.getRoomNum());
	jObj.put("roomName",rsVO.getRoomName());
	jObj.put("img",rsVO.getImg());
	jObj.put("roomSize",rsVO.getRoomSize());
	jObj.put("price",rsVO.getPrice());
	
	RoomDetailVO rdVO=rDAO.selectRoomDetail(rsVO.getRoomName());

	JSONObject jDetailObj=null;
	if(rdVO!=null){
		jDetailObj=new JSONObject();
		//roomName, amenity, roomSize, img1, img2, img3, img4, img5; int price
		jDetailObj.put("roomName",rdVO.getRoomName());
		jDetailObj.put("amenity",rdVO.getAmenity());
		jDetailObj.put("roomSize",rdVO.getRoomSize());
		jDetailObj.put("img1",rdVO.getImg1());
		jDetailObj.put("img2",rdVO.getImg2());
		jDetailObj.put("img3",rdVO.getImg3());
		jDetailObj.put("img4",rdVO.getImg4());
		jDetailObj.put("img5",rdVO.getImg5());
		jDetailObj.put("price",rdVO.getPrice());
	}//end if
	jObj.put("data",jDetailObj);
	
	jArr.add(jObj);
}//end for

%>
<%= jArr.toJSONString() %>
