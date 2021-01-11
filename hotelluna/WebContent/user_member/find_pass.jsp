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
	   if($("#id").val().replace(/[0-9a-z]/g,"") != ""){
	        alert("아이디는 숫자, 영문 소문자로만 이루어질 수 있습니다.");
	        $("#id").val("");
	        return;
	     }//end if
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
   $("#id").keydown(function(evt){
	   if( evt.which == 13 ){
		   chkNull();
	   }//end if
   });//keydown
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
});//ready

function chkNull(){
	if( $("#id").val() == "" ){
		alert("아이디를 입력해주세요.");
		return;
	}//end if
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
	<jsp:useBean id="pVO" class="kr.co.sist.user.member.vo.PassVO" scope="page"/>
	<jsp:setProperty property="*" name="pVO"/>
	
	<%
		String currentPass = "";
	
		if( pVO.getId() != null ){
			String id = pVO.getId();
			String nameEngF = pVO.getNameEngF().toUpperCase();
			String nameEngL = pVO.getNameEngL().toUpperCase();
			String email1 = pVO.getEmail1();
			String email2 = pVO.getEmail2();
			
			MemberDAO mDAO = MemberDAO.getInstance();
			pVO = new PassVO(id, nameEngF, nameEngL, email1, email2);
			
			currentPass = mDAO.selectMemberByPass(pVO);
			
			if( "".equals(currentPass) ){
				String msg = "입력하신 내용과 일치하는 회원정보가 없습니다.";
			%>
			<script type="text/javascript">
				alert("<%= msg %>");
				location.href="find_pass.jsp";
			</script>
			<%
			return;
			}//end if
			
			RequestDispatcher rd = request.getRequestDispatcher("find_pass_update.jsp");
			request.setAttribute("current_pass", currentPass);
			rd.forward(request, response);
			
		}//end if
	%>
	
	<div id="content" style="width:700px; height: 500px; margin:0px auto; margin-top: 150px">
	<div style="width: 240px; margin-top: 40px; margin:0px auto; margin-top: 170px">
		<h1 style="font-family: 'LotteMartHappy'">비밀번호 찾기</h1>
	</div>
	<form id="searchFrm" name="searchFrm" action="find_pass.jsp" method="post">
	<div style="width: 600px; margin: 0px auto; margin-top: 60px; margin-left: 145px">
	 <div class="form-row">
	   <div class="form-group col-md-4">
	     <label style="font-family: 'LotteMartHappy';">아이디</label>
	     <input type="text" id="id" name="id" class="form-control" placeholder="ID"/>
	   </div>

	 </div>
	 <div class="form-row">
	   <div class="form-group col-md-4">
	     <label style="font-family: 'LotteMartHappy';">성명 (영문/여권명)</label>
	     <input type="text" id="nameEngL" name="nameEngL" class="form-control" placeholder="Last Name"/>
	   </div>

	   <div class="form-group col-md-4">
	     <label>&nbsp;</label>
	     <input type="text" id="nameEngF" name="nameEngF" class="form-control" placeholder="First Name" style="width:210px"/>
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
	
	</div>
		
   </div>
   <div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>