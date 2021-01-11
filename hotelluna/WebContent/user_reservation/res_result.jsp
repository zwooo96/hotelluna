<%@page import="kr.co.sist.user.reservation.dao.ResDAO"%>
<%@page import="kr.co.sist.user.reservation.vo.ResAddVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String userId=(String)session.getAttribute("user_id");
if((userId==null || "".equals(userId))){
	response.sendRedirect("../user_member/login.jsp");
}//end if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<style type="text/css">
th{ height: 50px ;font-family: LotteMartHappy; font-size: 15pt; width: 200px }
td{ height: 50px ; min-width: 150px }
.wrapper1 {	display: flex;justify-content: center; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#btn").click(function() {
		location.href="../main/index.jsp";
	});//click
});//ready
</script>
</head>
<body>
<c:catch var="e">
<%
//user_id=guest1&checkin=2020-8-16&checkout=2020-8-17&room_name=testroom&total_price=399300&people=2&req=
ResAddVO raVO=new ResAddVO(userId, request.getParameter("checkin"),
		request.getParameter("checkout"), request.getParameter("req"), request.getParameter("room_name"),
		request.getParameter("room_num"), Integer.parseInt(request.getParameter("total_price")), Integer.parseInt(request.getParameter("people")));
ResDAO rDAO=ResDAO.getInstance();
String resNum=rDAO.insertResInfo(raVO);

request.setAttribute("resNum", resNum);
%>
</c:catch>
<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"/>
	</div>
	<div id="container">
	
	<c:choose>
	<c:when test="${ not empty e }">
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	<img src="../common/images/res/res_index3.png"/><br/>
	예약 실패
	</div>
	<div style="height: 200px; text-align: center; padding-top: 80px; font-size: 12pt">
	죄송합니다.<br/>
	예약도중 문제가 발생했습니다.<br/>
	잠시 후 다시 시도해주세요.<br/>
	</div>
	</c:when>
	<c:otherwise>
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	<img src="../common/images/res/res_index3.png"/><br/>
	예약 성공
	</div>
	<div class="wrapper1">
	<div>
	<table>
	<tr>
	<th>예약번호</th>
	<td>${ resNum }</td>
	</tr>
	<tr>
	<th>룸 이름</th>
	<td><%= request.getParameter("room_name") %></td>
	</tr>
	<tr>
	<th>체크인</th>
	<td><%= request.getParameter("checkin") %></td>
	</tr>
	<tr>
	<th>체크아웃</th>
	<td><%= request.getParameter("checkout") %></td>
	</tr>
	<tr>
	<th>예약 인원</th>
	<td><%= request.getParameter("people") %></td>
	</tr>
	<tr>
	<th>총 가격</th>
	<td><%= request.getParameter("total_price") %></td>
	</tr>
	<tr>
	<th>특별 요청</th>
	<td><%= request.getParameter("req") %></td>
	</tr>
	</table>
	<div  class="wrapper1" style="margin-top: 30px">
	<input type="button" id="btn" value="확인" class="btn btn-dark"/>
	</div>
	</div>
	</div>
	</c:otherwise>
	</c:choose>
	
	
	</div>
	
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>