<%@page import="kr.co.sist.user.member.vo.IdVO"%>
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
	   if($("#nameEngL").val().replace(/[A-Z]/g, "") != ""){
	          alert("영문이름은 영문 대문자만 가능합니다");
	          $("#nameEngL").val("");
	          return;
	       }//end if
	   if($("#nameEngF").val().replace(/[A-Z]/g, "") != ""){
	          alert("영문이름은 영문 대문자만 가능합니다");
	          $("#nameEngF").val("");
	          return;
	       }//end if
	   if($("#email1").val().replace(/[0-9A-Za-z]/g,"") != ""){
		  	alert("이메일은 숫자 또는 영문 대,소문자로만 이루어질 수 있습니다.");
		  	$("#email1").val("");
		    return;
		 }//end if
	   chkNull();
   });//click
   $("#nameEngL").keydown(function(evt){
	   if( evt.which == 13 ){
		   chkNull();
	   }//end if
   });//keydown
   $("#nameEngF").keydown(function(evt){
	   if( evt.which == 13 ){
		   chkNull();
	   }//end if
   });//keydown
   $("#email1").keydown(function(evt){
	   if( evt.which == 13 ){
		   chkNull();
	   }//end if
   });//keydown
   $("#email2").keydown(function(evt){
	   if( evt.which == 13 ){
		   chkNull();
	   }//end if
   });//keydown
   
   $("#btnBack").click(function(){
	   location.href="login.jsp";
   });//click
});//ready

function chkNull(){
	if( $("#nameEngL").val() == "" ){
		alert("성을 입력해주세요.");
		return;
	}//end if
	if( $("#nameEngF").val() == "" ){
		alert("이름을 입력해주세요.");
		return;
	}//end if
	if( $("#email1").val() == "" ){
		alert("이메일을 입력해주세요.");
		return;
	}//end if
	if( $("#email2").val() == "" ){
		alert("이메일을 입력해주세요.");
		return;
	}//end if
	$("#searchFrm").submit();
}//chkNull
</script>
</head>
<body>
<div id="wrap">

	<div id="header">
		<jsp:include page="../common/jsp/header.jsp"/>
	</div>
	
   <div id="container">
	
	<jsp:useBean id="iVO" class="kr.co.sist.user.member.vo.IdVO" scope="page"/>
	<jsp:setProperty property="*" name="iVO"/>
	<%
		String id = "";
		
		if( iVO.getNameEngL() != null ){
			String nameEngF = iVO.getNameEngF().toUpperCase();
			String nameEngL = iVO.getNameEngL().toUpperCase();
			String email1 = iVO.getEmail1();
			String email2 = iVO.getEmail2();
			
			MemberDAO mDAO = MemberDAO.getInstance();
			iVO = new IdVO(nameEngF, nameEngL, email1, email2);
			
			id = mDAO.selectMemberById(iVO);
			%>
			<c:set var="id" value="<%= id %>"/>
			<%
			
			if( "".equals(id) ){
				String msg = "입력하신 정보와 일치하는 아이디가 없습니다.";
			%>
			<script type="text/javascript">
				alert("<%= msg %>");
				location.href="find_id.jsp";
			</script>
			<%
			}//end if
		}//end if
	%>
	
	<div id="content" style="width:700px; height: 500px; margin:0px auto; margin-top: 150px">
	
	<div style="width: 220px; margin-top: 40px; margin:0px auto; margin-top: 170px">
		<h1 style="font-family: 'LotteMartHappy'">아이디 찾기</h1>
	</div>
	
	<c:choose>
	<c:when test="${ id ne '' and id ne null }">
	<div>
		<div style="width:600px; margin:0px auto; text-align: center; margin-top:100px">
		<h5>회원님의 아이디는 <strong><%= id %></strong> 입니다.</h5>
		</div>
		<div>
			<button id="btnBack" type="button" class="btn btn-dark btn-lg btn-block" style="width: 415px; margin:0px auto; margin-top: 100px">확인</button>
		</div>
	</div>
	</c:when>
	
	<c:otherwise>
	<form id="searchFrm" name="searchFrm" action="find_id.jsp" method="post">
	<div style="width: 600px; margin: 0px auto; margin-top: 60px; margin-left: 145px">
	 <div class="form-row">
	   <div class="form-group col-md-4">
	     <label style="font-family: 'LotteMartHappy';">성명 (영문/여권명)</label>
	     <input type="text" id="nameEngL" name="nameEngL" class="form-control" placeholder="Last Name"/>
	   </div>

	   <div class="form-group col-md-4">
	     <label>&nbsp;</label>
	     <input type="text" id="nameEngF" name="nameEngF" class="form-control" placeholder="First Lame" style="width:210px"/>
	   </div>
	 </div>
	 <div class="form-row">
	   <div class="form-group col-md-4">
	     <label style="font-family: 'LotteMartHappy';">이메일</label>
	     <input type="text" class="form-control" id="email1" name="email1" placeholder="example"/>
	   </div>
	   <div style="height: 30px; padding-top: 5px; margin-right: 0px">
	     <label>&nbsp;</label><br/>
	     <label>@</label>
	   </div>
	   <div class="form-group col-md-4">
	     <label>&nbsp;</label>
	     <input type="text" class="form-control" id="email2" name="email2" placeholder="hotelluna.com"/>
	   </div>
	 </div>
	</div>
	 </form>
	
	<div>
		<button type="button" id="btnSearch" class="btn btn-dark btn-lg btn-block" style="width: 415px; margin:0px auto; margin-top: 50px">확인</button>
	</div>
	</c:otherwise>
	</c:choose>
	
	</div>
		
   </div>
   <div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>