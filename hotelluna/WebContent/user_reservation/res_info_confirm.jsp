<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String userId=(String)session.getAttribute("user_id");
if((userId==null || "".equals(userId))){
	response.sendRedirect("../user_member/login.jsp");
}//end if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<style type="text/css">

.card{ max-width: 1000px; margin-bottom: 30px; border: 1px solid #172D40 }
.wrapper1{ display: flex; justify-content: center; margin-top: 30px }
.card-header{ border-bottom: 1px solid #172D40 }
.card-body{ display: flex; }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	$("#resBtn").click(function() {
		$("#resResultFrm").submit();
	});//click
});//ready
</script>
</head>
<body>
<%
String checkin=request.getParameter("checkin");
String checkout=request.getParameter("checkout");
SimpleDateFormat sdf=null;
Date end=null;
Date start=null;
int day=0;

try{
	sdf=new SimpleDateFormat("yyyy-mm-dd");
	
	start=sdf.parse(checkin);
	end=sdf.parse(checkout);
	
	long gap=start.getTime()-end.getTime();
	day= (int)(gap / (24*60*60*1000));
	day=Math.abs(day);
	
}catch(ParseException pe){
	pe.printStackTrace();
}//end catch

int price=Integer.parseInt(request.getParameter("price"));
int tax=(int)(price*day*0.21);
int totalPrice=price*day+tax;
//roomnum 얻어야함
%>
<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"/>
	</div>
	<div id="container">
	
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	<img src="../common/images/res/res_index2.png"/><br/>
	예약 정보 확인
	</div>
	
	<div id="notice" style="width: "></div>
	<div id="cancelAndRefund"></div>
	
	<div class="wrapper1">
	<div>
	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="notice">
				유의사항
			</div>
    		<div class="collapse show">
				<div class="card-body" style="font-size: 9pt">
[호텔 이용안내]<br/>
요금에는 부가가치세 10% 및 봉사료 10% (합계21%)가 부과됩니다.<br/>
기준 인원을 초과하여 투숙 시 추가 인원에 대해 별도의 요금이 부과됩니다.<br/>
추가 인원에 대한 기본 요금(세금 및 봉사료 별도)은 성인 5만원, 어린이 3만원이며, 객실 타입 및 패키지 혜택에 따라 상이합니다.<br/>
(성인 기준: 만 13세 이상, 어린이 기준: 37개월 이상~만 12세 이하)<br/>
37개월 미만의 유아 동반 시 추가 인원 요금 및 조식은 무료이며, 유아(37개월 미만)동반 여부는 체크인 시 프런트 데스크 직원에게 알려 주셔야 무료로 이용 가능합니다.<br/>
체크인은 오후 2시부터이며 체크아웃은 정오 11시까지입니다.<br/>
체크인 시 등록카드 작성 및 투숙객 본인 확인을 위해 본인 사진이 포함된 신분증을 반드시 제시해 주시기 바랍니다.<br/>
본 홈페이지 요금은 할인 적용된 요금이며, 카드사 할인 등의 중복 할인 혜택이 적용되지 않습니다.<br/>
어린이 동반 고객을 위한 영유아 용품(아기 욕조, 아기 침대, 어린이 베개 및 아동용 배스로브와 슬리퍼)은 객실예약과를 통해 사전 요청 가능하며, 이용 상황에 따라 조기 마감될 수 있습니다.<br/>
(단, 유모차는 현장에서만 대여 가능합니다.)<br/>
대출 요청이 완료된 영유아 용품, 엑스트라 베드는 체크인 당일 18시까지 객실에 준비해 드립니다.<br/>
자세한 객실안내는 객실예약과(02-2230-3310)로 문의 바랍니다.<br/>
[부대시설 이용안내]<br/>
체련장(Gym), 실내 수영장, 실내 사우나(유료시설)는 매월 3번째 수요일 정기휴무입니다.<br/>
체련장은 만 16세 이상, 실내 사우나는 만 13세 이상부터 이용 가능합니다.<br/>
실내 수영장은 성인 고객 전용 시설로, 만 13세 미만 고객은 주말 및 공휴일에 한해 성인 보호자의 보호 하에 이용 가능합니다.<br/>
야외 수영장인 어번 아일랜드는 유료시설로서 입장 혜택이 포함된 상품 외에는 이용 시 입장료가 추가로 부과되며 사전 예약은 불가합니다.<br/>
쾌적하고 안전한 운영을 위해 적정 인원 초과 시 입장이 제한될 수 있습니다.<br/>
2020년 어번 아일랜드(야외 수영장) 운영 기간 : 3월 14일 ~ 10월 31일 실내 및 야외 수영장의 성인풀에서는 신장 140cm 미만인 고객은 성인 보호자의 보호 하에 구명조끼 착용 시에만 이용 가능합니다.<br/>
성인풀, 키즈풀 및 자쿠지 등의 시설 이용 시 현장 라이프 가드 직원의 안내를 받으시기 바랍니다.<br/>
				</div>
			</div>
		</div>
		</div>
		<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				취소 및 환불규정
			</div>
    		<div class="collapse show">
				<div class="card-body" style="font-size: 9pt">
