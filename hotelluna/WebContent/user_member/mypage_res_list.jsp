<%@page import="kr.co.sist.user.reservation.vo.MemberResListVO"%>
<%@page import="kr.co.sist.user.reservation.dao.ResDAO"%>
<%@page import="kr.co.sist.user.faq.vo.ReqVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.faq.dao.ReqDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
   
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/intro.css">
<link rel="stylesheet" type="text/css" href="../common/css/mypage.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

<style type="text/css">
#desc_img {padding-bottom: 10px;}
#desc_txt {font-family: 'Noto Serif KR', serif; line-height: 35px;}

.page-item.active .page-link{ background-color: #172D40; border-color: #172D40; }
.page-link{ color: #172D40 }
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
   crossorigin="anonymous"></script>
</head>
<body>
<%
ResDAO rDAO=ResDAO.getInstance();
List<MemberResListVO> list=rDAO.selectResList(userId);
	
int totalCnt=list.size(); //총 게시물 수
int pageScale=5; //한 페이지에 5개 목록을 조회
int totalPage=(int)Math.ceil((double)totalCnt/pageScale); //총 페이지 수

String paramPage=request.getParameter("current_page"); //현 페이지번호 받아오기
if( paramPage==null || "0".equals(paramPage) || "".equals(paramPage)){
	paramPage="1";
}//end if
int tempNum = 1;
try {
	tempNum = Integer.parseInt(paramPage);
} catch(NumberFormatException nfe) {
}

int currentPage = tempNum;

int startNum=(currentPage-1)*pageScale+1; //현 페이지 게시물 시작번호
int endNum=startNum+pageScale-1; //현 페이지 게시물 끝번호
if(endNum>totalCnt){
	endNum=totalCnt;
}//end if

//MgrReqListVO mrlVO = new MgrReqListVO(startNum, endNum);
//List<MgrReqVO> reqList = mrDAO.selectSearchReq(mrlVO);

int pageRange=10; //페이지번호 10개씩 조회
int startPage=((currentPage-1)/pageRange)*pageRange+1; //시작 페이지번호
int endPage=startPage+pageRange-1; //끝 페이지번호
int prePage=0; //"이전"을 눌렀을 때 나올 페이지
int nextPage=0; //"다음"을 눌렀을 때 나올 페이지

if( totalPage<endPage ){ //총 페이지 수가 끝 페이지 번호가 되도록 조정
	endPage=totalPage;
}//end if
	
String isPreActive="disabled"; //"이전" 버튼 활성화상태를 저장하는 문자열
String isNextActive="disabled"; //"다음" 버튼 활성화상태를 저장하는 문자열
if( currentPage>pageRange ){ //"이전" 버튼 활성화하는 조건
	isPreActive="active";
	prePage=((currentPage-1)/pageRange)*pageRange;
}//end if
if( totalPage>endPage ){ //"다음" 버튼 활성화하는 조건
	isNextActive="active";
	nextPage=prePage+pageRange+1;
}//end if
%>
<div id="wrap">
	<div id="header">
		<jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container">
	
	<div id="sub_menu">
		<jsp:include page="mypage_submenu.jsp"></jsp:include>
	</div>
	
	
	<div id="content">
	
	<div id="boardDiv">
	<div class="text-center" style="height: 200px; padding-top: 80px; font-family: LotteMartHappy; font-size: 30pt">
		예약조회<br/>
	</div>
	
	<form action="" method="post">
		<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">예약번호</th>
				<th scope="col">룸 이름</th>
				<th scope="col">체크인</th>
				<th scope="col">체크아웃</th>
			</tr>
		</thead>
		<tbody>
		<%
			//String resNum, String roomName, String checkIn, String checkOut, String requirements
				MemberResListVO mrlVO=null;
				for(int i=startNum-1; i<endNum; i++){
					mrlVO=list.get(i);
		%>
			<tr style="cursor: pointer;" onclick="location.href='mypage_res_detail.jsp?current_page=<%= paramPage %>&res_num=<%= mrlVO.getResNum() %>'">
				<td><%= mrlVO.getResNum() %></td>
				<td><%= mrlVO.getRoomName() %></td>
				<td><%= mrlVO.getCheckIn() %></td>
				<td><%= mrlVO.getCheckOut() %></td>
			</tr>
		<%
		}//end for
		if(mrlVO==null){
		%>
			<tr>
				<td colspan="4">예약 내역이 없습니다.</td>
			</tr>
		<%
		}//end if
		%>
		</tbody>
		</table>
	</form>
	</div>
	
	<!-- pagenation -->
	<div style="margin-top: 150px">
		<nav aria-label="...">
			<ul class="pagination justify-content-center">
			<% if(currentPage>pageRange){ //"이전"버튼 생성 조건 %>
			<li class="page-item <%= isPreActive %>">
				<a class="page-link" href="mypage_res_list.jsp?current_page=<%= prePage %>" tabindex="-1" aria-disabled="true">이전</a>
			</li>
			<% }//end if %>
			<%
			String isCurrent=""; //현재 페이지인지 판단하는 문자열
			currentPage=startPage;
			while(currentPage<=endPage){
				if(currentPage==Integer.parseInt(paramPage)){
					isCurrent="active";
				}else{
					isCurrent="";
				}//end else
			%>
			<li class="page-item <%= isCurrent %>">
	    		<a class="page-link" href="mypage_res_list.jsp?current_page=<%= currentPage %>"><%= currentPage %></a>
	    	</li>			    		
			<%
				currentPage++;
			}//end while %>
			<% if( totalPage > endPage ){ //"다음"버튼 생성 조건 %>
			<li class="page-item <%= isNextActive %>">
				<a class="page-link" href="mypage_res_list.jsp?current_page=<%= nextPage %>">다음</a>
			</li>
			<% }//end if %>
			</ul>
		</nav>
	</div>
	
	</div>
	</div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>