<%@page import="kr.co.sist.user.reservation.vo.ResDetailVO"%>
<%@page import="kr.co.sist.user.reservation.vo.NonMemResSearchVO"%>
<%@page import="kr.co.sist.user.reservation.dao.ResDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String userId=(String)session.getAttribute("user_id");
if(userId!=null || ! "".equals(userId)){
	response.sendRedirect("../user_member/mypage_res_list.jsp");
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
.res_search_result { display: flex; align-items: center; }
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
<%
request.setCharacterEncoding("UTF-8");
String resNum=request.getParameter("res_num");
String firstName=request.getParameter("first_name").toUpperCase();
String lastName=request.getParameter("last_name").toUpperCase();
ResDetailVO rdVO=null;
if(resNum!=null){
	NonMemResSearchVO nmrsVO=new NonMemResSearchVO(resNum,firstName,lastName);
	ResDAO rDAO=ResDAO.getInstance();
	rdVO=rDAO.selectResInfo(nmrsVO);
}//end if
System.out.print(rdVO);
%>
<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"/>
	</div>
	<div id="container">
	
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	예약 조회
	</div>
	<%if(rdVO==null){ %>
	<div class="wrapper1">
	예약 내역이 없습니다.<br/>
	이메일과 이름을 확인해주세요.
	</div>
	<%}else{ %>
	<div class="wrapper1">
	<div>
	<table>
	<tr>
	<th>예약번호</th>
	<td><%= rdVO.getResNum() %></td>
	</tr>
	<tr>
	<th>룸 이름</th>
	<td><%= rdVO.getRoomName() %></td>
	</tr>
	<tr>
	<th>체크인</th>
	<td><%= rdVO.getCheckIn() %></td>
	</tr>
	<tr>
	<th>체크아웃</th>
	<td><%= rdVO.getCheckOut() %></td>
	</tr>
	<tr>
	<th>예약 인원</th>
	<td><%= rdVO.getResPerson() %></td>
	</tr>
	<tr>
	<th>총 가격</th>
	<td><%= rdVO.getTotalPrice() %></td>
	</tr>
	<tr>
	<th>특별 요청</th>
	<td><%= rdVO.getRequirements() %></td>
	</tr>
	</table>
	<div  class="wrapper1" style="margin-top: 30px">
	<input type="button" id="btn" value="확인" class="btn btn-dark"/>
	</div>
	</div>
	</div>
	<%}//end else %>
	</div>
	
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>