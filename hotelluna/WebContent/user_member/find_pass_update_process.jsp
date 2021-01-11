<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.member.vo.PassModifyVO"%>
<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
<%
	String id = request.getParameter("id");
	String currentPass = request.getParameter("currentPassVal");
	String newPass = DataEncrypt.messageDigest("MD5", request.getParameter("newPass"));
	String confirmPass = DataEncrypt.messageDigest("MD5", request.getParameter("confirmPass"));
	
	boolean hasCurPass = false;
	
	String msg = "";
	
	if( newPass.equals(confirmPass) ){
		MemberDAO mDAO = MemberDAO.getInstance();
		PassModifyVO pmVO = new PassModifyVO(id, currentPass, newPass, hasCurPass);
		
		msg = "비밀번호를 변경하지 못했습니다. 잠시 후 다시 시도해주세요.";
		try{
			int result = mDAO.updatePass(pmVO);
			if( result == 1){
				msg = "비밀번호가 변경되었습니다. 다시 로그인 해주세요.";
			}//end if
		}catch(SQLException se){
			se.printStackTrace();
			%>
			location.href = history.back();
			<%
		}//end catch
	}//end if
%>
alert("<%= msg %>");
location.href="login.jsp";
</script>