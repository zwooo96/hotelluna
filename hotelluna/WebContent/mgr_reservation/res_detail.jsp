<%@page import="kr.co.sist.mgr.reservation.vo.MgrResDetailVO"%>
<%@page import="kr.co.sist.mgr.reservation.dao.MgrResDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionId = (String)session.getAttribute("user_id");
if( !"admin".equals(sessionId) || sessionId == null ){
	response.sendRedirect("../main/index.jsp");
	return;
}//end if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>예약관리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" href="../common/css/common.css" >
<style type="text/css">
.sidemenu { vertical-align: middle; height:80px; font-size: 25px; font-family: 'LotteMartHappy';}
#menu td:hover{ color:#BF8D50 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#cancel").click(function(){
		cancelChk();
	});//click
});//ready
function cancelChk(){
	if(confirm("예약을 취소하시겠습니까?")){
		location.href="res_delete.jsp?current_page=${ param.current_page }&res_num=${param.res_num}";
	}//end if
}//cancelChk
</script>
<style type="text/css">
th{ width:250px; text-align: center; font-size: 17px; height:50px }
td{ width:250px; font-size: 17px; height:50px }
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
	<jsp:include page="../common/jsp/header.jsp"/>
	</div>
	
	<div id="container" style="width:1800px; height:750px; margin:0px auto; margin-top: 10px; ">
		<jsp:include page="../common/jsp/mgr_menu.jsp"/>
		
		<div id="content" style="width:1300px; height:750px; float:left; margin-left: 100px">

		<div style="height:80px; font-size: 30px; font-family: 'LotteMartHappy'; margin-top: 70px; ">예약관리</div>
		
		<%
			String paramResNum = "";
			int resNum = 0;
			try{
				if( request.getParameter("res_num") != null ){
					paramResNum = request.getParameter("res_num");
					resNum = Integer.parseInt(paramResNum);
				}//end if
			}catch(NumberFormatException nfe){
				nfe.printStackTrace();
			}//end catch
			MgrResDAO mrDAO = MgrResDAO.getInstance();
			MgrResDetailVO mrdVO = mrDAO.selectResDetail(resNum);
			String requestCss = "25px";
			if( mrdVO != null ){
			if( mrdVO.getRequest() == null ){
				mrdVO.setRequest("");
			}//end if
			if( mrdVO.getRequest().length() > 32 ){ //요청사항이 너무 길어지면 (한글 기준 32자 초과)
				requestCss = "50px"; //스크롤바가 적용되는 셀 높이
			}//end
		%>
		
		<div style="border:2px solid #BF8D50; width:650px; height:470px; margin:0px auto; padding-top: 20px">
		<table class="table table-borderless" style="width:700px; height:100px; margin:0px auto">
		    <tr>
		      <th scope="col">아이디</th>
		      <td scope="col"><%= mrdVO.getId() %></th>
		    </tr>
		    <tr>
		      <th scope="row">예약번호</th>
		      <td><%= mrdVO.getResNum() %></td>
		    </tr>
		    <tr>
		      <th scope="row">체크인</th>
		      <td><%= mrdVO.getCheckIn() %></td>
		    </tr>
		    <tr>
		      <th scope="row">체크아웃</th>
		      <td><%= mrdVO.getCheckOut() %></td>
		    </tr>
		    <tr>
		      <th scope="row">예약인원</th>
		      <td><%= mrdVO.getResPerson() %></td>
		    </tr>
		    <tr>
		      <th scope="row">룸 이름</th>
		      <td><%= mrdVO.getRoomName() %></td>
		    </tr>
		    <tr>
		      <th scope="row" style="vertical-align: middle;">특별요청</th>
		      <td style="vertical-align: middle;">
		      	<div style="overflow-y: auto; width:300px; height:<%= requestCss %>; vertical-align: middle">
		      		<%= mrdVO.getRequest() %>
		      	</div>
		      </td>		      
		    </tr>
		    <tr>
		      <th scope="row">총 가격</th>
		      <td><%= mrdVO.getPrice() %></td>
		    </tr>
		    <%
			}//end if
				if( mrdVO == null ){
				%>
				<tr><td colspan="2">해당 예약내역이 존재하지 않습니다.</td></tr>
				<%
				}//end if
			%>
		</table>
		</div>
		<div style="width:220px; margin: 0px auto; margin-top: 40px">
			<input type="button" value="확인" class="btn btn-dark" onclick="history.back();" style="margin-right: 30px; width:90px; cursor: pointer;"/>
			<input type="button" id="cancel" name="cancel" value="예약취소" class="btn btn-dark" style="cursor: pointer;"/>
		</div>

		</div>
		
	</div>
	
	
</div>
</body>
</html>