취소/변경 및 노쇼(No-show) 안내<br/>
숙박 예정일 1일 전 18시까지는 위약금 없이 취소 및 변경이 가능합니다.<br/>
숙박 예정일 1일 전 18시 이후 취소/변경 및 노쇼(No-show) 발생 시,<br/>
- 성수기(5월~10월, 12월 24일~31일) : 최초 1일 숙박 요금의 80%가 위약금으로 부과됩니다.<br/>
- 비수기(성수기 외 기간) : 최초 1일 숙박 요금의 10%가 위약금으로 부과됩니다.<br/>
				</div>
			</div>
		</div>
		</div>
		<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				예약 정보
			</div>
			<form id="resResultFrm" action="res_result.jsp" method="post">
			<div class="card-body">
				<input type="hidden" name="checkin" value="<%= request.getParameter("checkin") %>"/>
				<input type="hidden" name="checkout" value="<%= request.getParameter("checkout") %>"/>
				<input type="hidden" name="room_name" value="<%= request.getParameter("room_name") %>"/>
				<input type="hidden" name="room_num" value="<%= request.getParameter("room_num") %>"/>
				<input type="hidden" name="total_price" value="<%= totalPrice %>"/>
				<input type="hidden" name="people" value="<%= request.getParameter("people") %>"/>
				
				<div style="width: 250px;padding: 0px 0px 0px 20px">
				<img src="../common/images/room/<%= request.getParameter("img1") %>" style="width: 200px;"/><br/>
				<div style="font-weight: bold; font-size: 12pt; line-height: 1.7">
				객실 <%= request.getParameter("room_name") %><br/>
				투숙인원 <%= request.getParameter("people") %>명<br/>
				체크인 예정시간 14시<br/>
				체크아웃 예정시간 11시<br/>
				</div>
				<div style="margin-top: 5px; font-size: 9pt; ">
				선택 가능한 시간대 외에 체크인하실 경우 별도의 요금이 추가될 수 있으며, 관련 문의사항은 객실예약(02-2230-3310)으로 연락해 주시기 바랍니다.
				</div>
				</div>
				
				<div style="margin: 0px 0px 0px 10px; width: 600px; position: relative;">
				<div style="min-height: 300px; width: 600px;padding-left: 50px;">
				<span style="font-size: 15pt; /* position: absolute; left: 0px; top: 0px */">
				체크인-체크아웃<br/>
				<%= request.getParameter("checkin") %>-<%= request.getParameter("checkout") %> (<%= day %>박)<br/>
				</span>
				<span style="font-size: 13pt; /* position: absolute; left: 0px; top: 70px */">
				요금상세 (<%= day %>박)<br/>
				</span>
				<span style="font-size: 11pt; /* position: absolute; left: 0px; top: 100px */">
				객실요금&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<%= price*day %>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				부가가치세 및 봉사료&nbsp; &nbsp; &nbsp; &nbsp; <%= tax %><br/>
				</span>
				<%
				Calendar cal=Calendar.getInstance();
				cal.setTime(start);
				for(int i=0; i<day; i++){
				%>
				<span style="font-size: 11pt; /* position: absolute; left: 0px; top: 100px */">
				<%= sdf.format(cal.getTime()) %>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<%= price %><br/>
				</span>
				<%
					cal.add(Calendar.DATE, 1);
				}//end for %>
				<div style="ont-size: 11pt;">
				추가 요청 사항
				</div>
				<textarea name="req" placeholder="공항 교통편 문의 또는 호텔 이용시 문의하실 사항이 있으시면 입력해 주십시오." style="width: 550px; height: 100px; resize: none"></textarea>
				</div>
				<div>
				<div style="width: 600px; font-weight: bold; font-size: 12pt; line-height: 1.7; text-align: right;">
				요금합계 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <%= totalPrice %>
				&nbsp; &nbsp; 
				<input type="button" id="resBtn" value="예약" class="btn btn-dark"/><br/>
				<span style="font-weight: normal; font-size: 9pt">* 부가가치세 10% 및 봉사료 10%(합계 21%)가 포함된 금액입니다.</span>
				</div>
				</div>
				</div>
			
			</div>
			</form>
		</div>
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