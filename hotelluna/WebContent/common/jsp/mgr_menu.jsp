<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="menu" style="width:230px; height:750px; float:left;">
<table class="table table-borderless" style="text-align:center;">
  <thead>
    <tr>
      <th scope="col" class="sidemenu" style="vertical-align: middle; height:150px">
      	<img src="../common/images/icons/admin.png" style="width:35px; margin-bottom: 5px">&nbsp;관리자
      </th>
    </tr>
  </thead>
  <tbody>
  <%
  String reqPage=request.getServletPath();
  pageContext.setAttribute("reqPage", reqPage);
  %>
    <tr>
      <td scope="row" id="roomMenu" class="sidemenu" style="vertical-align: middle; cursor: pointer${ reqPage eq '/mgr_room/room_list.jsp'|| reqPage eq '/mgr_room/add_room.jsp'|| reqPage eq '/mgr_room/room_detail.jsp'|| reqPage eq '/mgr_room/room_info.jsp'|| reqPage eq '/mgr_room/room_modify.jsp'?';color:#BF8D50':''}" onclick="location.href='../mgr_room/room_list.jsp'">룸관리</td>
    </tr>
    <tr>
      <td scope="row" id="resMenu" class="sidemenu" style="vertical-align: middle; cursor: pointer${ reqPage eq '/mgr_reservation/res_list.jsp'|| reqPage eq '/mgr_reservation/res_detail.jsp'?';color:#BF8D50':''}" onclick="location.href='../mgr_reservation/res_list.jsp'">예약관리</td>
    </tr>
    <tr>
      <td scope="row" id="memMenu" class="sidemenu" style="vertical-align: middle; cursor: pointer${ reqPage eq '/mgr_member/member_list.jsp'?';color:#BF8D50':''}" onclick="location.href='../mgr_member/member_list.jsp'">회원관리</td>
    </tr>
    <tr>
      <td scope="row" id="faqMenu" class="sidemenu" style="vertical-align: middle; cursor: pointer${ reqPage eq '/mgr_faq/faq_list.jsp'|| reqPage eq '/mgr_faq/faq_detail_f.jsp'|| reqPage eq '/mgr_faq/faq_detail_t.jsp'?';color:#BF8D50':''}" onclick="location.href='../mgr_faq/faq_list.jsp'">문의관리</td>
    </tr>
  </tbody>
</table>
</div>

<div style="border-right: 2px solid #333; height:750px; float:left; margin-left:80px;"></div>
