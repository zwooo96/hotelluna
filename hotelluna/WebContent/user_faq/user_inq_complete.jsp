<%@page import="kr.co.sist.user.faq.vo.ReqAddVO"%>
<%@page import="kr.co.sist.user.faq.dao.ReqDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userId = (String)session.getAttribute("user_id");
if(userId == null) {
	response.sendRedirect("../user_member/login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL - INQUIRIES</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/intro.css">
<!-- eng -->
<link href="https://fonts.googleapis.com/css2?family=Baloo+Tamma+2&family=Nova+Mono&family=Ropa+Sans&display=swap" rel="stylesheet">
<!-- ko -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<style type="text/css">
#container {margin:0px auto; width:600px}
#map {margin: 0px auto;}
#mgr_email {text-align:right}
#frm_div {margin-top:10px;}
#faq_content {height:150px;}
#agmText {height:300px; overflow:hidden}
#buttons {height:150px}
.mgr-mail {font-family: 'Baloo Tamma 2', cursive;}
.prefix_mail {font-family: 'Noto Serif KR', serif;}
.form-control {resize: none;}
.agreement {font-family: 'Noto Serif KR', serif; text-align:left;}
.agreement_title{font-weight: bold; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function() {
	$("#to_main").click(function() {
		location.replace("../main/index.jsp");
	});
});
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container">
		<div id="content">
			<div id="sub_menu_title">
				<img src="../common/images/faq/faq.png" />
			</div>
			<div>
				<p>문의사항이 등록되었습니다.</p>
				<p><a href="../user_member/mypage_question.jsp">문의리스트 확인하기</a></p>
			</div>
			<div id="buttons">
				<button type="button" class="btn btn-dark" id="to_main">메인으로</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>