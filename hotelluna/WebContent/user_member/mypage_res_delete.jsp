<%@page import="kr.co.sist.user.reservation.dao.ResDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="../common/css/mypage.css">
<style type="text/css">
#desc_img {padding-bottom: 10px;}
#desc_txt {font-family: 'Noto Serif KR', serif; line-height: 35px;}

.wrapper1 {	display: flex;justify-content: center; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
function resList(){
	location.replace("mypage_res_list.jsp?current_page=${ param.current_page }");
}//resList

</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container">
	
	<div id="sub_menu">
		<jsp:include page="mypage_submenu.jsp"></jsp:include>
	</div>
	
	<div id="content">
	
	<div id="boardDiv">
	<%
	try{
	int resNum=Integer.parseInt(request.getParameter("res_num"));
	ResDAO rDAO=ResDAO.getInstance();
	int result=rDAO.deleteRes(String.valueOf(resNum));
	%>
	<%if(result==1){%>
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	예약 취소 완료
	</div>
	<div  class="wrapper1">
	<%= userId %>님 예약번호 <%= resNum %>번의 예약이 취소되었습니다.<br/>
	</div>
	<%}else{%>
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	죄송합니다
	</div>
	<div  class="wrapper1" style="text-align: center;">
	문제가 발생하여 예약이 취소되지 않았습니다.<br/>
	잠시 후 다시 시도해주세요.<br/>
	</div>
	<%}//end else%>
	<%}catch(NumberFormatException nfe){%>
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	예약 취소
	</div>
	<div  class="wrapper1" style="text-align: center;">
	잘못된 접근입니다.<br/>
	</div>
	<%}//end catch%>
	</div>
	
	<div  class="wrapper1" style="margin-top: 30px">
	<input type="button" id="btn" value="예약현황" class="btn btn-dark" onclick="resList()"/>
	</div>
	</div>
	</div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>