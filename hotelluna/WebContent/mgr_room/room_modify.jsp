<%@page import="kr.co.sist.mgr.room.vo.MgrRoomModifyVO"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.sist.mgr.room.vo.MgrRoomVO"%>
<%@page import="kr.co.sist.mgr.room.dao.MgrRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="룸 수정을 위한 jsp"
    %>
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
<title>룸수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" href="../common/css/common.css" >
<style type="text/css">
.sidemenu { vertical-align: middle; height:80px; font-size: 25px; font-family: 'LotteMartHappy';}
#menu td:hover{ color:#BF8D50 }
.content{ vertical-align: middle; height:5px; width:100px; font-size: 18px; font-family: 'LotteMartHappy'; }
@font-face {
  font-family: 'LotteMartHappy';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff') format('woff');
}
@font-face {
  font-family: 'LotteMartHappy';
  font-style: normal;
  font-weight: 700;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff') format('woff');
}
.lottemarthappy * {
 font-family: 'LotteMartHappy', sans-serif;
}
                     
	tr{ font:bold; width: 90px; height: 50px }
	table{ margin:0px auto }
                        
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
<%
	String roomName = request.getParameter("room_name");
	MgrRoomDAO mrDAO = MgrRoomDAO.getInstance();
%>
$(function(){
	$("#cancel").click(function(){
		location.href="../mgr_room/room_list.jsp";
	});
	
	$("#Upfile").change(function(){
// 		alert("변경됨");
		var filePath = $('#Upfile').val();
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1,filePath.length );
		var imagePath = "C:/DEV/workspace/lunahotel_server/WebContent/common/images/room/"+fileName;
		document.getElementById("imgValue").innerHTML = "<img src="+imagePath+">";
	});
});
function modifyRoom(){
	if($("#roomName").val()==""){
		alert("방 이름을 입력해주세요");
		$("#roomName").focus();
		return;
	}else if($("#roomCnt").val()==""){
		alert("방 개수를 입력해주세요");
		$("#roomCnt").focus();
		return;
	}else if($("#roomSize").val()==""){
		alert("방 크기를 입력해주세요");
		$("#roomSize").focus();
		return;
	}else if($("#price").val()==""){
		alert("가격을 입력해주세요");
		$("#price").focus();
		return;
	}else if($("#maxGuest").val()==""){
		alert("최대인원을 입력해주세요");
		$("#maxGuest").focus();
		return;
	}else if($("#amenity").val()==""){
		alert("어메니티를 입력해주세요");
		$("#roomCnt").focus();
		return;
	}else if($("#intro").val()==""){
		alert("방정보를 입력해주세요");
		$("#intro").focus();
		return;
	}else if($("#Upfile").val()==""){
		alert("이미지를 입력해주세요");
		return;
	}//end else
		alert("<%=roomName%>방이 변경되었습니다.");
	
	$("#Frm").submit();
}//addRoom

