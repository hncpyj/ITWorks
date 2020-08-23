<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<title>ItWorks</title>
<link rel="icon" href="./resources/images/favicon.ico" type="image/x-icon">
<style>
	* {
        margin: 0px;
        font-family: "Noto Sans KR";
    }
    #fileAddBtn {
    	border-radius: 8px; 
    	background-color: #29a2f7; 
    	color: white; 
    	text-align: center; 
    	width: 100px; 
    	height: 30px; 
    	font-size: 15px;
    	line-height: 30px;
    	cursor: pointer;
    }
    .btn {
    	border-radius: 10px;
    	width: 100px;
    	height: 40px;
    	cursor: pointer;
    	text-align: center;
    	line-height: 40px;
    	border: 2px solid #29a2f7;
    	background-color: white;
    	color: black;
    	font-size: 17px;
    }
    .btn1 {
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
		width: 45%; /* Could be more or less, depending on screen size */         
		height: 50%;                 
	}
</style>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/menubar.jsp"%>
	<%@ include file="/WEB-INF/views/electronicApproval/common/electronicApprovalAside.jsp" %>
	
	<section>
	<br>
 	<table style="margin:auto;">
		<tr>
			<td><p style="color:#004771; font-size:30px; width:660px;">기안문 작성</p></td>
			<td width="90px"></td>
			<td width="230px"></td>
			<td width="10px"></td>
		</tr>
	</table>
	<br>
	
	<div>
		<div style="width:1030px; height:1px; background-color:gray; margin-left: 320px;"></div>
	</div>
	<br>
	<div align="center"><p style="font-size: 30px;">기안문</p></div>
	
	<table border="1" style="margin-left: 1220px; border-collapse: collapse; border: 1px solid #c4c4c4;">
		<tr>
			<td rowspan="2" width="25px" height="70px" style="text-align:center; background-color: #e5e5e5;">결재</td>
			<td style="text-align:center; width: 90px; height: 20px; background-color: #e5e5e5;">기 안</td>
		</tr>
		<tr>
			<td height="80px" style="text-align:center;">이호정</td>
		</tr>
	</table>
	<br>
	
	<table border="1" style="margin: auto; border-collapse: collapse; border-color: #c4c4c4;">
		<tr style="border-bottom: 1px solid #c4c4c4;">
			<Td width="220px" height="40px" style="background-color: #e5e5e5; text-align: center;">문  서  번  호</Td>
			<Td width="280px">&nbsp;&nbsp;자동채번</Td>
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
			<Td><img src="${ contextPath }/resources/images/electronicApprovalImg/plusBtn.png" style="margin-left: 255px; cursor: pointer;" id="cham" onclick=""></Td>
			<Td style="background-color: #e5e5e5; text-align: center;">열람자</Td>
			<Td><img src="${ contextPath }/resources/images/electronicApprovalImg/plusBtn.png" style="margin-left: 255px; cursor: pointer;" id="yeol" onclick=""></Td>
		</tr>
		<tr>
			<Td height="40px" style="background-color: #e5e5e5; text-align: center;">문서제목</Td>
			<Td colspan="3">&nbsp;&nbsp;회의록어쩌구웅앵</Td>
		</tr>
	</table>
	<Br>
	
	<!-- 참조자 모달 -->
	<div id="chamMo" class="modal">
    <!-- Modal content -->
	<div class="modal-content">
		<p style="font-size: 25px; margin-left: 20px; color: #29a2f7;">참조자 지정</p><Br>
		<table style="margin:auto; width: 600px; height: 280px;">
			<tr>
				<td width="270px"><div style="width: 270px; height: 280px; border: 1px solid #c4c4c4;"></div></td>
				<td width="60px">
					<img src="${contextPath }/resources/images/electronicApprovalImg/sendR.png" style="margin: auto; width: 40px;"><br>
					<img src="${contextPath }/resources/images/electronicApprovalImg/sendL.png" style="margin: auto; width: 40px;">
				</td>
				<td width="270px">
					<div style="width: 270px; height: 280px; border: 1px solid #c4c4c4;">
						<br>
						<table style="margin: auto; border: 1px solid #c4c4c4; border-collapse: collapse; text-align: left; width: 230px;" border="1">
							<tr height="40px">
								<Td>&nbsp;&nbsp;정다빈 기술지원팀</Td>
							</tr>
							<Tr height="40px">
								<Td>&nbsp;&nbsp;최재영 마케팅팀</Td>
							</Tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<table style="margin-left: 460px;">
			<tr>
				<Td><div class="btn1" onclick="" style="width: 70px;">적용</div></Td>
				<Td><div class="btn" id="reset" onclick="close_pop();" style="width: 70px;">취소</div></Td>
			</tr>
		</table>
	</div>
	</div>
	
	<!-- 열람자 모달 -->
	<div id="yeolMo" class="modal">
    <!-- Modal content -->
	<div class="modal-content">
		<p style="font-size: 25px; margin-left: 20px; color: #29a2f7;">열람자 지정</p><Br>
		<table style="margin:auto; width: 600px; height: 280px;">
			<tr>
				<td width="270px"><div style="width: 270px; height: 280px; border: 1px solid #c4c4c4;"></div></td>
				<td width="60px">
					<img src="${contextPath }/resources/images/electronicApprovalImg/sendR.png" style="margin: auto; width: 40px;"><br>
					<img src="${contextPath }/resources/images/electronicApprovalImg/sendL.png" style="margin: auto; width: 40px;">
				</td>
				<td width="270px">
					<div style="width: 270px; height: 280px; border: 1px solid #c4c4c4;">
						<br>
						<table style="margin: auto; border: 1px solid #c4c4c4; border-collapse: collapse; text-align: left; width: 230px;" border="1">
							<tr height="40px">
								<Td>&nbsp;&nbsp;최우아 기술지원팀</Td>
							</tr>
							<Tr height="40px">
								<Td>&nbsp;&nbsp;윤수경 경영지원팀</Td>
							</Tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<table style="margin-left: 460px;">
			<tr>
				<Td><div class="btn1" onclick="" style="width: 70px;">적용</div></Td>
				<Td><div class="btn" id="reset1" onclick="close_pop();" style="width: 70px;">취소</div></Td>
			</tr>
		</table>
	</div>
	</div>
	
	<script type="text/javascript">

	$("#cham").click(function() {
        $('#chamMo').show();
	});
	//팝업 Close 기능
	$("#reset").click(function() {
	     $('#chamMo').hide();
	});
	
	$("#yeol").click(function() {
        $('#yeolMo').show();
	});
	//팝업 Close 기능
	$("#reset1").click(function() {
	     $('#yeolMo').hide();
	});
      
	</script>
	
	<!-- 텍스트 에디터 api -->
	<textarea name="weditor" id="weditor" rows="10" cols="100" style="resize: none; margin-left: 80px;" readonly>스마트에디터 들어갈자리</textarea>
	<input type="button" id="writebtn" name="writebtn" value="저장">
	
	<br>
	<table style="margin-left: 325px;">
		<tr>
			<td><img width="20px" src="${contextPath}/resources/images/electronicApprovalImg/fileImg.png"></td>
			<td style="font-size: 20px;">&nbsp;&nbsp;파일업로드</td>
		</tr>
	</table>
	
	<table style="margin: auto; border-collapse: collapse; border: 3px solid #c4c4c4;">	
		<tr style="border-bottom: 3px solid #c4c4c4;">
			<td width="80px" height="40px">&nbsp;&nbsp;&nbsp;&nbsp;파일명</td>
			<td width="920px"><div id="fileAddBtn" onclick="onclick=document.all.file.click()">파일추가</div></td>
			<td><p><input type="file" id="file" style="display: none;"></p></td>
		</tr>
		<tr>
			<td colspan="3" height="150px"></td>
		</tr>
	</table>
	
	<br>
	<table style="margin-left: 910px;">
		<tr>
			<td><div class="btn" id="lineBtn" onclick="location.href='#'">결재선</div></td>
			<td><div class="btn1" onclick="location.href='#'">결재요청</div></td>
			<td><div class="btn" onclick="temSave();">임시저장</div></td>
			<td><div class="btn" onclick="cancel();">취소</div></td>
		</tr>
	</table>
	
	<!-- 결재라인 모달 -->
	<div id="line" class="modal">
    <!-- Modal content -->
	<div class="modal-content">
		<p style="font-size: 25px; margin-left: 20px; color: #29a2f7;">결재선 지정</p><Br>
		<table style="margin:auto; height: 280px;">
			<tr>
				<td width="265px"><div style="width: 270px; height: 280px; border: 1px solid #c4c4c4;"></div></td>
				<td width="100px">
					<div style="margin-left: 15px;">
					<input type="radio" name="ra" id="k">&nbsp;&nbsp;<label for="k">결재</label><br>
					<input type="radio" name="ra" id="h">&nbsp;&nbsp;<label for="h">합의</label><br><br></div>
					<div style="margin-left: 20px;">
					<img src="${contextPath }/resources/images/electronicApprovalImg/sendR.png" style="margin: auto; width: 40px;"><br>
					<img src="${contextPath }/resources/images/electronicApprovalImg/sendL.png" style="margin: auto; width: 40px;">
					</div>
				</td>
				<td width="265px">
					<div style="width: 270px; height: 280px; border: 1px solid #c4c4c4;">
						<Br>
						<table style="margin: auto; border: 1px solid #c4c4c4; border-collapse: collapse; text-align: center;" border="1">
							<tr height="40px">
								<td width="50px"></td>
								<td width="50px">결재</td>
								<td width="150px">이수정 영업기획팀</td>
							</tr>
							<tr height="40px">
								<td>최종</td>
								<td>결재</td>
								<td>홍길동 영업기획팀</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<table style="margin-left: 480px;">
			<tr>
				<Td><div class="btn1" onclick="" style="width: 70px;">적용</div></Td>
				<Td><div class="btn" id="lineReset" style="width: 70px;">취소</div></Td>
			</tr>
		</table>
	</div>
	</div>
	
	<script>
		$("#lineBtn").click(function() {
	        $('#line').show();
		});
		//팝업 Close 기능
		$("#lineReset").click(function() {
		     $('#line').hide();
		});
	</script>
	
	
	</section>

	<script>
		
		function temSave() {
			confirm('임시저장 하시겠습니까?');
		}
		
		function cancel() {
			confirm('취소하시겠습니까?');
		}
	
	
	</script>

	<script type="text/javascript" src="/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "weditor",  //textarea ID
		    sSkinURI: "${contextPath}/smarteditor/SmartEditor2Skin.html",  //skin경로
		    fCreator: "createSEditor2",
		});
	</script>
		
	<script>
			window.onload = function() {
			var btn = document.getElementById("writebtn");
			btn.onclick = function() {
				submitContents(btn);
			}
		}
		
		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FILED", []);
			
			try {
				elClickedObj.from.submit();
			} catch(e) {
				
			}
		}
	
	</script>

</body>
</html>


























