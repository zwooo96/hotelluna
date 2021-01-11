<%@page import="kr.co.sist.user.intro.dao.IntroDAO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.mgr.room.dao.MgrRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <h5 class="dropdown-header"><img src="../common/images/main/about.png" class="sub-title-img"/></h5> -->
<h5 class="dropdown-header"><img src="../common/images/main/about.png" class="sub-title-img"/></h5>
<div class="dropdown-divider"></div>
<a class="dropdown-item" href="about_luna.jsp" ><label class="sub-menu">개요</label></a>
<%
IntroDAO iDAO = IntroDAO.getInstance();
List<String> roomList = iDAO.selecctAllRoomName();
if(roomList != null) {
for(String roomName : roomList) {%>
<a class="dropdown-item" href="about_room.jsp?roomName=<%=roomName %>" ><label class="room-name"><%=roomName %></label></a> 
	<%
	}
}
%>
<a class="dropdown-item" href="loadtohotel.jsp"><label class="sub-menu">오시는 길</label></a>
