<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.user.member.vo.MemberAddVO"%>
<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

request.setCharacterEncoding("UTF-8");
String sessionId=(String)session.getAttribute("user_id");
if(sessionId!=null){
	response.sendRedirect("../main/index.jsp");
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
#intro{font-family: LotteMartHappy;}
#btn{margin: 0px auto; text-align: center; margin-top: 30px}
.title{margin-bottom:20px; text-align: center; margin-top: 20px; font-family: LotteMartHappy; font-size: 30pt}
.wrap{display: flex;justify-content: center; font-family: LotteMartHappy; font: 25pt;}
th{height: 50px ;font-family: LotteMartHappy; font-size: 15pt; width: 200px}
td{ height: 50px ; min-width: 150px }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	$("#okayBtn").click(function() {
		location.href="user.jsp";
	});//click
});//ready
</script>

</head>
<body>


<c:catch var="e">


<%


	MemberDAO mDao = MemberDAO.getInstance();
	String plainPass = request.getParameter("pass");
	String hashPass = DataEncrypt.messageDigest("MD5", plainPass);
	MemberAddVO memAddVO =new MemberAddVO( request.getParameter("korName1"),request.getParameter("korName2"),
			request.getParameter("engName1"),request.getParameter("engName2"),
			request.getParameter("birthYear"),request.getParameter("birthMonth"),request.getParameter("birthDay"),
			request.getParameter("phoneType"),request.getParameter("phoneCountry"),request.getParameter("phoneNum"),
			request.getParameter("email"),
			request.getParameter("id"),request.getRemoteAddr(),hashPass,request.getParameter("gender"));

	mDao.insertMember(memAddVO);	

%>
</c:catch>
	
	<c:choose>
	<c:when test="${not empty e}">
	<div class="text-center" style="margin-top: 40px;">
      <img src="../common/images/member/welcome.png"><br/>
      </div>
	<div class="title">
      <span>회원가입 실패</span>
	</div>
	<div class="wrap">
		<div class="content">
		회원가입에 실패하였습니다. 다시 시도해 주세요.
		<div id="btn">
			<input type="button" value="확인" class="btn btn-dark" id="okayBtn">
		</div>
		</div>
		<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
		</div>
	</div>
	
	</c:when>
	<c:otherwise> 

<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	
	<div class="text-center" style="margin-top: 40px;">
      <img src="../common/images/member/welcome.png">
      <div>
      <span id="intro">회원가입 완료</span>
      </div>
      </div>
	<div id="container">
	<div class="title">
	<strong><%= request.getParameter("id")%></strong> 님 환영합니다!<br/>
	</div>
	<div class="wrap">
		<div class="content">
		<table>
			<tr>
			<th><strong>성명(국문)</strong></th>
			<td>
				<%=request.getParameter("korName2")+request.getParameter("korName1")%><br/>
			</td>
			</tr>
			<tr>
			<th><strong>성명(영문)</strong></th>
			<td>
				<%=request.getParameter("engName2")+request.getParameter("engName1")%><br/>
			</td>
			</tr>
			<tr>
			<th><strong>생년월일</strong></th>
			<td>
				<%=request.getParameter("birthYear")%>&nbsp;년&nbsp;<%=request.getParameter("birthMonth") %>&nbsp;월&nbsp;<%=request.getParameter("birthDay")%>&nbsp;일&nbsp;<br/>
			</td>
			</tr>
			<tr>
			<th><strong>연락처</strong></th>
			<td>
				<%=request.getParameter("phoneType")+"("+request.getParameter("phoneCountry")+")"+request.getParameter("phoneNum")%><br/>
			</td>
			</tr>	
			<tr>
			<th><strong>이메일</strong></th>
			<td>
				<%=request.getParameter("email")%><br/>
			</td>
			</tr>
		</table>
				<div id="btn">
				<input type="button" value="확인" class="btn btn-dark" id="okayBtn">
				</div>
		</div>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
	
 	</c:otherwise>
	</c:choose> 

</body>
</html>