<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#btn1 {
    	border-radius: 10px;
    	width: 100px;
    	height: 40px;
    	cursor: pointer;
    	text-align: center;
    	line-height: 40px;
    	border: 2px solid #29a2f7;
    	background-color: #29a2f7;
    	color: white;
    	font-size: 17px;
    	margin-left: 1240px;
    }
    #btn2 {
    	border-radius: 10px;
    	width: 80px;
    	height: 40px;
    	cursor: pointer;
    	text-align: center;
    	line-height: 40px;
    	border: 2px solid #29a2f7;
    	background-color: #29a2f7;
    	color: white;
    	font-size: 17px;
    }
    #btn3 {
    	border-radius: 10px;
    	width: 80px;
    	height: 40px;
    	cursor: pointer;
    	text-align: center;
    	line-height: 40px;
    	border: 2px solid #29a2f7;
    	background-color: white;
    	color: black;
    	font-size: 17px;
    }
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
    
        /* Modal Content/Box */
	.modal-content {
		background-color: #fefefe;
		margin: 10% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 40%; /* Could be more or less, depending on screen size */         
		height: 40%;                 
	}


</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/menubar.jsp"%>
	<%@ include file="/WEB-INF/views/electronicApproval/common/electronicApprovalAside.jsp" %>

	<section>
		
	<br>

	<div style="width:1030px; height:1px; background-color:gray; margin-left: 320px;"></div>

	<br>
	<div align="center"><p style="font-size: 30px;">기안문</p></div>
	
	<table border="1" style="margin-left: 1035px; border-collapse: collapse; border: 1px solid #c4c4c4;">
		<tr>
			<td rowspan="2" width="25px" height="70px" style="text-align:center; background-color: #e5e5e5;">결재</td>
			<td style="text-align:center; width: 90px; height: 20px; background-color: #e5e5e5;">기 안</td>
			<td style="text-align:center; width: 90px; height: 20px; background-color: #e5e5e5;">결 재</td>
			<td style="text-align:center; width: 90px; height: 20px; background-color: #e5e5e5;">결 재</td>
		</tr>
		<tr>
			<td height="80px" style="text-align:center;">이호정</td>
			<td height="80px" style="text-align:center;">홍길동</td>
			<td height="80px" style="text-align:center;">아무개</td>
		</tr>
	</table>
	<br>
	
	<table border="1" style="margin: auto; border-collapse: collapse; border-color: #c4c4c4;">
		<tr style="border-bottom: 1px solid #c4c4c4;">
			<Td width="220px" height="40px" style="background-color: #e5e5e5; text-align: center;">문  서  번  호</Td>
			<Td width="280px">&nbsp;&nbsp;20200810-0002</Td>
			<Td width="220px" style="background-color: #e5e5e5; text-align: center;">기  안  일  자</Td>
			<Td width="280px">&nbsp;&nbsp;2020/08/10</Td>
		</tr>
		<tr style="border-bottom: 1px solid #c4c4c4;">
			<Td height="40px" style="background-color: #e5e5e5; text-align: center;">기안자</Td>
			<Td>&nbsp;&nbsp;이호정</Td>
			<Td style="background-color: #e5e5e5; text-align: center;">기안부서</Td>
			<Td>&nbsp;&nbsp;영업기획팀</Td>
		</tr>
		<tr style="border-bottom: 1px solid #c4c4c4;">
			<Td height="40px" style="background-color: #e5e5e5; text-align: center;">참조자</Td>
			<Td></Td>
			<Td style="background-color: #e5e5e5; text-align: center;">열람자</Td>
			<Td></Td>
		</tr>
		<tr>
			<Td height="40px" style="background-color: #e5e5e5; text-align: center;">문서제목</Td>
			<Td colspan="3">&nbsp;&nbsp;회의록어쩌구웅앵</Td>
		</tr>
	</table>
	<Br>	

	<div style="margin-left: 330px; width: 1010px; height: 700px; border: 2px solid #c4c4c4;">
		<textarea readonly style="background:clear; width: 1006px; height: 650px; margin: auto; resize: none; background-color: transparent; border: none; margin-top: 20px;">
			 1. 제휴 제안을 위한 컨텐츠 샘플 방향 지정
			    - 운영방침 및 방향성 파악
			    - 적합 카테고리 선별 완료 (인사부서식 / 계약서서식 / 업무지원서식)
			
			 2. 컨텐츠 샘플 분류 작업
			    - 카테고리 별 적합 컨텐츠 분류
			    - 키워드 별 검색/조회수 데이터 비교 (8/20 오전까지 이호정 대리)
			    - 컨텐츠 샘플 최종 취합
			
			 3. 제안 샘플리스트 작성
			    - 제휴 제안 시 첨부할 샘플리스트 작성
			    - 샘플리스트를 바탕으로 구체적 제휴 업로드 방식 토의
		</textarea>
	</div>	
	<br><br>
		
	<p style="font-size: 20px; margin-left: 325px;">결재의견</p>	<br>
	<table border="1" style="margin: auto; border-collapse: collapse; border-color: #c4c4c4; text-align: center;">
		<tr style="background-color: #e5e5e5;">
			<td width="70px" height="40px">결재</td>
			<td width="130px">결재자</td>
			<td width="150px">부서</td>
			<td width="170px">기안일</td>
			<td width="480px">의견</td>
		</tr>
		<tr>
			<td height="35px">승인</td>
			<td>홍길동</td>
			<td>영업기획팀</td>
			<td>2020/08/10</td>
			<td>승인합니다</td>
		</tr>
		<tr>
			<td height="35px">승인</td>
			<td>아무개</td>
			<td>영업기획팀</td>
			<td>2020/08/10</td>
			<td>승인합니다~</td>
		</tr>
	</table>	
	<br>	
	<div id="btn1">결재</div>	

	<div id="myModal" class="modal">
 
      <!-- Modal content -->
	<div class="modal-content">
		<table border="1" style="margin: auto; border-collapse: collapse; border-color: #c4c4c4;">
			<tr>
				<td width="120px" height="40px" style="background-color: #e5e5e5; text-align: center;">결재처리</td>
				<td width="450px">
					&nbsp;&nbsp;&nbsp;<input type="radio" id="s" name=""><label for="s">&nbsp;승인</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="b" name=""><label for="b">&nbsp;반려</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="j" name=""><label for="j">&nbsp;전결</label>
				</td>
			</tr>
			<tr>
				<Td height="230px" style="background-color: #e5e5e5; text-align: center;">결재의견</Td>
				<Td><textarea style="resize: none; width: 450px; height:220px; background:clear; background-color: transparent; border: none;"></textarea></Td>
			</tr>
		</table>
		
		<table align="right">
			<tr>
				<Td><div id="btn2" onclick="">결재</div></Td>
				<Td><div id="btn3" onclick="close_pop();">취소</div></Td>
			</tr>
		</table>
	</div>
 
    </div>


		
	</section>

	<script type="text/javascript">

	$("#btn1").click(function() {
        $('#myModal').show();
	});
	//팝업 Close 기능
	function close_pop(flag) {
	     $('#myModal').hide();
	};


        
	</script>


</body>
</html>















