<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String userId = (String)session.getAttribute("user_id");
if(userId == null) {
	response.sendRedirect("../user_member/login.jsp");
	return;
}

StringBuilder sb = new StringBuilder();
sb.append("1. 수집 이용 항목\r\n")
	.append("이메일주소, 연락처, 구매 및 예약내역, 아이디\r\n\r\n")
	.append("2. 수집 이용 목적\r\n")
	.append("문의 사항 게시글 관리\r\n\r\n")
	.append("3. 보유 이용 기간\r\n")
	.append("회원 탈퇴 시 까지\r\n\r\n")
	.append("※ 관련 법령에서 정한 별도 보유 기한이 있는 경우는 그에 따름.\r\n")
	.append("※ 위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 회원 가입 및 서비스 이용이 불가합니다.");
String agmText = sb.toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL - INQUIRIES</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/intro.css">
<!-- eng -->
<link href="https://fonts.googleapis.com/css2?family=Baloo+Tamma+2&family=Nova+Mono&family=Ropa+Sans&display=swap" rel="stylesheet">
<!-- ko -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<style type="text/css">
#mgr_email {text-align:right}
#frm_div {margin-top:10px;}
#faq_content {height:150px;}
#agmText {height:300px; overflow:hidden}
#buttons {height:150px}
.mgr-mail {font-family: 'Baloo Tamma 2', cursive;}
.prefix_mail {font-family: 'Noto Serif KR', serif;}
.form-control {resize: none;}
.agreement {font-family: 'Noto Serif KR', serif; text-align:left;}
.agreement_title{font-weight: bold; }
#content {width: 600px; margin: 0px auto;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	$("#registBtn").click(function() {
		var msg = chkNull();
		
		if(msg == null) {
			$("#faq_frm").submit();
		} else {
			alert(msg);
		}
		
	});
});

function chkNull() {
	if($("#req_type").val() == "none") {
		return "문의 유형을 선택해주세요.";
	}
	
	if($("#req_title").val() == null || "" == $("#req_title").val().trim()) {
		return "문의 제목을 작성해주세요.";
	} else if($("#req_title").val().length > 50){
		return "문의 제목은 최대 50자(100byte)까지 입력 가능합니다.";
	}
	
	if($("#faq_content").val() == null || "" == $("#faq_content").val().trim()) {
		return "문의 내용을 작성해주세요.";
	}
	
	if(!$("#chkAgree").is(":checked")) {
		return "개인정보 수집 및 이용에 관한 사항 약관에 동의해주세요.";
	}
}
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container">
		<div id="content">
			<div id="sub_menu_title">
				<img src="../common/images/faq/faq.png" />
			</div>
			<div id="mgr_email">
				<span class="prefix_mail">담당자 연락처:</span><span class="mgr-mail">hmzzang@luna.com</span> 
			</div>
			<div id="frm_div">
				<form id="faq_frm" method="post" action="user_inq_process.jsp">
				  <div class="form-group row">
				    <label class="col-sm-2 col-form-label">문의 유형</label>
				    <div class="col-sm-10">
				    	<select id="req_type" name="req_type" class="custom-select">
						  <option value="none" selected>선택</option>
						  <option value="D">일반</option>
						  <option value="R">예약</option>
						</select>
				    </div>
				  </div>
				  <div class="form-group row">
				    <label class="col-sm-2 col-form-label">제목</label>
				    <div class="col-sm-10">
				      <input type="text" id="req_title" name="req_title" class="form-control" id="validationTooltip01">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label class="col-sm-2 col-form-label">내용</label>
				    <div class="col-sm-10">
				      <textarea class="form-control" id="faq_content" name="req_content"></textarea>
				    </div>
				  </div>
				  <div id="privacyAgreement" class="agreement">
				  	<div class="agreement_title">개인정보 수집 및 이용에 관한 사항<br /></div>
				  	<div class="agreement_content">
					  	<textarea class="form-control" readonly="readonly" id="agmText"><%=agmText %></textarea>
					  	<input type="checkbox" id="chkAgree" value="agree"> 동의함
				  	</div>
				  </div>
				  <div id="buttons">
				  	<button type="button" id="registBtn" class="btn btn-dark">등록</button>
				  </div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>