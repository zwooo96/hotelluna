<%@page import="kr.co.sist.user.member.vo.PassCheckVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.sist.user.member.vo.LoginResultVO"%>
<%@page import="kr.co.sist.user.member.vo.LoginVO"%>
<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%
request.setCharacterEncoding("UTF-8");
String sessionId=(String)session.getAttribute("user_id");
if(sessionId==null){
	response.sendRedirect("login.jsp");
	return;
}

session.setAttribute("user_id", sessionId);

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<style type="text/css">
#frmDiv {
    width: fit-content;
    margin: 0px auto;
}
.pass{width: 230px;}
.checkBtn{width: 100px; height: 100px; margin-left: 25px; margin-bottom: 25px}
.content{min-height: 200px}
</style>
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/intro.css">
<link rel="stylesheet" type="text/css" href="../common/css/mypage.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
});//ready

window.onload=function(){
	document.getElementById("pass").addEventListener("keydown",chkEnter);
	document.getElementById("checkBtn").addEventListener("click",chkNull);
	
}//function


function chkEnter() { 
	if(window.event.which==13){
		 chkNull();
	}//end if
}//chkEnter

function chkNull() {
	if(	$("#pass").val().trim()==""){
		alert("비밀번호를 입력해주세요.");
		$("#pass").focus();		
		return;
	}//end if
	
	$("#chkFrm").submit();
	
}//chkNull

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
		<%
		String userId= sessionId;
		
		if(userId!=null&&!"".equals(userId)){
		PassCheckVO checkVO = new PassCheckVO();
		checkVO.setId(userId);
		String plainPass=request.getParameter("pass");
		if(plainPass!=null){
			
		String hashPass=DataEncrypt.messageDigest("MD5", plainPass);
		checkVO.setPass(hashPass);
				
		MemberDAO mDao = MemberDAO.getInstance();
		boolean flag = mDao.selectCheckPass(checkVO);
			
			if(flag){ //비밀번호가 맞으면
		%>
			<script type="text/javascript">
			location.href="mypage_detail.jsp";
			</script>
		<%
			}else{ //비밀번호가 틀리면
			
		%>		
			<script type="text/javascript">
			alert("비밀번호가 틀립니다 확인해주세요");		
			</script>
		<% 		
					}//end if
				}//end if
			}//end if
		%>
			<div id="frmDiv">
	  			<img src="../common/images/member/mypage.png" >
				<form name="chkFrm" id="chkFrm" action="mypage.jsp" method="post">
					<table class="custom-table">
						<tr>
							<td>
							<strong><%= userId %></strong>
							</td>
							<td rowspan="2">
								<input type="button" class="btn btn-dark checkBtn" value="입력" name="checkBtn" id="checkBtn" tabindex="2"><br> 
							<td>
						</tr>		
						<tr>
							<td>
								<input type="password" class="form-control pass" id="pass" name="pass" placeholder="비밀번호를 입력하세요" tabindex="1" ><br/>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
				
</body>
</html>