</script>
</head>
<body>
<div id="wrap">
	<div id="header">
			<jsp:include page="../common/jsp/header.jsp"/>
	</div>
	
	<%-- 파일 업로드 --%>
	<%

	MgrRoomModifyVO mrmVO = new MgrRoomModifyVO();
	
	try{
		String path="C:/DEV/workspace/lunahotel_server/WebContent/common/images/room";
		int maxSize = 1024 * 1024 *100;
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		String oriName = mr.getOriginalFileName("Upfile");
		String reName = mr.getFilesystemName("Upfile");
		
		String oriName2 = mr.getOriginalFileName("Upfile2");
		String reName2 = mr.getFilesystemName("Upfile2");
		
		String oriName3 = mr.getOriginalFileName("Upfile3");
		String reName3 = mr.getFilesystemName("Upfile3");
		
		String oriName4 = mr.getOriginalFileName("Upfile4");
		String reName4 = mr.getFilesystemName("Upfile4");
		
		String oriName5 = mr.getOriginalFileName("Upfile5");
		String reName5 = mr.getFilesystemName("Upfile5");
		
		mrmVO.setImg1(reName);
		mrmVO.setImg2(reName2);
		mrmVO.setImg3(reName3);
		mrmVO.setImg4(reName4);
		mrmVO.setImg5(reName5);
%>

	<%
	if(mr.getParameter("room_name")!=null && !"".equals(mr.getParameter("room_name"))){
		/*  */
		mrmVO.setRoomName(roomName);
		mrmVO.setRoomSize(mr.getParameter("roomSize"));
		mrmVO.setPrice(Integer.parseInt(mr.getParameter("price")));
		mrmVO.setMaxGuest(Integer.parseInt(mr.getParameter("maxGuest")));
		mrmVO.setAmenity(mr.getParameter("amenity"));
		mrmVO.setIntro(mr.getParameter("intro"));
		boolean flag = mrDAO.updateRoomInfo(mrmVO);
		if(flag) {
			System.out.print("수정되었습니다.");
		}
		
		response.sendRedirect("room_list.jsp");
		return;
	}
	%>
<%
	}catch(IOException ie){
		ie.printStackTrace();
		%>
		<%
	}//end catch
	%>
	
	<% 
		MgrRoomVO mrVO = mrDAO.selectRoomInfo(roomName);
	
	%>
	<div id="container" style="width:1800px; height:750px; margin:0px auto; margin-top: 10px; ">
	
		<jsp:include page="../common/jsp/mgr_menu.jsp" ></jsp:include>
		
		<%if(mrVO!=null ){ %>
		<div id="content" style="width:1200px; height:750px; float:left; margin-left: 100px">
		
	<div style="padding:40px; font-size: 30px" class="sidemenu" >룸 수정</div>
	<form id="Frm" action="room_modify.jsp?room_name=<%=roomName %>" method="post" enctype="multipart/form-data">
	<div>
	<table style="margin:0px auto; padding:5px ">
	<tr>
		<td class="content">방 이름 </td>
		<td><%=roomName %></td>
	</tr>
	<tr>
		<td class="content">방 개수</td>
		<td><%= mrVO.getRoomCnt() %></td>
	</tr>
	<tr>
		<td class="content">방 크기 </td>
		<td><input type="text" id="roomSize" size="7" name="roomSize" value="<%=mrVO.getRoomSize() %>"></td>
	</tr>
	<tr>
		<td class="content">가격 </td>
		<td><input type="text" id="price" size="10" name="price" value="<%=mrVO.getPrice() %>"><span class="content">원</span></td>
	</tr>
	<tr>
		<td class="content">최대 인원 </td>
		<td><input type="text" id="maxGuest" size="5" name="maxGuest" value="<%=mrVO.getMaxGuest() %>"><span class="content">명</span></td>
	</tr>
	<tr>
		<td class="content">어매니티</td>
		<td><textarea style="resize: none; width: 200px; height: 100px" id="amenity" name="amenity"><%=mrVO.getAmenity() %></textarea></td>
	</tr>
	<tr>
		<td class="content">룸소개</td>
		<td><textarea style="resize: none; width: 200px; height: 100px" id="intro" name="intro"><%=mrVO.getIntro() %></textarea></td>
	</tr>
	</table>
	</div>
	
	<div style="overflow:scroll; width:400px; height:200px; margin: 0px auto ">
	<span class="content">이미지</span>
		<div style="margin: 20px">
			<input type="file" id="Upfile" name="Upfile" style="width: 240px" class="btn btn-dark" value="<%=mrVO.getImg1()%>"/>
		</div>
		<span class="content">이미지2</span>
		<div style="margin: 20px">
			<input type="file" id="Upfile2" name="Upfile2" style="width: 240px" class="btn btn-dark"/>
		</div>
		<span class="content">이미지3</span>
		<div style="margin: 20px">
			<input type="file" id="Upfile3" name="Upfile3" style="width: 240px" class="btn btn-dark"/>
		</div>
		<span class="content">이미지4</span>
		<div style="margin: 20px">
			<input type="file" id="Upfile4" name="Upfile4" style="width: 240px" class="btn btn-dark"/>
		</div>
		<span class="content">이미지5</span>
		<div style="margin: 20px">
			<input type="file" id="Upfile5" name="Upfile5" style="width: 240px" class="btn btn-dark"/>
		</div>
	</div>
	
	
	
	
	<div style="margin: 0px auto; width : 300px; padding:45px">
	<input type="button" class="btn btn-dark" value="완료" onclick="modifyRoom()" style="width: 80px"id="complete" >
	<input type="button" class="btn btn-dark" value="취소" style="margin-right:10px; width: 80px" id="cancel">
	</div>
	</form>
		</div>
		<%}else{ %>
		잘못된 접근입니다.
		<%}//end else %>
	</div>
	
</div>
</body>
</html>