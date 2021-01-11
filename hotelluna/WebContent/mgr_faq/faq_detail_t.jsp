<%@page import="kr.co.sist.mgr.faq.vo.MgrReqDetailVO"%>
<%@page import="kr.co.sist.mgr.faq.dao.MgrReqDAO"%>
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
<title>문의관리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" href="../common/css/common.css" >
<style type="text/css">
.sidemenu { vertical-align: middle; height:80px; font-size: 25px; font-family: 'LotteMartHappy';}
#menu td:hover{ color:#BF8D50 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<style type="text/css">
th{ width:300px; text-align: center }
</style>
<script type="text/javascript">
$(function(){

	$("#update").click(function(){
		replyChkNull();
	});//click
	
});//ready
function replyChkNull(){
	if( $("#reply").val() == "" ){
		alert("답변을 입력해주세요.");
		return;
	}//end if
	$("#replyFrm").submit();
}//replyChkNull
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
	<jsp:include page="../common/jsp/header.jsp"/>
	</div>
	
	<div id="container" style="width:1800px; height:750px; margin:0px auto; margin-top: 10px; ">
		<jsp:include page="../common/jsp/mgr_menu.jsp"/>
		
		<div id="content" style="width:1300px; height:750px; float:left; margin-left: 100px">

		<div style="height:80px; font-size: 30px; font-family: 'LotteMartHappy'; margin-top: 70px; ">문의관리</div>
		
		<%
			String paramReqNum = "";
			int reqNum = 0;
			int currentPage = 0;
			try{
				if( request.getParameter("req_num") != null){
					paramReqNum = request.getParameter("req_num");
					reqNum = Integer.parseInt(paramReqNum);
				}//end if
				if( request.getParameter("current_page") != null ){
					currentPage = Integer.parseInt(request.getParameter("current_page"));
				}//end if
			}catch(NumberFormatException nfe){
				nfe.printStackTrace();
			}//end catch
			MgrReqDAO mrqDAO = MgrReqDAO.getInstance();
			MgrReqDetailVO mrdVO = null;
			mrdVO = mrqDAO.selectReq(reqNum);
			String typeFlag = "예약문의";
			if( mrdVO != null ){
			if( "D".equals(mrdVO.getReqType()) ){
				typeFlag = "일반문의";
			}//end if
		%>
		
		<div>
		<table class="table table-borderless" style="width:1000px; margin:0px auto; font-size: 17px">
		    <tr>
		      <th scope="col">문의유형</th>
		      <td scope="col"><%= typeFlag  %></td>
		    </tr>
		    <tr>
		      <th scope="row">아이디</th>
		      <td><%= mrdVO.getUserId() %></td>
		    </tr>
		    <tr>
		      <th scope="row">이메일</th>
		      <td><%= mrdVO.getUserEmail() %></td>
		    </tr>
		    <tr>
		      <th scope="row">연락처</th>
		      <td><%= mrdVO.getUserPhone() %></td>
		    </tr>
		    <tr>
		      <th scope="row">제목</th>
		      <td><%= mrdVO.getReqTitle() %></td>
		    </tr>
		    <tr>
		      <th scope="row" style="vertical-align: middle;">내용</th>
		      <td>
		      	<div style="overflow-y: scroll; height:200px; width:600px;"><%= mrdVO.getReqContent() %></div>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row" style="vertical-align: middle;">답변</th>
		      <td>
		      <form id="replyFrm" name="replyFrm" action="faq_update.jsp?current_page=<%= currentPage %>&req_num=<%= reqNum %>" method="post">
			      <textarea id="reply" name="reply" style="overflow-y: scroll; height:200px; width:600px"><%= mrdVO.getReqReply() %></textarea>
		      </form>
		      </td>
		    </tr>
			<%
			}//end if
				if( mrdVO == null ){
				%>
				<tr><td colspan="2">해당 문의내역이 존재하지 않습니다.</td></tr>
				<%
				}//end if
			%>		    
		</table>
		</div>
		
		<div style="margin:0px auto; width: 160px; margin-top:30px; margin-bottom:50px">
			<input type="button" value="뒤로" class="btn btn-dark" onclick="history.back();" style="margin-right: 30px; width:60px; cursor: pointer"/>
			<input type="button" value="수정" id="update" name="update" class="btn btn-dark" style="cursor: pointer;"/>
		</div>
		
		</div>
		
	</div>
</div>
</body>
</html>