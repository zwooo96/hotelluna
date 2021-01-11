<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<title>아이디 중복확인</title>

<style type="text/css">

.detail{margin-left: 50px; font-size: 12px;}
.id{width: 200px; margin-left: 5px}
.btn{width:100px; margin-left: 30px;}
#idTb{margin-left: 50px; margin-top: 30px}
#idCon{width: 450px; height: 50px}
#wrap{width:450px; height: 80px}
img{width: 100px; margin-top: 10px}
</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#btn").click(function() {
		if($("#id").val().trim()==""){
			alert("중복검사에 사용할 아이디는 필수 입력 입니다.");
			return;
		}//end if
		
    if($("#id").val().replace(/[0-9a-z]/g,"") != ""){
        alert("아이디는 숫자,영문 소문자로만 이루어질 수 있습니다.");
        $("#id").val("");
        return;
     }//end if
		$("#idFrm").submit();
	});//click
	
	
});//ready
</script>
</head>
<body>

<%
	String userId = request.getParameter("id");
	if(userId!=null){
		MemberDAO mDao= MemberDAO.getInstance();
		boolean flag = false;
	
		flag=mDao.selectDupId(userId);
		
		if(flag){//아이디 중복이 아닐때 
%>

	<script type="text/javascript">
		alert("사용가능한 아이디 입니다.");
		window.opener.joinFrm.id.value="${param.id}";
		self.close();
	</script>				
	<%
		}else{ //아이디가 중복일때
			
	%>	
		<script type="text/javascript">
		alert("이미 존재하는 아이디 입니다.");
		$("#id").focus();
		</script>
	<%
		}//end else
		
	}//end if
	%>		


<div id="wrap">
	<div id="idCon">
	<form id="idFrm" action="dup_id.jsp">
	<div class="idFrm">
		<table id="idTb" >
		<tr>
		<td>
		<img src="../common/images/member/id.png" >
		</td>
		<td>
		<input type="text" name="id" id="id" class="form-control id" >
		</td>
		<td>
		<input type="button" value="사용" class="btn btn-dark btn" id="btn" >
		</td>
		</tr>
		</table>
		<div class="detail">&nbsp;영문 또는 숫자만 입력 가능합니다.</div>
	</div>
	</form>	
	</div>
</div>

</body>
</html>