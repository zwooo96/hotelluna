<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.mgr.room.vo.MgrRoomVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.mgr.room.dao.MgrRoomDAO"%>
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
<title>룸관리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" href="../common/css/common.css" >
<style type="text/css">
.sidemenu { vertical-align: middle; height:80px; font-size: 25px; font-family: 'LotteMartHappy';}
#menu td:hover{ color:#BF8D50 }
table{ margin:0px auto }
.descTable{ width:600px; }
#room_name {font-family: 'LotteMartHappy'; font-size:25px; text-align:center;padding:50px;}
.tab-title {background-color:#343a40; color:#ffffff; width:120px;}
#buttons {margin:0px auto; padding:50px; text-align: center;}
.img-slider {width: 800px; margin:0px auto;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
<%
String roomName = request.getParameter("room_name");
%>
$(function(){
	//룸 수정 페이지로 이동
	$("#modifyBtn").click(function() {
		location.href="room_modify.jsp?room_name=<%=roomName%>";
	});
});
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
			<jsp:include page="../common/jsp/header.jsp"/>
	</div>
	<div id="container" style="width:1800px; height:750px; margin:0px auto; margin-top: 10px; ">
		<jsp:include page="../common/jsp/mgr_menu.jsp"></jsp:include>
		<div id="content" style="width:1200px; height:750px; float:left; margin-left: 100px">
			<div id="room_name">${param.room_name }</div>
			<div id="room_info_desc">
				<%
				MgrRoomDAO dao = MgrRoomDAO.getInstance();
				MgrRoomVO mrVO = dao.selectRoomInfo(roomName);
				List<String> imagePaths = new ArrayList<String>();
				if(mrVO != null) {
					if(mrVO.getImg1() != null) {
						imagePaths.add(mrVO.getImg1());
					}
					if(mrVO.getImg1() != null) {
						imagePaths.add(mrVO.getImg1());
					}
					if(mrVO.getImg2() != null) {
						imagePaths.add(mrVO.getImg2());
					}
					if(mrVO.getImg3() != null) {
						imagePaths.add(mrVO.getImg3());
					}
					if(mrVO.getImg4() != null) {
						imagePaths.add(mrVO.getImg4());
					}
					if(mrVO.getImg5() != null) {
						imagePaths.add(mrVO.getImg5());
					}
				}
				
				%>
				<%if(mrVO!=null){ %>
				<table class="table descTable">
				    <tr>
				      <th scope="row" class="tab-title">객실 크기</th>
				      <td><%=mrVO.getRoomSize() %></td>
				    </tr>
				     <tr>
				      <th scope="row" class="tab-title">객실 갯수</th>
				      <td><%=mrVO.getRoomCnt()%></td>
				    </tr>
				    <tr>
				      <th scope="row" class="tab-title">가격</th>
				      <td><%=mrVO.getPrice() %></td>
				    </tr>
				    <tr>
				      <th scope="row" class="tab-title">최대 인원</th>
				      <td><%=mrVO.getMaxGuest()%></td>
				    </tr>
				    <tr>
				      <th scope="row" class="tab-title">어메니티</th>
				      <td><%=mrVO.getAmenity()%></td>
				    </tr>
				</table>
				
				<div id="carouselExampleControls" class="carousel slide img-slider" data-ride="carousel">
				  <div class="carousel-inner">
				  	<% 
				  	for(int i = 0; i < imagePaths.size(); i++) {
				  		if(i == 0) {%>
				  		<div class="carousel-item active"><%
				  		} else {%>
				  		<div class="carousel-item"><%
				  		}%>
				      		<img src="../common/images/room/<%=imagePaths.get(i) %>" class="d-block w-100" >
				    	</div><%
				  	}
				  	%>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				<div id="buttons">
					<input type="button" value="수정하기"  class="btn btn-dark" id="modifyBtn" />
					<input type="button" value="뒤로가기"  class="btn btn-dark" onclick="javascript:history.back()" />
				</div>
				<%}else{ %>
				<div>
				잘못된 접근입니다.
				</div>
				<%}//end else %>
				
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>