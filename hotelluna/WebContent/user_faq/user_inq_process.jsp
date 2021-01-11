<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.faq.dao.ReqDAO"%>
<%@page import="kr.co.sist.user.faq.vo.ReqAddVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="분기페이지"
    errorPage="user_inq_fail.jsp"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

String userId = (String)session.getAttribute("user_id");
if(userId == null) {
	response.sendRedirect("../user_member/login.jsp");
	return;
}

request.setCharacterEncoding("UTF-8");

String reqType = request.getParameter("req_type"); 
String reqTitle = request.getParameter("req_title");
String reqContent = request.getParameter("req_content");

ReqAddVO raVO = new ReqAddVO(userId, reqType, reqTitle, reqContent);

ReqDAO rDAO = ReqDAO.getInstance();
try {
	rDAO.insertReq(raVO);
	response.sendRedirect("user_inq_complete.jsp");
} catch(SQLException se) {
	se.printStackTrace();
	throw se;
}
%>
