<%@page import="kr.co.sist.user.faq.vo.ReqDetailVO"%>
<%@page import="kr.co.sist.user.faq.vo.ReqCheckVO"%>
<%@page import="kr.co.sist.user.faq.vo.ReqVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.faq.dao.ReqDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userId = (String)session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
   
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/intro.css">
<link rel="stylesheet" type="text/css" href="../common/css/mypage.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

<!-- Google CDN -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
   integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
   crossorigin="anonymous"></script>
<style type="text/css">
#questionDiv{max-width: 600px; margin:0px auto;}
#sub_menu_title {margin-bottom: 10px; height:80px; font-family: 'LotteMartHappy'; font-size:30px;}
.req_title{width:100px; background-color:#172d40; color:#ffffff;font-family: 'LotteMartDream';}
.req_content { text-align: justify; margin-top: 1rem;font-family: 'LotteMartDream'; word-break: break-all;}
</style>
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
			<div id="sub_menu_title">
				문의사항
			</div>
		
			<%
			String reqNum = request.getParameter("req_num");
			
			ReqDAO rDAO = ReqDAO.getInstance();
			ReqCheckVO rcVO = new ReqCheckVO(userId, reqNum);
			ReqDetailVO rdVO = rDAO.selectMyReqDetail(rcVO);
			boolean reqFlag = false;
			
			if(rdVO == null) {%>
				<script type="text/javascript">
					alert("문의 글을 읽어올 수 없습니다.");
					history.back();
				</script>
				<%return;
			}
			%>
			<div id="questionDiv">
				<table class="table" style="table-layout: fixed">
				    <tr>
				      <th scope="row" class="req_title">문의 유형</th>
				      <td class="req_content"><%=rdVO.getType().equalsIgnoreCase("D")?"일반문의":"예약문의"%></td>
				    </tr>
				    <tr>
				      <th scope="row" class="req_title">제목</th>
				      <td class="req_content"><%=rdVO.getTitle()%></td>
				    </tr>
				    <tr>
				      <th scope="row" class="req_title">내용</th>
				      <td class="req_content"><%=rdVO.getReqContent() %></td>
				    </tr>
				    <c:if test="<%=rdVO.getReply()!=null?true:false %>">
				    <tr class="border-bottom">
				    	<th scope="row" class="req_title">답변 시각</th>
				      	<td class="req_content"><%=rdVO.getReplyInputdate() %></td>
				    </tr>
				    <tr class="border-bottom">
				    	<th scope="row" class="req_title">답변</th>
				      	<td class="req_content"><%=rdVO.getReply() %></td>
				    </tr>
				    </c:if>
				  </table>
			</div>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>