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
<title>약관 동의</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../common/css/common.css">
<link rel="stylesheet" type="text/css" href="../common/css/main.css">
<style type="text/css">
.termsBtn{margin-top:30px; margin-bottom:100px; }
.termsMain{margin-top: 20px; }
.termsPerson{margin-top: 50px; }
.title{margin-bottom: 10px}
.chk{margin: 0px auto;}
.content{overflow-x:hidden;overflow-y:auto; margin: 0 auto;}
.btn{width:170px;}
#container{width:1000px; min-height:650px; margin: 0px auto;}
#allCheck{margin-top: 30px}
#content{margin: 0px auto; text-align: center}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {

	$("#allChk").click(function() {
		if($("#allChk").is(":checked")){
			$("input[name='check']").prop("checked",true);
		}else{
			$("input[name='check']").prop("checked",false);
		}//end else
	});//click
	
	$("input[name='check']").click(function() {
		if($("input[name='check']:checked").length==2){
			$("#allChk").prop("checked",true);
		}else{
			$("#allChk").prop("checked",false);
		}//end else
	});//click
	
	$("#nextBtn").click(function() {
		if($("#check1").is(":checked" )==false){
			alert("약관에 모두 동의 해 주세요");
		return;
		
		}//end if
		if($("#check2").is(":checked" )==false){
			alert("약관에 모두 동의 해 주세요");
		return;
		}//end if
		
		location.href="join.jsp";
		});//click
});//ready
</script>

</head>
<body>
<div id="wrap">
   <div id="header">
       <jsp:include page="../common/jsp/header.jsp"></jsp:include>
   </div>
   <div id="container">
   	<div id="content">
      <div class="text-center" style="margin-top: 40px;">
      	<img src="../common/images/member/welcome.png">
      </div>
     <div class="termsMain" >
     	<div class="title"><strong>이용약관에 대한 동의 (필수)</strong></div>
      <div>
      
      <textarea name=terms class="content" cols=100 rows=8>
      
