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
<script type="text/javascript">
<%
	int resNum = Integer.parseInt(request.getParameter("res_num"));
	int currentPage = Integer.parseInt(request.getParameter("current_page"));
	MgrResDAO mrDAO = MgrResDAO.getInstance();
	int deleteFlag = mrDAO.deleteResInfo(resNum);
	String msg = "예약을 취소하지 못했습니다. 잠시 후 다시 시도해주세요.";
	if( deleteFlag == 1 ){
		msg = "예약이 취소되었습니다.";
	}//end if
%>
alert("<%= msg %>");
location.href="res_list.jsp?current_page=<%= currentPage %>";
</script>