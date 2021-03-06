<%@page import="kr.co.sist.mgr.reservation.vo.MgrResListVO"%>
<%@page import="kr.co.sist.mgr.reservation.vo.MgrResSearchVO"%>
<%@page import="kr.co.sist.mgr.reservation.dao.MgrResDAO"%>
<%@page import="kr.co.sist.mgr.faq.dao.MgrReqDAO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.mgr.reservation.vo.MgrResVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String sessionId = (String)session.getAttribute("user_id");
if( !"admin".equals(sessionId) || sessionId == null ){
	response.sendRedirect("../main/index.jsp");
	return;
}//end if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>예약관리</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" href="../common/css/common.css" >
<style type="text/css">
.sidemenu { vertical-align: middle; height:80px; font-size: 25px; font-family: 'LotteMartHappy';}
#menu td:hover{ color:#BF8D50 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<style type="text/css">
.page-item.active .page-link{ background-color: #333 }
.page-link:hover, .page-link{ color:#333 }
.page-item.active .page-link{ border-color: #333 }
</style>
<script type="text/javascript">
$(function(){
	$("#search").click(function(){
		keywordChk();
	});//click
	
	$("#keyword").keydown(function(evt){
		if( evt.which == 13 ){
			keywordChk();
		}//end if
	})//keydown
});//ready

function keywordChk(){
	if( $("#keyword").val() != "" ){
		$("#searchFrm").submit();
	}//end if
}//keywordChk

</script>
</head>
<body>
<div id="wrap">
	<div id="header">
	<jsp:include page="../common/jsp/header.jsp"/>
	</div>
	
	<div id="container" style="width:1800px; height:750px; margin:0px auto; margin-top: 10px; ">
		<jsp:include page="../common/jsp/mgr_menu.jsp"/>
		
		<div id="content" style="width:1300px; height:750px; float:left; margin-left: 100px">
		
		<%
			String type = request.getParameter("type"); //검색타입 : id, 예약번호
			String  keyword  = "";
			if( request.getParameter("keyword") != null ){
				keyword = request.getParameter("keyword").trim(); //검색키워드
			}//end if
			MgrResSearchVO mrsVO = new MgrResSearchVO(type, keyword);
			
			MgrResDAO mrDAO = MgrResDAO.getInstance();
			int totalCnt = mrDAO.selectTotalCnt(mrsVO); //총 게시물 수
			
			int pageScale = 5; //한 페이지에 5개 목록을 조회
			
			int totalPage = (int)Math.ceil((double)totalCnt / pageScale); //총 페이지 수
			
			String paramPage = "1";
			int currentPage = 1;
			try{
				paramPage = request.getParameter("current_page"); //현 페이지번호 받아오기
				if( paramPage == null || "0".equals(paramPage) ){
					paramPage = "1";
				}//end if
				if(Integer.parseInt(paramPage) > totalPage){
					paramPage=String.valueOf(totalPage);
				}//end if
				currentPage = Integer.parseInt(paramPage);
			}catch(NumberFormatException nfe){
				nfe.printStackTrace();
			}//end catch
			int startNum = (currentPage-1)*pageScale+1; //현 페이지 게시물 시작번호
			int endNum = startNum*pageScale; //현 페이지 게시물 끝번호
			
			MgrResListVO mrlVO = new MgrResListVO(startNum, endNum);
		  	List<MgrResVO> resList = mrDAO.selectSearchList(mrsVO, mrlVO);
		  	
		  	int pageRange = 10; //페이지번호 10개씩 조회
		  	int startPage = ((currentPage-1)/pageRange)*pageRange+1; //시작 페이지번호
		  	int endPage = startPage+pageRange-1; //끝 페이지번호
		  	int prePage = 0; //"이전"을 눌렀을 때 나올 페이지
		  	int nextPage = 0; //"다음"을 눌렀을 때 나올 페이지
		  	
		  	if( totalPage < endPage ){ //총 페이지 수가 끝 페이지 번호가 되도록 조정
		  		endPage = totalPage;
		  	}//end if
		  	
		  	String isPreActive="disabled"; //"이전" 버튼 활성화상태를 저장하는 문자열
		  	String isNextActive="disabled"; //"다음" 버튼 활성화상태를 저장하는 문자열
		  	if( currentPage > pageRange ){ //"이전" 버튼 활성화하는 조건
		  		isPreActive="active";
		  		prePage  = ((currentPage-1)/pageRange)*pageRange;
		  	}//end if
		  	if( totalPage > endPage ){ //"다음" 버튼 활성화하는 조건
		  		isNextActive="active";
		  		nextPage = prePage+pageRange+1;
		  	}//end if
		  	
		%>		
		
		<div style="height:80px; font-size: 30px; font-family: 'LotteMartHappy'; margin-top: 70px; ">예약관리</div>
		
		<div>
		<div  style="float:right; width:400px;">
		  <form class="form-inline" id="searchFrm" name="searchFrm" method="get" action="res_list.jsp">
		  	<select size="1" style="margin-right: 20px" name="type" id="type">
		  		<option value="res_num"${ param.type eq 'res_num'?"selected='selected'":'' }>예약번호</option>
		  		<option value="id"${ param.type eq 'id'?"selected='selected'":'' }>아이디</option>
		  	</select>
		    <input class="form-control mr-sm-2" type="search" aria-label="Search" id="keyword" name="keyword" value="${ param.keyword } ">
		    <button type="button" class="btn btn-dark" id="search" name="search">검색</button>
		  </form>
		</div>
		<div style="clear: both;"></div>
		</div>
		
		<div style="height:300px; border:1px solid #ebebeb; margin-top: 20px">
			<table class="table table-hover" style="text-align: center;">
			  <thead class="thead-light">
			    <tr>
			      <th scope="col">예약번호</th>
			      <th scope="col">ID</th>
			      <th scope="col">체크인</th>
			      <th scope="col">체크아웃</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%
			  	MgrResVO mrVO = null;
			  	for(int i=0; i<resList.size(); i++) {
			  		mrVO = resList.get(i);
			  %>
			    <tr style="cursor: pointer;" onclick="location.href='../mgr_reservation/res_detail.jsp?current_page=<%= paramPage %>&res_num=<%= mrVO.getResNum() %>'">
			      <th scope="row"><%= mrVO.getResNum() %></th>
			      <td><%= mrVO.getId() %></td>
			      <td><%= mrVO.getCheckIn() %></td>
			      <td><%= mrVO.getCheckOut() %></td>
			    </tr>
			    <%
			    	}//end for
			    	if(resList.isEmpty()){
			    	%>
			    		<tr>
			    			<td colspan="4" style="text-align: center">예약정보가 존재하지 않습니다.</td>
			    		</tr>
			    	<%
			    	}//end if
			    %>
			  </tbody>
			</table>
		</div>
		
		<div style="margin-top: 150px">

			<nav aria-label="...">
			  <ul class="pagination justify-content-center">
			    <% if(currentPage > pageRange){ //"이전"버튼 생성 조건 %>
			    <li class="page-item <%= isPreActive %>">
			      <a class="page-link" href="res_list.jsp?current_page=<%= prePage %>" tabindex="-1" aria-disabled="true">이전</a>
			    </li>
			    <% }//end if %>
			    <%
			    	String isCurrent = ""; //현재 페이지인지 판단하는 문자열
			    	currentPage=startPage;
			    	while( currentPage <= endPage ){
			    		if( currentPage == Integer.parseInt(paramPage) ){
			    			isCurrent = "active";
			    		}else{
			    			isCurrent = "";
			    		}//end else
			    %>
			    		<li class="page-item <%= isCurrent %>">
				    	<a class="page-link" href="res_list.jsp?current_page=<%= currentPage %>"><%= currentPage %></a>
				    	</li>			    		
			    <%
			    	currentPage++;
			    }//end while %>
				<% if( totalPage > endPage ){ //"다음"버튼 생성 조건 %>
			    <li class="page-item <%= isNextActive %>">
			      <a class="page-link" href="res_list.jsp?current_page=<%= nextPage %>">다음</a>
			    </li>
			    <% }//end if %>
			  </ul>
			</nav>
		</div>
		
		</div>
		
	</div>
	
	
</div>
</body>
</html>