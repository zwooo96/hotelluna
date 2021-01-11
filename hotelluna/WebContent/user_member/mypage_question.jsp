<%@page import="kr.co.sist.user.faq.vo.ReqVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.faq.dao.ReqDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userId = (String)session.getAttribute("user_id");
if(userId == null || "".equals(userId)) {
	response.sendRedirect("../main/index.jsp");
	return;
}
ReqDAO rDAO = ReqDAO.getInstance();
List<ReqVO> reqList = rDAO.selectMyReqList(userId);
int totalCnt = 1;
int pageScale=5; //한 페이지에 5개 목록을 조회
int totalPage = 0;
int currentPage = 1;
int startNum = 1;
int endNum = 1;

int pageRange=1; //페이지번호 10개씩 조회
int startPage=((currentPage-1)/pageRange)*pageRange+1; //시작 페이지번호
int endPage=startPage+pageRange-1; //끝 페이지번호
int prePage=0; //"이전"을 눌렀을 때 나올 페이지
int nextPage=0; //"다음"을 눌렀을 때 나올 페이지
String paramPage = "0";

String isPreActive="disabled"; //"이전" 버튼 활성화상태를 저장하는 문자열
String isNextActive="disabled"; //"다음" 버튼 활성화상태를 저장하는 문자열

if(reqList == null || reqList.isEmpty()) {
// 	response.sendRedirect("../main/index.jsp");
// 	return;
} else {
	pageRange=10;
	totalCnt = reqList.size(); //총 게시물 수
	totalPage=(int)Math.ceil((double)totalCnt/pageScale); //총 페이지 수

	paramPage = request.getParameter("page_num"); //현 페이지번호 받아오기
	if( paramPage==null || "0".equals(paramPage) || "".equals(paramPage)){
		paramPage="1";
	}//end if
	int tempNum = 1;
	try {
		tempNum = Integer.parseInt(paramPage);
	}catch(NumberFormatException nfe) {
	}
	currentPage = tempNum;

	startNum=(currentPage-1)*pageScale+1; //현 페이지 게시물 시작번호
	endNum=startNum+pageScale-1; //현 페이지 게시물 끝번호
	if(endNum>totalCnt){
		endNum=totalCnt;
	}//end if

	if( totalPage<endPage ){ //총 페이지 수가 끝 페이지 번호가 되도록 조정
		endPage=totalPage;
	}//end if
		
	
	if( currentPage>pageRange ){ //"이전" 버튼 활성화하는 조건
		isPreActive="active";
		prePage=((currentPage-1)/pageRange)*pageRange;
	}//end if
	if( totalPage>endPage ){ //"다음" 버튼 활성화하는 조건
		isNextActive="active";
		nextPage=prePage+pageRange+1;
	}//end if
}


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
<script type="text/javascript">
$(function() {
	
});

function moveToDetail(req_num) {
	$("#req_num").val(req_num);
 	$("#boardFrm").submit();
}
</script>   
</head>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="../common/jsp/header.jsp"></jsp:include>
	</div>
	<div id="container">
		<div id="sub_menu">
		  <jsp:include page="mypage_submenu.jsp"></jsp:include>
		</div>
		<div id="content">
			<div id="sub_menu_title">
				문의사항
			</div>
			<div id="boardDiv">
				<form id="boardFrm" action="mypage_question_detail.jsp" method="post">
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col" class="q-type custom_class">문의유형</th>
					      <th scope="col">제목</th>
					      <th scope="col">입력 일시</th>
					      <th scope="col" class="q-reply">답변 여부</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<%
				  			for(int i = startNum-1; i < endNum; i++) {
				  				if(reqList == null || reqList.isEmpty()) {
				  					%><tr>
							      <td colspan="4">등록된 문의사항이 없습니다.</td>
							      </tr><%
				  				} else{
				  				ReqVO rVO = reqList.get(i); 
				  				%>
			  					<tr onclick="moveToDetail(<%=rVO.getReqNum()%>)">
							      <td><%=rVO.getReqType().equalsIgnoreCase("D")?"일반문의":"예약문의"%></td>
							      <td><%
								      String title = rVO.getReqTitle();
								      if(title.length() > 10) {
								    	  title = title.substring(0,10)+"...";
								      }
								      %><%=title %></td>
								  <td><%=rVO.getReqInputDate() %></td>
							      <td><%String flag = rVO.getReqFlag().toLowerCase();%><img src="../common/images/icons/<%=flag %>.png" /></td>
						    	</tr><%
				  				}
					  		}
					  	%>
					  </tbody>
					</table>
					<input type="hidden" name="req_num" id="req_num">
				</form>
				
				<!-- pagenation -->
				<div style="margin-top: 150px">
					<nav aria-label="...">
						<ul class="pagination justify-content-center">
						<% if(currentPage>pageRange){ //"이전"버튼 생성 조건 %>
						<li class="page-item <%= isPreActive %>">
							<a class="page-link" href="mypage_question.jsp?page_num=<%= prePage %>" tabindex="-1" aria-disabled="true">이전</a>
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
				    		<a class="page-link" href="mypage_question.jsp?page_num=<%= currentPage %>"><%= currentPage %></a>
				    	</li>			    		
						<%
							currentPage++;
						}//end while %>
						<% if( totalPage > endPage ){ //"다음"버튼 생성 조건 %>
						<li class="page-item <%= isNextActive %>">
							<a class="page-link" href="mypage_question.jsp?page_num=<%= nextPage %>">다음</a>
						</li>
						<% }//end if %>
						</ul>
					</nav>
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