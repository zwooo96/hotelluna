<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="kr.co.sist.mgr.room.vo.MgrRoomInfoVO"%>
<%@page import="kr.co.sist.mgr.room.vo.MgrRoomListVO"%>
<%@page import="kr.co.sist.mgr.room.vo.MgrRoomModifyVO"%>
<%@page import="kr.co.sist.mgr.room.vo.MgrRoomVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.mgr.room.dao.MgrRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>룸정보</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" href="../common/css/common.css" >
<style type="text/css">
.sidemenu { vertical-align: middle; height:80px; font-size: 25px; font-family: 'LotteMartHappy';}
#menu td:hover{ color:#BF8D50 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	MgrRoomDAO mrDAO = MgrRoomDAO.getInstance();
	String roomName = request.getParameter("roomName");
	/* 룸이름 */
	MgrRoomListVO[] mrList = mrDAO.selectRoomList(roomName);
	
	/* 룸 활성화 적용*/
	String availableArr = request.getParameter("availableArr");
	List<MgrRoomInfoVO> mrInfoVOList = new ArrayList<MgrRoomInfoVO>();
	if(availableArr != null && !"".equals(availableArr)) {
		String[] r = availableArr.split(",");
		String roomNumStr = null;
		MgrRoomInfoVO mriVO = null;
		for(int i = 0; i < r.length; i++) {
			roomNumStr = r[i];
			
			boolean roomAvailable = false;
			if(roomNumStr == null || "".equals(roomNumStr)) {
				continue;
			}
			
			int roomNum = Integer.parseInt(roomNumStr);
			roomAvailable = Boolean.parseBoolean(r[++i]);
			mriVO = new MgrRoomInfoVO(roomAvailable, Integer.parseInt(roomNumStr)); 
			mrInfoVOList.add(mriVO);
		}
		int result = 0;
		if(!mrInfoVOList.isEmpty()) {
			result = mrDAO.updateRoomDisable(mrInfoVOList);
		}
		if(result == 0) {
			%>
			<script type="text/javascript">alert("적용에 실패했습니다.");</script>
			<%
		} else {
			String path = "room_info.jsp?roomName="+roomName;
			%><script type="text/javascript">alert("비활성화여부가 적용되었습니다.");location.href="<%=path%>"</script><%
	}
	}
	%>
	
<script type="text/javascript">
$(function(){
	$("#selectRoomBtn").click(function() {
		location.href="room_detail.jsp?room_name=<%=roomName%>";
		return;
	});
});

function applyBtn(){
	var roomInfoArr = new Array();

	$.each($(".available"), function(idx, cbox) {
		roomInfoArr[idx] = new Array();
		roomInfoArr[idx][idx] = $(cbox).val(); //roomNum
		roomInfoArr[idx][idx+1] = $(cbox).is(":checked");
	});
	
	$("#availableArr").val(roomInfoArr);
	$("#infoFrm").submit();
}
</script>
</head>

<body>
<div id="wrap">
	<div id="header">
			<jsp:include page="../common/jsp/header.jsp"/>
	</div>
	<div id="container" style="width:1800px; height:750px; margin:0px auto; margin-top: 10px; ">
		<jsp:include page="../common/jsp/mgr_menu.jsp"></jsp:include>
		<%if(roomName!=null && !"".equals(roomName) ){ %>
		<div id="content" style="width:1200px; height:750px; float:left; margin-left: 100px">
			<div style="padding:40px; font-size: 30px" class="sidemenu" >
				<%=roomName %>
				<input type="button" id="selectRoomBtn" value="조회"/>
			</div>
		
	<div style="margin-top:100px;">
	<form action="room_info.jsp" name="infoFrm" id="infoFrm">
	<table  class="table" style="text-align:center; border: 2px solid #333; margin:0px auto; max-height: 400px; width: 450px">
	  <thead class="thead-dark">
	<tr>
		<th>룸번호</th><th>활성화</th>
	</tr>
	</thead>
	<% for(int i=0; i<mrList.length; i++) { 
			MgrRoomListVO mrlVO = mrList[i]; 
			if(mrlVO == null) {
				continue;
			}
			boolean isAvailable = false;
			
			// 활성화 여부가 'T'면 true 
			if(mrlVO.getAvailable().equalsIgnoreCase("T")) {
				isAvailable = true;
			}
			pageContext.setAttribute("available", isAvailable);
	%>
			<tr style="border: 1px solid #333; font-size: 17px; ">
				<td><%= mrlVO.getRoomNum()%></td>
				<td><input type="checkbox" name="available" class="available" id="available"${available?" checked='checked'":""} value="<%=mrlVO.getRoomNum()%>"/></td>
			</tr>
		<%} %>
		</table>
		<div style="margin-top: 50px; margin-left: 500px; margin-bottom: 50px">
			<input type="button" class="btn btn-dark" style="width: 80px" onclick="applyBtn()" id="apply" value="적용"/>
			<a href="javascript:history.back();"><input type="button" class="btn btn-dark" style="width: 80px; margin-right: 10px" value="뒤로" /></a>
		</div>
		<input type="hidden" id="availableArr" name="availableArr"/>
		<input type="hidden" id="roomName" name="roomName" value="<%=roomName%>"/>
	</form>
			</div>
		</div>
		<%}else{ %>	
		
		<div id="content" style="width:1200px; height:750px; float:left; margin-left: 100px">
		잘못된 접근 입니다.
		</div>
		<%}//end else %>
	</div>
</div>
</body>
</html>