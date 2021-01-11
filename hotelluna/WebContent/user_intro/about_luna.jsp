<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LUNA HOTEL</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
   
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/intro.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

<style type="text/css">
#desc_img {padding-bottom: 10px; margin:0px auto;}
.desc_img {width:800px;}
#desc_txt {font-family: 'Noto Serif KR', serif; line-height: 35px;}
</style>

<!-- Google CDN -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
   integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
   crossorigin="anonymous"></script></head>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container">
		<div id="sub_menu">
		  <jsp:include page="intro_submenu.jsp"></jsp:include>
		</div>
		<div id="content">
			<div id="sub_menu_title">
				ABOUT LUNA
			</div>
			
			<div id="description">
				<div id="desc_img"><img src="../common/images/intro/hotel.png" class="desc_img"/></div>
				<div id="desc_txt">
					<span>
						호텔 루나(HOTEL LUNA)은 대한민국 최대규모 호텔그룹입니다.<br />
						이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.<br />
					</span>
					<span>
						균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다.<br/>
						또한 호텔 루나만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다.<br/>
					</span>
					<span>
						호텔 루나에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다.
					</span>
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