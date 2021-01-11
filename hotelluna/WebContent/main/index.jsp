<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);

.jejumyeongjo * { 
 font-family: 'Jeju Myeongjo', serif;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</head>
<body>
<div id="wrap">
	<div id="header">
		 <jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container">
		<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-interval="3000">
					<img src="../common/images/main/main_img1.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-interval="3000">
					<img src="../common/images/main/main_img2.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-interval="3000">
					<img src="../common/images/main/main_img3.png" class="d-block w-100" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		
		<div style="display: flex; justify-content: center; ">
		<ul class="list-unstyled" style="max-width: 1300px; padding-top: 100px; padding-bottom: 100px">
		  <li class="media" style="padding-top: 100px;">
		    <img src="../common/images/main/main_info_img1.jpeg" class="mr-3" alt="..." style="width: 500px;">
		    <div class="media-body" style="height:375px; padding-top: 70px; font-family: 'Jeju Myeongjo'">
		      <h5 class="mt-0 mb-1"><span style="font-weight: bold; font-style: italic; font-size: 30px">Swimming Pool of Luna</span></h5><br/>
		      	호텔 루나의 수영장은 부드러운 자연 채광이 드는 쾌적하고 깔끔한 실외 수영장으로 고객에게 편안한 휴식을 제공합니다.<br/><br/>
		 	     ※ 코로나19로 인한 정부의 방역지침 및 사회적 거리두기 시행으로 수용인원 제한이 있으니 이용시 참고 부탁 드립니다.<br/>
				※ 입장 시 마스크 착용 필수입니다.
		    </div>
		  </li>
		  <li class="media my-4" style="padding-top: 100px;">
		    <div class="media-body" style="height:375px; padding-top: 70px; font-family: 'Jeju Myeongjo'">
		      <h5 class="mt-0 mb-1"><span style="font-weight: bold; font-style: italic; font-size: 30px">The Park View of Luna</span></h5><br/>
		      	원목과 대리석의 자연 친화적 인테리어와 남산의 녹음이 어우러진 올 데이 다이닝 공간입니다. 라이브 키친에서 신선한 식재료로 즉석에서 조리한 음식을 맛볼 수 있습니다.<br/><br/>
		 	     ※ 코로나19로 인한 정부의 방역지침 및 사회적 거리두기 시행으로 수용인원 제한이 있으니 이용시 참고 부탁 드립니다.<br/>
				※ 입장 시 마스크 착용 필수입니다.
		    </div>
			<img src="../common/images/main/main_info_img2.jpeg" class="ml-3" alt="..." style="width: 500px;">
		  </li>
		</ul>
		</div>
	
	</div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>