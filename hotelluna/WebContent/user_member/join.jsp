<%@page import="kr.co.sist.user.member.dao.MemberDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String sessionId=(String)session.getAttribute("user_id");
if(sessionId!=null){ //로그인 되있으면 index로 보내기 
	response.sendRedirect("../main/index.jsp");
	return;
}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<style type="text/css">
#container{ width: 800px; min-height:800px; margin: 0px auto}
.btnLoc{margin-top: 50px; margin-bottom: 50px; text-align: center}
.inputTd{margin-left: 20px}
.label{margin-top: 20px}
.name{width: 120px;}
.nameL{width: 120px; margin-left: 20px}
.dupBtn{margin-left: 20px}
.id{width: 220px}
.pass{width: 220px; margin-top: 20px}
.email{width: 220px; margin: 0px auto}
.year{width: 100px;}
.day{width: 70px; margin-left: 10px}
.num{width: 200px; margin-left: 10px}
.country{width: 150px; margin-left: 10px}
.type{width: 100px}
.radio{margin-left: 20px}
.gender{margin-left: 30px}
.detail{margin-left: 5px; font-size: 12px}
#joinBox{width:600px; margin: 0px auto ;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
	$("#dupIdBtn").click(function dupId() {
		var top=window.screenY+200;
		var left=window.screenX+100;
		window.open("dup_id.jsp","id","width=480,height=150,resizeable=no, top="+top+",left="+left);
	});//click

	$("#dupEmailBtn").click(function dupEmail(){
		var top=window.screenY+200;
		var left=window.screenX+100;
		window.open("dup_email.jsp","email","width=750,height=150,resizeable=no, top="+top+",left="+left);
	});
		
	$("#passCheck").keyup(function(evt){
	 	if( evt.which != 13 ){
		chkConfirmPass();
		}//end if
	});//keyup
		
	$("#joinBtn").click(function() {
		
		if($("#korName1").val().trim()==""){
			alert("국문이름을 입력해주세요");
			$("#korName1").focus();
			return;
		}
		
	      if($("#korName1").val().replace(/[ㄱ-힣]/g, "") != ""){
	          alert("국문이름은 한글만 가능합니다");
	          $("#korName1").val("");
	          return;
	       }
		
		if($("#korName2").val().trim()==""){
			alert("국문이름을 입력해주세요");
			$("#korName2").focus();
			return;
		}
	      if($("#korName2").val().replace(/[ㄱ-힣]/g, "") != ""){
	          alert("국문이름은 한글만 가능합니다");
	          $("#korName2").val("");
	          return;
	       }

		if($("#engName1").val().trim()==""){
			alert("영문이름을 입력해주세요");
			$("#engName1").focus();
			return;
		}
	      if($("#engName1").val().replace(/[A-Z]/g, "") != ""){
	          alert("영문이름을 영어(대문자)만 가능합니다");
	          $("#engName1").val("");
	          return;
	       }
	      
		if($("#engName2").val().trim()==""){
			alert("영문이름을 입력해주세요");
			$("#engName2").focus();
			return;
		}
		
		if($("#engName2").val().replace(/[A-Z]/g, "") != ""){
	          alert("영문이름을 영어(대문자)만 가능합니다");
	          $("#engName2").val("");
	          return;
	       }
		
		if($("#id").val().trim()==""){
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return;
		}
		
		if($("#pass").val().trim()==""){
			alert("비밀번호를 입력해주세요");
			$("#pass").focus();
			return;
		}
		
	      if($("#pass").val().replace(/[0-9A-Za-z]/g, "") != ""){
	          alert("비밀번호는 숫자 또는 영문(대,소문자)만 가능합니다.");
	          $("#pass").val("");
	          return;
	       }
	
		if($("#passCheck").val().trim()==""){
			alert("비밀번호 확인칸을 입력해주세요");
			$("#passCheck").focus();
			return;
		}
		
			var pass = ($("#pass").val());
			var passCheck = ($("#passCheck").val());
			
		if(pass!=passCheck){
			alert("비밀번호화 비밀번호확인이 일치하지 않습니다.");
			return;
		}
		
		if($("#email").val().trim()==""){
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return;
		}
		
		if($("#birthYear option:selected").text()==""){
			alert("생년월일을 입력해주세요");
			return;		
		}
		
		if($("#birthMonth option:selected").text()==""){
			alert("생년월일을 입력해주세요");
			return;		
		}
		
		if($("#birthDay option:selected").text()==""){
			alert("생년월일을 입력해주세요");
			return;		
		}
		
		if($("input:radio[name='gender']").is(":checked")==false){
			alert("성별을 선택해주세요");
			return;
		}
		
		if($("#phoneType option:selected").text()==""){
			alert("연락처 유형을 선택해주세요");
			return;
		}
		
		if($("#phoneCountry option:selected").text()==""){
			alert("국가번호를 선택해주세요");
			return;
		}
		if($("#phoneNum").val().trim()==""){
			alert("연락처를 입력해주세요");
			return;
		}
		
		if($("#phoneNum").val().replace(/[0-9]/g, "") != ""){
	          alert("연락처는 숫자만 입력 가능합니다.");
	          $("#phoneNum").val("");
	          return;
	       }
		
		$("#joinFrm").submit();
		
		});//click
	
});//ready

