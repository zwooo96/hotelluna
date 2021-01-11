<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.sist.user.member.vo.LoginResultVO"%>
<%@page import="kr.co.sist.user.member.vo.LoginVO"%>
<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String sessionId=(String)session.getAttribute("user_id");
if(sessionId!=null){ //로그인 되있으면 index로 보내기 
	response.sendRedirect("../main/index.jsp");
	return;
}
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
.loginBox{ margin: 0 auto;}
.loginTb{ margin: 0 auto;}
.id_save{margin: 0 auto;}
.container{ margin: 0 auto; margin-top:150px; min-height: 741px}
.id{width: 230px;}
.loginBtn{width: 100px; height: 100px; margin-left: 25px; margin-bottom: 25px}
.joinBtn{text-align: center; width: 360px; margin-top: 10px;}
.findIdBtn{width:170px;}
.findPassBtn{width:165px; margin-left: 20px}
.idSave{margin-top: 10px}
 
#btn{text-align: center; font-size: 15px; margin-top:20px}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {	

	var userInputId= getCookie("userInputId");
		$("input[name='id']").val(userInputId);
		
		if($("input[name='id']").val() != ""){
			$("#saveUserId").attr("checked",true);
		}//end if
		
		$("#saveUserId").change(function() {
			if($("#saveUserId").is(":checked")){
				var userInputId = $("input[name='id']").val();
				setCookie("userInputId",userInputId,7)//7일동안
			}else{
				deleteCookie("userInputId");
			}//end esle
			
		});//change
	
	$("input[nmae='d']").keyup(function() {
		if($("#saveUserId").is(":checked")){
			var userInputId = $("input[name='id']").val();
			setCookie("userInputId",userInputId,7)//7일동안
		}//end if
	});//keyup
});//ready

window.onload=function(){
	document.getElementById("id").addEventListener("keydown",chkEnter);
	document.getElementById("pass").addEventListener("keydown",chkEnter);
	document.getElementById("loginBtn").addEventListener("click",chkNull);
	
}//function

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}


function chkEnter() { 
	if(window.event.which==13){
		 chkNull();
	}//end if
}//chkEnter

function chkNull() {
	
	var obj = document.loginFrm;
	if(obj.id.value.trim()==""){
		alert("아이디를 입력해주세요");
		obj.id.focus(); //control에 커서를 이동
		return;
	}//end if
	
	if(obj.pass.value.trim()==""){
		alert("비밀번호를 입력해주세요.");
		obj.pass.focus();
		return;
		
	}//end if
	
	$("#loginFrm").submit();
	
}//chkNull
	function findId() {
	
	location.href="find_id.jsp";
		
	}//findPass
	function findPass() {
	
	location.href="find_pass.jsp";
		
	}//findPass
	
	function join() {
	location.href="join.jsp";
	
	}//join
	
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
       <jsp:include page="../common/jsp/header.jsp"></jsp:include>
   </div>
		
	<div class="container">
	<%
		String userId= request.getParameter("id");
		
		if(userId!=null &&!"".equals(userId)){
		String userPass= request.getParameter("pass");
		
		LoginVO lVO = new LoginVO();
		lVO.setId(userId);
		lVO.setPass(DataEncrypt.messageDigest("MD5", userPass));
		MemberDAO mDAO = MemberDAO.getInstance();
		LoginResultVO lRVO =mDAO.selectLoginName(lVO);
		
		if(lRVO != null) { //로그인 성공
			String userName= lRVO.getEname();
			String adminFlag=lRVO.getAdminFlag();
			if(!"".equals(userName)){
				session.setAttribute("user_id", lVO.getId());
				session.setAttribute("user_name",userName);
				session.setAttribute("admin_flag",adminFlag);
				
				if(!"Y".equals(adminFlag)){ //관리자가 아닐때
		%>
					<script type="text/javascript">
						location.href="user.jsp";
					</script>
		<%		}else{ //관리자 일때		%>
					<script type="text/javascript">
						location.href="../main/index.jsp";
					</script>					
		<% 	
				}//end else
			}//end if
	%>				
	<%
		}else{//end else //로그인 실패
	%>
			<script type="text/javascript">
				alert("아이디와 비밀번호를 확인해주세요");
			</script>
	<%
		}//end else
	}//end if	
	%>
				 
	<div class="text-center" style="margin-bottom: 25px">
  		<img src="../common/images/member/login.png" >
	</div>
	<form name="loginFrm" id="loginFrm" action="login.jsp" method="post">
		<div id="loginBox">
			<table class="loginTb">
		<tr>
		<td>
			<input type="text" class="form-control id" id="id" name="id"  placeholder="아이디를 입력하세요 " autofocus="autofocus" tabindex="1"> <br/>
		</td>
		<td rowspan="2">
			<input type="button" class="btn btn-dark loginBtn" value="login" name="loginBtn" id="loginBtn" tabindex="3"><br> 
		<td>
		</tr>		
		<tr>
		<td>
			<input type="password" class="form-control id" id="pass" name="pass" placeholder="비밀번호를 입력하세요" tabindex="2" ><br/>
		</td>
		</tr>
		<tr>
		<td colspan="2">
		<div class="form-check">
			<input class="form-check-input idSave" type="checkbox" value="F" id="saveUserId">
			<label class="form-check-label" for="saveUserId"> 아이디 저장 </label>
		</div>
		</td>
		</tr>
		</table>
		<div id="btn">

			<button type="button" class="btn btn-dark findIdBtn" id="findIdBtn" onclick="findId()">아이디 찾기</button>
			<button type="button" class="btn btn-dark findPassBtn" id="findPassBtn" onclick="findPass()">비밀번호 찾기</button> <br/>
			<input type="button" class="btn btn-dark joinBtn" value="회원가입" id="joinBtn" onclick="join()"/>

		</div>	
			</div>
		</form>
		</div>
		
		</div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</body>
</html>