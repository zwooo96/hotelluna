<%@page import="kr.co.sist.user.member.vo.MemberModifyVO"%>
<%@page import="jdk.internal.org.jline.reader.UserInterruptException"%>
<%@page import="kr.co.sist.user.member.vo.MemberInfoVO"%>
<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<style type="text/css">
#container{ width: 400px; min-height:1200px; margin: 0px auto}
.btnLoc{margin-top: 50px; margin-bottom: 50px}
.inputTd{margin-left: 20px}
.label{margin-top: 20px}
.name{width: 120px;}
.nameF{width: 120px; margin-left: 20px}
.dupBtn{margin-left: 20px}
.id{width: 220px}
.pass{width: 220px; margin-top: 20px}
.email{width: 220px; margin: 0px auto}
.year{width: 100px;}
.day{width: 70px; margin-left: 10px}
.num{width: 200px; margin-left: 10px}
.country{width: 150px; margin-left: 10px}
.type{width: 100px}
.radio{margin-left: 20px}
.gender{margin-left: 30px; margin-right: 20px}
.confirmBtn{width:240px; text-align: center;}
#joinBox{width: width: fit-content; margin: 0px auto ;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){	
});//ready
</script>
</head>
<body>
<div id="wrap">
   <div id="header">
       <jsp:include page="../common/jsp/header.jsp"></jsp:include>
   </div>
	
<%	
	String userId= sessionId;
	
	if(userId!=null&&!"".equals(userId)){
		
		MemberDAO mDAO = MemberDAO.getInstance();
		int result = 0;
		MemberModifyVO mminfoVO = new MemberModifyVO(request.getParameter("id"),request.getParameter("email"),
		request.getParameter("phoneType"),request.getParameter("phoneCountry"),request.getParameter("phoneNum"));
			
		result = mDAO.updateMember(mminfoVO);
		System.out.println(result);
		if(result==0){ //회원정보 수정에 실패 했을때
%>
		<span> 회원정보 수정에 실패하였습니다. 잠시후 다시 시도해 주세요 </span>
<% 			
		}else{
%>			
		<script type="text/javascript">
		
		location.href="mypage_update.jsp";
		</script>		
<% 			
		}//end else
		
	}//end if
	
%>   
   
   
 
 </div>
</body>
</html>