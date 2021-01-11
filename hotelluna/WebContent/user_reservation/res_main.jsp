<%@page import="kr.co.sist.user.reservation.vo.RoomSearchVO"%>
<%@page import="kr.co.sist.user.reservation.vo.RoomSimpleVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.reservation.dao.ResDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="예약 메인 화면"
    %>
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
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" /> -->

<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../common/css/datepicker.css"> 
<style type="text/css">
.ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight{ background-color: #bebebe }
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active{ background-color: #172D40 }
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active{ color: #ffffff}
.form-control:disabled, .form-control[readonly] { background-color: #ffffff }

#from, #to{ width: 280px }
#room, #people{ width: 60px }

.wrapper1 {	display: flex;	justify-content: center; }
.div_res_select_bar { height: 200px; display: flex; align-items: center; }
.res_select_bar { margin : 0 20px 0 40px; }
.btn { background-color: #172D40; color: #ffffff; margin : 30px 20px 0 40px; }

.room_search_result{ width: 1000px; }

.card-body{  margin: 20px 0px 0px 0px; width: 1000px; display: flex; flex-direction:row; }
.card_img_div{ padding: 0px 0px 0px 20px }
.card_content{  margin: 0px 0px 0px 10px; width: 600px; position: relative; }
.card_content_header{ font-family: LotteMartHappy; font-size: 20pt; position: absolute; left: 50px; top: 0px }
.card_content_size{ font-family: LotteMartHappy; font-size: 10pt; position: absolute; left: 50px; top: 50px }
.card_content_detail{ margin: 0px 0px 0px 0px; position: absolute; left: 50px; top: 185px; }
.card_content_price{ font-family: LotteMartHappy; font-size: 20pt; position: absolute; left: 400px; top: 75px }
.card_content_day{  font-family: LotteMartHappy; font-size: 10pt; position: absolute; left: 440px; top: 115px }
.card_content_res{  margin: 0px 0px 0px 0px; position: absolute; left: 530px; top: 80px }

.modal_detail_div{ padding: 10px }
.modal_detail_content{ font-family: LotteMartHappy; font-size: 15pt; }
</style>
<script>

$( function() {
	var initDate=new Date();
	initDate.setDate(initDate.getDate()+1);
	var date=new Date();
	var date2=new Date();
	date2.setDate( date2.getDate()+1 );
	if("${param.checkin}"!="" && "${param.checkin}"!=null){
		date=new Date("${param.checkin}");
		date2=new Date("${param.checkout}");
	}
	initDate.setDate(date.getDate()+1);
	var dateFormat = "mm-dd-yy",
		from = $( "#from" ).datepicker({
			minDate : new Date(),
			numberOfMonths: 1,
			showOtherMonths: true,
			selectOtherMonths: true,
			changeYear: true,
			changeMonth: true
		})
		.on( "change", function() {
			var temp=new Date($("#from").datepicker( "getDate" ));
			temp.setDate(temp.getDate()+1);
			to.datepicker( "option", "minDate", temp );
		}),
		to = $( "#to" ).datepicker({
			minDate : initDate,
			numberOfMonths: 1,
			showOtherMonths: true,
			selectOtherMonths: true,
			changeYear: true,
			changeMonth: true,
		});
	$( "#from" ).datepicker( "setDate", date );
	$( "#to" ).datepicker( "setDate", date2 );
} );//ready
	
function resSearch(){
	var from=new Date($("#from").datepicker( "getDate" ));
	var to=new Date($("#to").datepicker( "getDate" ));
	var checkin=from.getFullYear()+"-"+(from.getMonth()+1)+"-"+from.getDate();
	var checkout=to.getFullYear()+"-"+(to.getMonth()+1)+"-"+to.getDate();
	var room=$("#room").val();
	var people=$("#people").val();
	
	var param="checkin="+checkin+"&"
				+"checkout="+checkout+"&"
				+"room="+room+"&"
				+"people="+people;
	$.ajax({
		url:"res_search_json.jsp",
		type:"post",
		async:true,
		data:param,
		dataType:"json",
		error:function(xhr){
			alert("에러 발생 : "+xhr.status);
		},
		success:function(json_arr){
			var output="";
			
			if(json_arr.length==0){
				output+="<div class='card card-body' style='width: 1000px'>";
				output+="예약 가능한 방이 없습니다.";
				output+="</div>";
			}//end if
			
			$.each(json_arr, function(i,json_obj){
				var roomName=json_obj.roomName;
				//룸 리스트
				output+="<form id='"+roomName+"Btn'action='res_info_confirm.jsp' method='post'>";
				output+="<input type='hidden' name='room_num' value='"+json_obj.roomNum+"'/>";
				output+="<input type='hidden' name='room_name' value='"+roomName+"'/>";
				output+="<input type='hidden' name='people' value='"+people+"'/>";
				output+="<input type='hidden' name='img1' value='"+json_obj.img+"'/>";
				output+="<input type='hidden' name='checkin' value='"+checkin+"'/>";
				output+="<input type='hidden' name='checkout' value='"+checkout+"'/>";
				output+="<input type='hidden' name='price' value='"+json_obj.price+"'/>";
				output+="</form>";
				
				output+="<div class='card card-body'>";
				output+="<div class='card_img_div'>";
				output+="<img src='../common/images/room/delluna1.png' style='width: 300px;'/>";
				//output+="<img src='../common/images/"+json_obj.img+"' style='width: 300px;'/>";
				output+="</div>";
				output+="<div class='card_content'>";
				output+="<span class='card_content_header'>"+json_obj.roomName+"</span><br/>";
				output+="<span class='card_content_size'>"+json_obj.roomSize+"m<sup>2</sup></span><br/>";
				output+="<input type='button' value='상세정보보기' class='btn btn-dark card_content_detail' data-toggle='modal' data-target='#staticBackdrop"+roomName+"'/><br/>";
				output+="<span class='card_content_price'>"+json_obj.price+"</span><br/>";
				output+="<span class='card_content_day'>1박기준</span>";
				output+="<input type='button' value='예약하기' id='"+roomName+"Btn' class='btn btn-dark card_content_res' onclick=\"resInfoConfirm('"+roomName+"')\"/><br/>";
				output+="</div>";
				output+="</div>";
				
				//룸 상세정보
				
				output+='<div class="modal" id="staticBackdrop'+json_obj.data.roomName+'" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">';
				output+='<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">';
				output+='<div class="modal-content">';
				output+='<div class="modal-header">';
				output+='<h5 class="modal-title" id="staticBackdropLabel">객실 상세 정보</h5>';
				output+='<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
				output+='<span aria-hidden="true">&times;</span>';
				output+='</button>';
				output+='</div>';
				output+='<div class="modal-body">';
				output+='<div style="height: 50px; text-align: center; padding-top: 5px">';
				output+='<span style="font-family: LotteMartHappy; font-size: 20pt;">'+json_obj.data.roomName+'</span><br/>';
				output+='</div>';
				
				output+='<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">';
				output+='<div class="carousel-inner">';
				//이미지반복
				output+='<div class="carousel-item active" data-interval="3000">';
				//output+='<img src="../common/images/room/'+json_obj.data.img+'" class="d-block w-100" alt="...">';
				output+='<img src="../common/images/room/delluna1.png" class="d-block w-100" alt="...">';
				output+='</div>';
				output+='<div class="carousel-item" data-interval="3000">';
				output+='<img src="../common/images/room/delluna2.png" class="d-block w-100" alt="...">';
				output+='</div>';
				output+='<div class="carousel-items" data-interval="3000">';
				output+='<img src="../common/images/room/delluna3.png" class="d-block w-100" alt="...">';
				output+='</div>\n';
				//이미지반복
				output+='</div>\n';
				output+='<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">\n';
				output+='<span class="carousel-control-prev-icon" aria-hidden="true"></span>\n';
				output+='<span class="sr-only">Previous</span>\n';
				output+='</a>\n';
				output+='<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">\n';
				output+='<span class="carousel-control-next-icon" aria-hidden="true"></span>\n';
				output+='<span class="sr-only">Next</span>\n';
				output+='</a>\n';
				output+='</div>\n';
				
				output+='<div class="modal_detail_div">';
				output+='<span class="modal_detail_content">Amenity</span><br/>';
				output+=json_obj.data.amenity+'<br/>';
				output+='<span class="modal_detail_content">Room Size</span><br/>';
				output+=json_obj.data.roomSize+'m<sup>2</sup><br/>';
				output+='<span class="modal_detail_content">Price (per day)</span><br/>';
				output+='&#8361;'+json_obj.data.price+'<br/>';
				output+='</div>';
				output+='</div>';
				output+='<div class="modal-footer">';
				output+='<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>';
				output+='</div>';
				output+='</div>';
				output+='</div>';
				output+='</div>';
				
			});//each
			
			$("#roomSearchResult").html(output);
		}
	});//ajax
};//resSearch

function resInfoConfirm(roomName){
	$("#"+roomName+"Btn").submit();
};//resInfoConfirm

</script>

</head>
<body>
<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	
	<div id="container">
	<div id="container_header" style="height: 200px; text-align: center; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
	<img src="../common/images/res/res_index1.png"/><br/>
	날짜, 인원 선택
	</div>
	
	<form name="resSearchFrm" id="resSearchFrm" action="res_main.jsp" method="get">
	<div class="wrapper1">
		<div id="res_select_bar" class="div_res_select_bar">
			<div class="res_select_bar">
			<label for="from">check in</label>
			<input type="text" class="form-control" id="from" name="checkin" readonly="readonly">
			</div>
			<div class="res_select_bar">
			<label for="to">check out</label>
			<input type="text" class="form-control" id="to" name="checkout" readonly="readonly">
			</div>
<!-- 			<div class="res_select_bar">
			<label for="room">room</label>
		    <select class="form-control" id="room" name="room">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
			</select>
			</div> -->
			<div class="res_select_bar">
			<label for="people">people</label>
		    <select class="form-control" id="people" name="people">
				<option>1</option>
				<option selected="selected">2</option>
				<option>3</option>
				<option>4</option>
			</select>
			</div>
			<input type="button" name="res_search_btn" id="res_search_btn" class="btn btn-dark" value="Search" onclick="resSearch()"/>
		</div>
	</div>
	</form>
	
	<!-- 검색 결과 -->
	<div class="wrapper1">
	<div id="roomSearchResult" class="room_search_result">
	<!-- 동적으로 보여줄 결과 -->
	<div class="card card-body" style="width: 1000px">
	예약을 원하시는 날짜와 인원을 선택해주세요.<br/>
	
	</div>
	<!-- 동적으로 보여줄 결과 -->
	
	</div>
	</div>
	
	</div>
	
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>