제1조 목적
이 약관은 ㈜호텔루나가 운영하는 홈페이지 (이하 "루나호텔 홈페이지"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리의무 및 책임사항을 규정함을 목적으로 합니다.

제2조 정의
1. "루나호텔 홈페이지"란 ㈜호텔루나가 재화 또는 용역(이하 "재화등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화 또는 용역 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
2. "이용자"란 "루나호텔 홈페이지"에 접속하여 이 약관에 따라 "루나호텔 홈페이지"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
3. '회원'이라 함은 "루나호텔 홈페이지"에 개인정보를 제공하여 회원등록을 한 자로서, "루나호텔 홈페이지"의 정보를 지속적으로 제공받으며, "루나호텔 홈페이지"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
4. '비회원'이라 함은 회원에 가입하지 않고 "루나호텔 홈페이지"가 제공하는 서비스를 이용하는 자를 말합니다.
제3조 약관 등의 명시와 설명 및 개정
1. "루나호텔 홈페이지"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 "루나호텔 홈페이지"의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
2. "루나호텔 홈페이지"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회,배송책임,환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
3. "루나호텔 홈페이지"는 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제에 관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에 관한 법률, 방문판매등에 관한법률, 소비자보호법, 관세법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
4. "루나호텔 홈페이지"는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기 화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "루나호텔 홈페이지"는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
5. "루나호텔 홈페이지"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지 기간내에 "루나호텔 홈페이지"에 송신하여 "루나호텔 홈페이지"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
6. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호 지침 및 관계법령 또는 상관례에 따릅니다.
제4조 서비스의 제공 및 변경
1. "루나호텔 홈페이지"는 다음과 같은 업무를 수행합니다.
① 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
② 구매계약이 체결된 재화 또는 용역의 배송
③ 기타 "루나호텔 홈페이지"가 정하는 업무
2. "루나호텔 홈페이지"는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
3. "루나호텔 홈페이지”가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
4. 전항의 경우 "루나호텔 홈페이지"는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "루나호텔 홈페이지"가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
제5조 서비스의 중단
1. "루나호텔 홈페이지"는 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
2. "루나호텔 홈페이지"는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "루나호텔 홈페이지"가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
3. 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "루나호텔 홈페이지"는 제8조에 정한 방법으로 이용자에게 통지하고 당초 "루나호텔 홈페이지"에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, "루나호텔 홈페이지"가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 "루나호텔 홈페이지"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
제6조 회원가입
1. 이용자는 무료로 "회원"에 가입할 수 있으며, "루나호텔 홈페이지"가 정한 가입 양식에 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
2. "루나호텔 홈페이지"는 제1항에 따라 회원가입을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 "회원"으로 등록합니다.
① 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "루나호텔 홈페이지"가 회원 재가입을 승낙한 경우는 예외로 합니다.
② 등록 내용에 허위, 기재누락, 오기가 있는 경우
③ 기타 회원으로 등록하는 것이 "루나호텔 홈페이지"의 기술상 현저히 지장이 있다고 판단되는 경우
3. 회원가입은 루나 패밀리 회원 기본 정책인 만 19세 이상인자에 한하며(만 19세 미만의 아동일 경우 가입 및 상품 주문시 소비자 보호지침 제 4조 3항 다에 의해 법정대리인의 사전동의서를 받아야 함), "루나호텔 홈페이지"에서는 19세 이상인 회원에 한하여 구매가 가능합니다.
4. 회원가입은 "루나호텔 홈페이지"의 승낙이 가입 신청한 이용자에게 도달한 때에 완료됩니다.
5. "회원"은 "루나호텔 홈페이지"에 등록한 회원정보에 변경이 있는 경우, 즉시 "루나호텔 홈페이지"에서 정하는 방법에 따라 해당 변경사항을 "루나호텔 홈페이지"에게 통지하거나 수정하여야 합니다. (타운 이용약관 내용)
▶ 루나호텔 회원가입 바로 가기
6. “루나호텔 홈페이지” 는 비회원도 재화 또는 용역의 구매를 하실 수 있도록 허용하고 있으며, 이 경우에도 개별 약관이나 특약이 없는 한 본 약관이 적용됩니다. 다만 회원가입을 전제로 한 서비스는 제공하지 않습니다.
제7조 회원 탈퇴 및 자격 상실 등
1. "회원"은 "루나호텔 홈페이지"에 언제든지 탈퇴를 요청할 수 있으며, "회원"이 탈퇴 요청을 하는 경우에는 "루나호텔 홈페이지"는 즉시 회원탈퇴에 필요한 조치를 취합니다.
2. "회원"이 다음 각 호의 사유에 해당하는 경우, "루나호텔 홈페이지"는 회원에 대하여 일정한 서비스의 이용을 제한하거나 일정기간 회원자격을 정지시킬 수 있습니다.
① 가입 신청시에 허위 내용을 등록한 경우
② "루나호텔 홈페이지"를 이용하여 구입한 재화 등의 대금, 기타 "루나호텔 홈페이지" 이용과 관련하여 회원이 부담하는 채무를 기일에 이행하지 않는 경우
③ 타인의 ID와 비밀번호 또는 그 개인정보를 도용한 경우
④ "루나호텔 홈페이지"의 화면에서 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
⑤ 제3자의 "루나호텔 홈페이지" 이용을 방해하는 등 전자상거래질서를 위협하는 경우
⑥ "루나호텔 홈페이지" 화면에 음란물을 게재하거나 음란사이트를 링크시키는 경우
⑦ "루나호텔 홈페이지"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
⑧ 기타 서비스 운영을 고의로 방해하는 행위를 하는 경우
3. "루나호텔 홈페이지"가 회원 자격을 제한/정지 시킨 후, 제2항의 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "루나호텔 홈페이지"는 회원자격을 상실 시킬 수 있습니다.
4. "루나호텔 홈페이지"가 회원자격을 상실 시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
      
      </textarea>
      <br/>
      	<div class="chk">
		    <input class="form-check-input agree" type="checkbox" value="F" id="check1" name="check">
			<label class="form-check-label agree" for="user_id_save"> 동의 </label>
      	</div>
      </div>
     </div>
      <div class="termsPerson">
      	<div class="title"><strong>개인정보 보호 수집, 이용에 대한 동의 (필수)</strong></div>
      		<div>
      			<textarea name=terms class="content" cols=100 rows=8>
   ㈜호텔루나(이하 “루나호텔”)는 루나호텔 고객의 개인정보를 매우 중요하게 생각하며, ‘개인정보 보호법’ 및 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’(이하 “정보통신망법”) 등 관계 법령을 준수하고 있습니다. 루나호텔은 본 개인정보 처리방침을 통하여 고객께서 제공하신 개인정보가 어떠한 목적과 방식으로 이용되고 있고, 루나호텔이 개인정보 보호를 위하여 어떤 조치가 취해지고 있는지 알려드립니다.

제1조 개인정보 수집범위 및 수집방법
1. 개인정보 수집범위
가. 루나호텔은 서비스 제공을 위하여 필요한 최소한의 범위 내에서 개인정보를 수집합니다.
나. 루나호텔은 고객의 기본적 인권 침해의 우려가 있는 민감한 개인정보(사상∙신념, 노동조합∙정당의 가입∙탈회, 정치적 견해 등)는 수집하지 않습니다.
2. 개인정보 수집방법
루나호텔은 다음과 같은 방법으로 개인정보를 수집합니다.

가. 홈페이지, 서면양식, 전화, 팩스를 통한 회원가입, 상담게시판, 경품행사 응모
나. 제휴사로부터의 제공
다. 회사 서비스 이용 시 생성된 결제정보, 포인트 거래정보 등 수집      
      </textarea>
					<br/>
    			<div class="chk" >
				    <input class="form-check-input agree" type="checkbox" value="F" id="check2" name="check">
					<label class="form-check-label agree" for="user_id_save"> 동의 </label>
     			</div>
      		</div>
      </div>
      	<div id="allCheck">
      		<input class="form-check-input" type="checkbox" value="F" id="allChk">
      		<label class="form-check-label" for="allChk">전체 동의</label>
      	</div>
      	<div class="termsBtn">
		  <button type="button" class="btn btn-dark btn" name="nextBtn" id="nextBtn">다음</button>
		  <button type="button" class="btn btn-dark btn" name="cancelBtn" id="cancelBtn" onclick="location.href='../main/index.jsp'">취소</button>
      	</div>
      </div>
   </div>
	<div id="footer">
		<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>