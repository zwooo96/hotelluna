<%@page import="kr.co.sist.user.member.vo.MemberInfoVO"%>
<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String sessionId=(String)session.getAttribute("user_id");
if(sessionId==null){
	response.sendRedirect("login.jsp");
}

session.setAttribute("user_id", sessionId);

 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/intro.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<style type="text/css">
/* #container{ width: 400px; min-height:1200px; margin: 0px auto} */
#content{text-align:inherit; margin:0px auto; width:auto;}
.btnLoc{margin-top: 50px; margin-bottom: 50px}
.label{margin-top: 20px}
.name{width: 120px;}
.nameF{width: 120px; margin-left: 20px}
.dupBtn{margin-left: 20px}
.id{width: 220px}
.pass{width: 220px; margin-top: 20px}
.email{width: 220px; margin: 0px auto}
.year{width: 100px;}
.day{width: 70px; margin-left: 10px}
.num{width: 150px; margin-left: 10px}
.country{width:100px; margin-left: 10px}
.type{width: 100px}
.radio{margin-left: 20px}
.gender{margin-left: 30px; margin-right: 20px}
.modiBtn{width:240px; text-align: center;}
#joinBox{width: width: fit-content; margin: 0px auto ;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#modiBtn").click(function() {
		
		location.href="modify_mypage.jsp";
		
		
		
	});//click
	
});//ready
</script>
</head>
<body>
<div id="wrap">
   <div id="header">
       <jsp:include page="../common/jsp/header.jsp"></jsp:include>
   </div>
   
   <%	
   
   String userId= sessionId;
   
   if(userId!=null&&!"".equals(userId)){
	   
   MemberDAO mDao = MemberDAO.getInstance();
   MemberInfoVO mInfoVO = mDao.selectMemberInfo(userId);
	   
   	String korName1 = mInfoVO.getNameKorL();
   	String KorName2 = mInfoVO.getNameKorF();
   	String engName1 = mInfoVO.getNameEngL();
   	String engName2 = mInfoVO.getNameEngF();
   	String id = mInfoVO.getId();
   	String email = mInfoVO.getEmail1()+"@"+mInfoVO.getEmail2();
   	String birth = mInfoVO.getBirthDay();
  	String birthYear[] = birth.split("-");
  	String gender = mInfoVO.getGender();
  	String phoneType = mInfoVO.getPhoneType();
  	String phoneCountry = mInfoVO.getPhoneCountry();
    String phoneNum = mInfoVO.getPhoneNum();
    
   	pageContext.setAttribute("korNameL", korName1);
   	pageContext.setAttribute("KorNameF", KorName2);
   	pageContext.setAttribute("engNameL", engName1);
   	pageContext.setAttribute("engNameF", engName2);
   	pageContext.setAttribute("id", id);
   	pageContext.setAttribute("email", email);
	pageContext.setAttribute("year", birthYear[0]);
	pageContext.setAttribute("month", birthYear[1]);
	pageContext.setAttribute("day", birthYear[2]);
	pageContext.setAttribute("gen", gender);
	pageContext.setAttribute("phoneT", phoneType);
	pageContext.setAttribute("phoneC", phoneCountry);
	pageContext.setAttribute("phoneN", phoneNum);
	   
   	
   }//end if 
   
   
   		
   %>
   
   <div id="container" >
      <div id="sub_menu">
	<jsp:include page="mypage_submenu.jsp"></jsp:include>
	</div>
   <div id="content">
   <div class="text-center" style="margin-top: 40px;">
     <img src="../common/images/member/mypage.png">
   </div>
     <div id="joinBox">
     	<div class="label">
      	<label for="inputKor"><strong>성명 (국문)*</strong></label>
      <table class="inputTd">
		<tr>
		<td>
	    <input type="text" class="form-control name" value="${korNameL}" name="korName1" id="korName1" readonly="readonly">  
		</td>
		<td>
	    <input type="text" class="form-control nameF" value="${KorNameF }" name="korName2" id="korName2" readonly="readonly"> 
		</td>
		</tr>
		
      </table>
     </div>

	<div class="label">
      <label for="inputEng"><strong>성명(영문/여권명)*</strong></label>
	<table class="inputTd">
	<tr>
	<td >
	    <input type="text" class="form-control name" value="${engNameL }" id="engName1" name="engName1" readonly="readonly"> 
	</td>
	<td>
	    <input type="text" class="form-control nameF" value="${engNameF }" id="engName2" name="engName2" readonly="readonly"> 
	</td>
	</tr>
	</table>
	</div>		
	
	<div class="label">
	    <label for="inputEmail"><strong>이메일*</strong></label><br/>
	    <table class="inputTd">
	    <tr>
	    <td>
	   		<input type="text" class="form-control email" id="email" name="email" value="${ email}" readonly="readonly" >
	    </td>
	    </tr>
	    </table>
		</div>
				
		
			
	<div class="label">
      <label for="inputBirth"><strong>생년월일*</strong></label><br/>
	<table class="inputTd">
	<tr>
	<td>
		<input type="text" class="form-control year" id="birthYear" name="birthYear"  value="${ year}" readonly="readonly">
	</td>
	<td>	
		<input type="text" class="form-control day" id="birthMonth" name="birthMonth"  value="${month }" readonly="readonly">
	</td>
	<td>
		<input type="text" class="form-control day" id="birthDay" name="birthDay"  value="${day }" readonly="readonly">
	</td>
		</tr>
		</table>
	</div>
		
		<div class="label">
		<label><strong>성별*</strong></label><br/>
	<c:choose>
	<c:when test="${gen eq M} ">
	<div class="form-check form-check-inline radio" >
  	<input class="form-check-input gender" type="radio" name="gender" id="M" value="M">
  	<label class="form-check-label" for="inlineRadio1">남 &nbsp;</label>
	<div class="form-check form-check-inline">
 	 <input class="form-check-input gender" type="radio" name="gender" id="F" value="F">
	 <label class="form-check-label" for="inlineRadio2" >여</label>
	<script type="text/javascript">
	$("input:radio[name='gender']:radio[value='M']").prop('checked', true)
    $("#M").attr("disabled", true);
    $("#F").attr("disabled", true);
	
	</script>
	</div>
		</div>
	</c:when>
	<c:otherwise>
	<div class="form-check form-check-inline radio" >
  	<input class="form-check-input gender" type="radio" name="gender" id="M" value="M">
  	<label class="form-check-label" for="inlineRadio1">남</label>
	<div class="form-check form-check-inline">
 	 <input class="form-check-input gender" type="radio" name="gender" id="F" value="F">
	 <label class="form-check-label" for="inlineRadio2" >여</label>
	<script type="text/javascript">
	$("input:radio[name='gender']:radio[value='F']").prop('checked', true)
    $("#F").attr("disabled", true);
    $("#M").attr("disabled", true);
	</script>
	</div>
		</div>
	
	
	
	</c:otherwise>
	</c:choose>	
		</div>
		
		<div class="label">
		<label><strong>연락처*</strong></label><br/>
		<table class="inputTd">
		<tr>
		<td>
			<input type="text" class="form-control type" id="phoneType" name="phoneType"  value="${phoneT }" readonly="readonly">
	
		</td>		
		<td>
			<input type="text" class="form-control country" id="phoneCountry" name="phoneCountry"  value="${phoneC }" readonly="readonly">
		</td>		
		<td>
			<input type="text" class="form-control num" id="phoneNum" name="phoneNum"  value="${phoneN }" readonly="readonly">
		</td>		
		</tr>
		</table>
		</div>
      	<div class="btnLoc">
     <button type="button" class="btn btn-dark modiBtn"  id="modiBtn">수정하기</button>
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