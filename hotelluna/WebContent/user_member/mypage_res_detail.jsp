<%@page import="kr.co.sist.user.reservation.vo.ResDetailVO"%>
<%@page import="kr.co.sist.user.reservation.vo.MemberResSearchVO"%>
<%@page import="kr.co.sist.user.reservation.dao.ResDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String userId=(String)session.getAttribute("user_id");
if((userId==null || "".equals(userId))){
	response.sendRedirect("../user_member/login.jsp");
}//end if
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
<link rel="stylesheet" type="text/css" href="../common/css/mypage.css">
<style type="text/css">
#desc_img {padding-bottom: 10px;}
#desc_txt {font-family: 'Noto Serif KR', serif; line-height: 35px;}

th{ height: 50px ;font-family: LotteMartHappy; font-size: 15pt; width: 200px }
td{ height: 50px ; min-width: 150px }
.wrapper1 {	display: flex;justify-content: center; }
.res_search_result { display: flex; align-items: center; }
.btn{ margin: 0px 5px 0px 5px }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
function resDelete() {
	if(confirm("정말 삭제하시겠습니까?")){
		location.replace('mypage_res_delete.jsp?current_page=${ param.current_page }&res_num=${ param.res_num }')
	}//end if
	
}//resDelete
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
	<div id="boardDiv">
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	예약 조회
	</div>
	
<%
try{
int resNum=Integer.parseInt(request.getParameter("res_num"));
MemberResSearchVO mrsVO=new MemberResSearchVO(userId, String.valueOf(resNum) );
ResDAO rDAO=ResDAO.getInstance();
ResDetailVO rdVO=rDAO.selectResInfo(mrsVO);
%>
	<%if(rdVO!=null){ %>
	<div class="wrapper1">
	<div>
	<form id="resDetailFrm" action="mypage_res_delete.jsp" method="post">
	<input type="hidden" name="res_num" value="${ param.res_num }"/>
	<input type="hidden" name="current_page" value="${ param.current_page }"/>
	<table>
	<tr>
	<th>예약번호</th>
	<td><%= rdVO.getResNum() %></td>
	</tr>
	<tr>
	<th>룸 이름</th>
	<td><%= rdVO.getRoomName() %></td>
	</tr>
	<tr>
	<th>체크인</th>
	<td><%= rdVO.getCheckIn() %></td>
	</tr>
	<tr>
	<th>체크아웃</th>
	<td><%= rdVO.getCheckOut() %></td>
	</tr>
	<tr>
	<th>예약 인원</th>
	<td><%= rdVO.getResPerson() %></td>
	</tr>
	<tr>
	<th>총 가격</th>
	<td><%= rdVO.getTotalPrice() %></td>
	</tr>
	<tr>
	<th>특별 요청</th>
	<td><%= rdVO.getRequirements() %></td>
	</tr>
	</table>
	</form>
	<div  class="wrapper1" style="margin-top: 30px">
	<input type="button" id="btn" value="예약현황" class="btn btn-dark" onclick="location.href='mypage_res_list.jsp?current_page=${ param.current_page }'"/>
	<input type="button" id="btn" value="예약취소" class="btn btn-dark" onclick="resDelete()"/>
	</div>
	</div>
	</div>
	<%}else{ %>
	<div class="wrapper1">
	<div style="text-align: center">
	<form id="resDetailFrm" action="mypage_res_delete.jsp" method="post">
	<span>잘못된 접근 입니다.</span><br/>
	<input type="button" id="btn" value="뒤로" class="btn btn-dark" style="margin-top: 20px;" onclick="location.href='mypage_res_list.jsp?current_page=${ param.current_page }'"/>
	</form>
	</div>
	</div>
	<%} %>
	<%}catch(NumberFormatException nfe){%>
	<div class="wrapper1">
	<div style="text-align: center">
	<form id="resDetailFrm" action="mypage_res_delete.jsp" method="post">
	<span>잘못된 접근 입니다.</span><br/>
	<input type="button" id="btn" value="뒤로" class="btn btn-dark" style="margin-top: 20px;" onclick="location.href='mypage_res_list.jsp?current_page=${ param.current_page }'"/>
	</form>
	</div>
	</div>
	<%}//end catch%>
	</div>
	</div>
	</div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>