function chkConfirmPass(){
	if( $("#pass").val() == $("#passCheck").val() && $("#passCheck").val() != '' ){ //새 비밀번호와 비밀번호 확인란이 일치하고 비밀번호 확인란이 비어있지 않으면
		$("#passCheck").prop('class','form-control is-valid'); //폼 색깔을 초록색으로 설정
		$("#cpIFeedback").css('display','none'); //경고문구 숨기기
		$("#cpVFeedback").css('display','inline-block'); //일치문구 보여주기
	}else{
		$("#passCheck").prop('class','form-control is-invalid'); //폼 색깔을 빨간색으로 설정
		$("#cpIFeedback").css('display','inline-block'); //경고문구 보여주기
		$("#cpVFeedback").css('display','none'); //일치문구 숨기기
	}//end else
}//chkConfirmPass

</script>
</head>
<body>
<div id="wrap">
      <div id="header">
       <jsp:include page="../common/jsp/header.jsp"></jsp:include>
   </div>
      
      <div class="text-center" style="margin-top: 40px;">
      <img src="../common/images/member/welcome.png">
      </div>
      <div id="container" >
    	<form id="joinFrm" method="post" action="join_result.jsp">
      <div id="joinBox">
      
     <div class="label">
      <label for="inputKor"><strong>성명 (국문)*</strong><span class="detail">&nbsp;한글만 입력 가능합니다.</span></label>
      <table class="inputTd">
		<tr>
		<td>
	    <input type="text" class="form-control name" placeholder="이름" name="korName1" id="korName1" > 
		</td>
		<td>
	    <input type="text" class="form-control nameL" placeholder="성" name="korName2" id="korName2"> 
		</td>
		</tr>
		
      </table>
     </div>

	<div class="label">
      <label for="inputEng"><strong>성명(영문/여권명)*</strong><span class="detail">&nbsp;영문(대문자)만 입력 가능합니다.</span></label>
	<table class="inputTd">
	<tr>
	<td >
	    <input type="text" class="form-control name" placeholder="First Name" id="engName1" name="engName1" > 
	</td>
	<td>
	    <input type="text" class="form-control nameL" placeholder="Last Name" id="engName2" name="engName2" > 
	</td>
	</tr>
	</table>
	</div>		
	
		<div class="label">
	    <label for="inputId"><strong>아이디*</strong></label>
	    <table class="inputTd">
		<tr>
		<td>
	    <input type="text" class="form-control id" id="id" name="id" readonly="readonly" > 
		</td>
		<td>
	    <input type="button" class="btn btn-dark dupBtn" value="중복확인" id="dupIdBtn" > 
		</td>
		</tr>	    
	    </table>
		</div>	
		
	<div class="label">
    	<label for="inputPass"><strong>비밀번호*</strong><span class="detail">&nbsp;영문 또는 숫자만 입력 가능합니다.</span></label>
    	<table class="inputTd">
		<tr>
		<td>
    	<input type="password" class="form-control" name="pass" id="pass" placeholder="비밀번호를 입력해주세요">
		</td>
		</tr>
		<tr>
		<td>
    	<input type="password" class="form-control pass" id="passCheck" name="passCheck" placeholder="비밀번호 확인 입력창" >
    	 	<div id="cpIFeedback" class="invalid-feedback" style="display:none">비밀번호가 일치하지 않습니다.</div>
	     	<div id="cpVFeedback" class="valid-feedback" style="display:none">비밀번호가 일치합니다.</div>
		</td>
		</tr>    	
    	</table>
		</div>

	<div class="label">
	    <label for="inputEmail"><strong>이메일*</strong></label><br/>
	    <table class="inputTd">
	    <tr>
	    <td>
	   		<input type="text" class="form-control email" id="email" name="email" readonly="readonly" >
	    </td>
	    <td>
	    	<input type="button" class="btn btn-dark dupBtn" value="중복확인" id="dupEmailBtn"> 
	     </td>
	    </tr>
	    </table>
		</div>
				
		
			
	<div class="label">
      <label for="inputBirth"><strong>생년월일*</strong></label><br/>
	<table class="inputTd">
	<tr>
	<td>
		<select class="form-control year" id="birthYear" name="birthYear">
		<option value="" selected disabled>년도</option>
		<%
			int birthYear= 1900; 
    		int nowYear = Calendar.getInstance().get(Calendar.YEAR);
			for(; birthYear<nowYear+1; birthYear++){
		%>
		<option value="<%=birthYear%>"><%= birthYear %> </option>
		<%
			}//end for
		%>
		</select>
	</td>
	<td>	
		<select class="form-control day" id="birthMonth" name="birthMonth" >
		<option value="" selected disabled>월</option>
		<%
			for(int i=1; i<13; i++){
			int	birthMonth = i;  
		%>
		<option value="<%=birthMonth%>"><%= birthMonth %> </option>
		<%
			}//end for
		%>
		</select>
	</td>
	<td>
		<select class="form-control day" id="birthDay" name="birthDay" >
		<option value="" selected disabled>일</option>
		<%
    		
			for(int i=1; i<31; i++){
				int bitrhDay = i;
		%>
		<option value="<%=bitrhDay%>"><%= bitrhDay %> </option>
		<%
			}//end for
		%>
		</select>
	</td>
		</tr>
		</table>
		
	</div>
		
		<div class="label">
		<label><strong>성별*</strong></label><br/>
		
	<div class="form-check form-check-inline radio" >
  	<input class="form-check-input" type="radio" name="gender" id="M" value="M">
  	<label class="form-check-label" for="inlineRadio1">남</label>
	<div class="form-check form-check-inline">
 	 <input class="form-check-input gender" type="radio" name="gender" id="F" value="F">
	 <label class="form-check-label" for="inlineRadio2" >여</label>
	</div>
		</div>
		</div>
		
		<div class="label">
		<label><strong>연락처*</strong></label><span class="detail">&nbsp;숫자만 입력 가능합니다.</span><br/>
		<table class="inputTd">
		<tr>
		<td>
		<select class="form-control type" name="phoneType" id="phoneType">
			<option value="연락처" selected disabled>연락처</option>
			<option value="mobile">모바일</option>
			<option value="home">자택</option>
		</select>
		</td>		
		<td>
		<select class="form-control country" id="phoneCountry" name="phoneCountry">
			<option value="" selected disabled>국가번호</option>
			<option value="+82">대한민국(82)</option>
			<option value="+86">중국(86)</option>
			<option value="+966">사우디(966)</option>
		</select>
		</td>		
		<td>
			<input type="text" class="form-control num" id="phoneNum" name="phoneNum"  placeholder="번호를 입력해주세요">
		</td>		
		</tr>
		</table>
		</div>
      </div>
      	<div class="btnLoc">
     <button type="button" class="btn btn-dark" style="width:170px;" id="joinBtn">가입하기</button>
     <button type="button" class="btn btn-dark" style="width:170px;" id="cancleBtn" onclick="location.href='../main/index.jsp'">취소</button>
      </div>
    	</form>  
      </div>
      <div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
 </div>
</body>
</html>