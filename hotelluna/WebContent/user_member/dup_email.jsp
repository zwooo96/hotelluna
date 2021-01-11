<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<title>이메일 중복확인</title>

<style type="text/css">
#emailCon{width: 750px; height: 50px}
#wrap{width: 750px; height: 80px}
#dupTb{margin-left: 50px; margin-top: 10px}
#atSign{vertical-align: middle; height: 10px; padding-top: 15px}
.email1{width: 220px; margin: 0px auto}
.email2{width: 70px; margin: 0px auto; margin-left: 5px}
.id{width: 150px; margin: 0px auto; margin-left: 10px}
.btn{margin-left: 20px}
.detail{margin-left: 5px; font-size: 12px; text-align: center; margin: 0px auto}
.domain{margin-left: 10px;}
img{width: 100px; margin-top: 40px"}

</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#dupEmailBtn").click(function() {
		if($("#email1").val().trim()==""){
			alert("중복검사에 사용할 이메일은 필수 입력 입니다.");
			return;
		}//end if
		
		if($("#email1").val().replace(/[0-9A-Za-z]/g,"") != ""){
		  	alert("이메일은 숫자또는 영문 대,소문자로만 이루어질 수 있습니다.");
		  	$("#email1").val("");
		    return;
		 }//end if
		
		if($("#email2").val().trim()==""){
			alert("중복검사에 사용할 이메일은 필수 입력 입니다.");
			return;
		}//end if
		
		$("#emailFrm").submit();
	});//click
	
});//ready


function changeEmail() {
	
	if('직접입력'==$("#selectDomain").val()){
		$("#email2").val("");
		$("#email2").attr("readonly", false);
	}else{
		$("#email2").val($("#selectDomain").val());
		$("#email2").attr("readonly", true);
	}//end else
	   
}//changeEmail


</script>
</head>
<body>

<%
	String email1=request.getParameter("email1");
	String email2=request.getParameter("email2");
	String userEmail = email1+"@"+email2;
	
	if(email1!=null&&!"".equals(email1)){
	
		MemberDAO mDao= MemberDAO.getInstance();
		boolean flag = false;
	
		flag=mDao.selectDupEmail(userEmail);
		
		if(flag){//이메일 중복이 아닐때 
%>

	<script type="text/javascript">
		alert("사용가능한 이메일 입니다.");
		window.opener.joinFrm.email.value="<%=userEmail%>";
		self.close();
		</script>				
	<%
		}else{ //아이디가 중복일때
			
	%>	
		<script type="text/javascript">
		alert("이미 존재하는 이메일 입니다.");
		$("#email1").focus();
		</script>
	<%
		}//end else
		
	}//end if
	%>		





<div id="wrap">
	<div id="emailCon">
	<form id="emailFrm" action="dup_email.jsp">
	<div class="emilFrm">
		
		<table id="dupTb" >
		<tr>
		<td colspan="5">
		<img src="../common/images/member/email.png" ><span class="detail">&nbsp;영문 또는 숫자만 입력 가능합니다.</span>
		</td>
		<td>
		<tr>
	    <td>
	    <input type="email" class="form-control email1" id="email1" name="email1" placeholder="이메일을 입력하세요" >
	    </td>
	    <td id="atSign">
	    &nbsp; @ &nbsp;
	     </td>
	     <td>
	     <input type="text" class="form-control email2" id="email2" name="email2">
	     </td>
	     <td id="emailSelect">
	    <select class="form-control domain" id="selectDomain" onchange="changeEmail()">
	    <option value="직접입력">직접입력</option>
	    <option value="gmail.com">gmail.com</option>
	    <option value="naver.com">naver.com</option>
	    <option value="daum.net">daum.net</option>
	    </select>
	     </td>
	     <td>
	    <input type="button" class="btn btn-dark btn" value="중복확인" id="dupEmailBtn" > 
	     </td>
	    </tr>
		</table>
	</div>
	</form>	

	
	
	</div>
</div>

</body>
</html>