<%@page import="kr.co.sist.mgr.room.vo.MgrRoomVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.mgr.room.dao.MgrRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionId = (String)session.getAttribute("user_id");
if( !"admin".equals(sessionId) || sessionId == null ){
	response.sendRedirect("../main/index.jsp");
	return;
}//end if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>룸관리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" href="../common/css/common.css" >
<style type="text/css">
.sidemenu { vertical-align: middle; height:80px; font-size: 25px; font-family: 'LotteMartHappy';}
#menu td:hover{ color:#BF8D50 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#addRoom").click(function(){
		location.href="add_room.jsp";
		return;
	});
});

function getRoomName(){
	location.href="room_info.jsp?roomName="+$("#room").text();
	return;
}//function

</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container" style="width:1800px; height:750px; margin:0px auto; margin-top: 10px; ">
		<jsp:include page="../common/jsp/mgr_menu.jsp"></jsp:include>
		<div id="content" style="width:1200px; height:750px; float:left; margin-left: 100px">
			<div id="container" >
			
			<%
			request.setCharacterEncoding("utf-8");
			
		
			MgrRoomDAO mrDAO = MgrRoomDAO.getInstance();
			
			List<String> roomList = mrDAO.selectAllRoom();
			
			%>
			
			<div style="padding:40px; font-size: 30px" class="sidemenu">룸리스트</div>
			<div style="margin-left: 800px; margin-bottom: 50px"><input type="button" class="btn btn-dark" style="width: 80px" id="addRoom" value="룸추가" /></div>
			<form action="room_list.jsp" id="roomFrm" >
			<table class="table" style="text-align:center; border: 2px solid #333; margin:0px auto; min-height: 200px; width: 450px">
			  <thead class="thead-dark">
			<tr>
				<th style="height: 80px; font-size: 25px">방이름</th>
			</tr>
			<%for(int i=0; i<roomList.size(); i++){ %>
			<tr style="border: 1px solid #333; font-size: 17px; ">
				<td onclick="location.href='room_info.jsp?roomName=<%=roomList.get(i) %>'" style="cursor:pointer;" id="room">
				<%=
				roomList.get(i)
				%>
				</td>
			</tr>
			<%} %>
			</thead>
			</table>
			</form>
			</div>
	
		</div>	
	</div>
</div>
</body>
</html>