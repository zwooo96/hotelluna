<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userId = (String) session.getAttribute("user_id");

%>
<c:set var="user_id" value="<%=userId %>" />
<nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand" href="../main/index.jsp">
  	<img src="../common/images/logo/logo_big.png" class="logo"/>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0" id="main-header-menu">
      <li class="nav-item active" id="main-header-menu-li">
        <a class="nav-link" id="main-header-a" href="../user_reservation/res_main.jsp">
        	<img src="../common/images/main/reservation.png" class="menu"/>
        </a>
      </li>
      <li class="nav-item active" id="main-header-menu-li">
        <a class="nav-link" id="main-header-a" href="../user_reservation/non_mem_res_search.jsp">
        	<img src="../common/images/main/chk_reservation.png" class="menu"/>
        </a>
      </li>
      <li class="nav-item active" id="main-header-menu-li">
        <a class="nav-link" id="main-header-a" href="../user_intro/about_luna.jsp">
        	<img src="../common/images/main/about.png" class="menu"/>
        </a>
      </li>
      <li class="nav-item active" id="main-header-menu-li">
        <a class="nav-link" id="main-header-a" href="../user_faq/user_inq.jsp">
        	<img src="../common/images/main/inquiries.png" class="menu"/>
        </a>
      </li>
    </ul>
      <div class="form-inline my-2 my-lg-0">
      	<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      		<c:choose>
      			<c:when test="${empty user_id}">
  			      		<li class="nav-item active">
				      		<label id="member_menu">
				      			<a class="nav-link" id="main-header-options" href="../user_member/join_terms.jsp">Join</a>
				      		</label>
					     </li>
			      		 <li class="nav-item active">
					        <label id="member_menu"> <a class="nav-link" href="../user_member/login.jsp" id="main-header-options">Login</a></label>
					     </li>
      			</c:when>
      			<c:when test="${user_id eq 'admin'}">
      				<li class="nav-item active">
					    <a class="nav-link" id="main-header-options" href="../user_member/mypage.jsp"><label id="member_menu" style="cursor: pointer;">MyPage</label></a>
					</li>
					<li class="nav-item active">
					    <a class="nav-link" id="main-header-options"  href="../mgr_room/room_list.jsp"><label id="member_menu" style="cursor: pointer;">관리자</label></a>
					</li>
			      	<li class="nav-item active">
					    <a class="nav-link" id="main-header-options"  href="../user_member/logout.jsp"><label id="member_menu" style="cursor: pointer;">Logout</label></a>
					</li>
      			</c:when>
      			<c:otherwise>
      				<li class="nav-item active">
					        <a class="nav-link" id="main-header-options" href="../user_member/mypage.jsp"><label id="member_menu" style="cursor: pointer;">MyPage</label></a>
					     </li>
			      		 <li class="nav-item active">
					        <a class="nav-link" id="main-header-options"  href="../user_member/logout.jsp"><label id="member_menu" style="cursor: pointer;">Logout</label></a>
					 </li>
      			</c:otherwise>
      			
      			
      		</c:choose>
      	</ul>
      </div>
  </div>
</nav>