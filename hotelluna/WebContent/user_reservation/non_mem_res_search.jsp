<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String userId=(String)session.getAttribute("user_id");
if((userId!=null || !"".equals(userId))){
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
#nonMemResDiv { width: 400px; margin: 0px auto; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$( function(){
	
	$("#searchBtn").click(function(){
		
		if($("#res_num").val().trim()==""){
			alert("예약번호를 입력해주세요.");
			$("#email").focus();
			return;
		}//end if
		if($("#first_name").val().trim()==""){
			alert("이름을 입력해주세요.");
			$("#first_name").focus();
			return;
		}//end if
		if($("#last_name").val().trim()==""){
			alert("이름을 입력해주세요.");
			$("#last_name").focus();
			return;
		}//end if
		
		$("#nonMemResFrm").submit();
		
	});//click
	
});//ready
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"/>
	</div>
	<div id="container">
	
	<div class="text-center" style="height: 200px; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
		비회원 예약조회
	</div>
	<div id="nonMemResDiv">
	<form name="nonMemResFrm" id="nonMemResFrm" action="non_mem_res_detail.jsp" method="post">
	<table class="searchTb">
	<tr>
		<td colspan="2">
		<input type="text" class="form-control" id="res_num" name="res_num" style="width: 300px;" placeholder="예약번호를 입력하세요 " autofocus="autofocus" tabindex="1"> <br/>
		</td>
		<td rowspan="2">
		<input type="button" class="btn btn-dark" value="확인" name="searchBtn" id="searchBtn" style="width: 100px; height: 100px; margin-left: 25px; margin-bottom: 25px" tabindex="3"><br> 
		<td>
	</tr>
	<tr>
		<td style="text-align: left;">
		<input type="text" class="form-control" id="first_name" name="first_name" style="width: 145px; " placeholder="이름(First Name)" tabindex="2" ><br/>
		</td>
		<td style="text-align: right;">
		<input type="text" class="form-control" id="last_name" name="last_name" style="width: 145px; " placeholder="성(last Name)" tabindex="2" ><br/>
		</td>
	</tr>
	</table>
	</form>
	</div>
	</div>
	
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>