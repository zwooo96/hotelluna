<%@page import="kr.co.sist.user.intro.vo.IntroVO"%>
<%@page import="kr.co.sist.user.intro.dao.IntroDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String roomName = request.getParameter("roomName");
IntroDAO iDAO = IntroDAO.getInstance();
IntroVO iVO = iDAO.selectRoomIntro(roomName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/intro.css">

<!-- eng -->
<link href="https://fonts.googleapis.com/css2?family=Baloo+Tamma+2&family=Nova+Mono&family=Ropa+Sans&display=swap" rel="stylesheet">
<!-- ko -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

<style type="text/css">
#desc_img {padding-bottom: 10px;}
#desc_txt {font-family: 'Noto Serif KR', serif; line-height: 35px;}
.introRoomImg {width:100px;}
.img-slider {width: 800px; margin:0px auto;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	var roomName = $("#room_name").val();
		console.log(roomName);
	if(roomName == null || "null" === roomName ) {
		alert("잘못된 요청입니다.");
		location.replace("about_luna.jsp");
	}
});
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container">
		<div id="sub_menu">
		  <jsp:include page="intro_submenu.jsp"></jsp:include>
		</div>
		
		<div id="content">
			<div id="description" >
				<input type="hidden" value="<%=roomName %>" id="room_name" />
				<div id="sub_menu_title" class="sub-menu-title">
					<%=roomName %>
				</div>
				<div id="desc_img">
					<div id="carouselExampleIndicators" class="carousel slide img-slider" data-ride="carousel">
						<ol class="carousel-indicators">
					   		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					   		<c:if test="not empty <%=iVO.getImg2() %>">
							    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					   		</c:if>
						  </ol>
						  <div class="carousel-inner">
						  <%if(iVO != null) {%>
						    <div class="carousel-item active">
						      <img src="../common/images/room/<%=iVO.getImg1() %>" class="d-block w-100 introRoomImg" alt="<%=iVO.getImg1() %>">
						    </div>
							<c:if test="not empty <%=iVO.getImg2() %>">
							    <div class="carousel-item">
							      <img src="..." class="d-block w-100" alt="...">
							    </div>
						    </c:if>
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
				</div>
				<div id ="desc_txt">
					<%=iVO.getRoomInfo() %>
					<%
					}%>
				</div>
			</div>
		</div>
	</div>
	
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
	
</div>
</body>
</html>