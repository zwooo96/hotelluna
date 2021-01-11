<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.user.member.vo.PassModifyVO"%>
<%@page import="kr.co.sist.user.member.vo.PassVO"%>
<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL에 오신 것을 환영합니다</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" href="../common/css/common.css" >
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	
   $("#btnSearch").click(function(){
	   if($("#newPass").val().replace(/[0-9A-Za-z]/g, "") != ""){
	          alert("비밀번호는 숫자 또는 영문 대,소문자만 가능합니다.");
	          $("#newPass").val("");
	          return;
	       }//end if
	   chkNull();
   });//click
   
   $("#newPass").keydown(function(evt){
	   if( evt.which == 13 ){
		   chkNull();
	   }//end if
   });//keydown
   $("#newPass").keyup(function(evt){
	   if( evt.which != 13 ){
		   chkConfirmPass();
	   }//end if
   });//keyup
   
   $("#confirmPass").keydown(function(evt){
	   if( evt.which == 13 ){
		   chkNull();
	   }//end if
   });//keydown
   $("#confirmPass").keyup(function(evt){
	   if( evt.which != 13 ){
		   chkConfirmPass();
	   }//end if
   });//keyup
   
});//ready

function chkNull(){
	if( $("#newPass").val() == "" ){
		alert("새로운 비밀번호를 입력해주세요.");
		return;
	}//end if
	if( $("#confirmPass").val() == "" ){
		alert("비밀번호 확인란을 입력해주세요.");
		return;
	}//end if
	$("#searchFrm").submit();
}//chkNull

function chkConfirmPass(){
	if( $("#newPass").val() == $("#confirmPass").val() && $("#confirmPass").val() != '' ){ //새 비밀번호와 비밀번호 확인란이 일치하고 비밀번호 확인란이 비어있지 않으면
		$("#confirmPass").prop('class','form-control is-valid'); //폼 색깔을 초록색으로 설정
		$("#cpIFeedback").css('display','none'); //경고문구 숨기기
		$("#cpVFeedback").css('display','inline-block'); //일치문구 보여주기
	}else{
		$("#confirmPass").prop('class','form-control is-invalid'); //폼 색깔을 빨간색으로 설정
		$("#cpIFeedback").css('display','inline-block'); //경고문구 보여주기
		$("#cpVFeedback").css('display','none'); //일치문구 숨기기
	}//end else
}//chkConfirmPass

</script>
</head>
<body>
<div id="wrap">

	<div id="header">
		<jsp:include page="../common/jsp/header.jsp"/>
	</div>
	
   <div id="container">
	<%
		String id = request.getParameter("id"); //사용자 아이디
		String currentPass = (String)request.getAttribute("current_pass"); //이전 페이지에서 RequestDispatcher로 가져온 현재 비밀번호
	%>
	
	<div id="content" style="width:700px; height: 500px; margin:0px auto; margin-top: 150px">
	
	<div style="width: 240px; margin-top: 40px; margin:0px auto; margin-top: 170px">
		<h1 style="font-family: 'LotteMartHappy'">비밀번호 변경</h1>
	</div>

	<form id="searchFrm" name="searchFrm" action="find_pass_update_process.jsp" method="post">
	<input type="hidden" id="id" name="id" value="<%= id %>"/>
	<input type="hidden" id="currentPassVal" name="currentPassVal" value="<%= currentPass %>"/>
	<div style="width: 600px; margin: 0px auto; margin-top: 60px; margin-left: 200px">
	  <div class="form-row">
	    <div class="col-md-6 mb-3">
	      <input type="password" class="form-control" id="newPass" name="newPass" placeholder="새 비밀번호" required>
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-md-6 mb-3">
	      <input type="password" class="form-control" id="confirmPass" name="confirmPass" placeholder="비밀번호 확인" aria-describedby="validationServer03Feedback" required>
	      <div id="cpIFeedback" class="invalid-feedback" style="display:none">비밀번호가 일치하지 않습니다.</div>
	      <div id="cpVFeedback" class="valid-feedback" style="display:none">비밀번호가 일치합니다.</div>
	    </div>
	  </div>
	</div>
	</form>
	
	<div>
		<button type="button" id="btnSearch" class="btn btn-dark btn-lg btn-block" style="width: 350px; margin:0px auto; margin-top: 30px">확인</button>
	</div>
	
	</div>
		
   </div>
   <div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>