<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.mgr.faq.vo.MgrReqReplyVO"%>
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
<script type="text/javascript">
<%
	request.setCharacterEncoding("UTF-8");

	int reqNum = Integer.parseInt(request.getParameter("req_num"));
	int currentPage = Integer.parseInt(request.getParameter("current_page"));
	String reply = request.getParameter("reply");
	
	MgrReqDAO mrqDAO = MgrReqDAO.getInstance();
	MgrReqReplyVO mrrVO = new MgrReqReplyVO(reqNum, reply);
	
	String msg = "답변을 등록하지 못했습니다. 잠시 후 다시 시도해주세요.";
	try{
		mrqDAO.insertReply(mrrVO);
		msg = "답변이 등록되었습니다.";
	}catch(SQLException se){
		se.printStackTrace();
	}//end catch
%>
alert("<%= msg %>");
location.href="faq_list.jsp?current_page=<%= currentPage %>";
</script>