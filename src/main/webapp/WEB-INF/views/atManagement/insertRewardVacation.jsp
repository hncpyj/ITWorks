<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	section{
		width: 75%;
		display: inline-block;
	}
	.inner{
        margin-top: 30px;
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
        vertical-align: middle;
    }
    #inner-title{
        color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: 500;
        font-size: 24px;
        line-height: 35px;
        margin-top: 30px;
    }
    #inner-title span{
    	margin-left: 20;
    }
    .addTable{
    	width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    .addTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 16px;
		line-height: 23px;
		color: #000000;
		background: white;
		width: 130px;
		height: 30px;
    }
    td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 30px;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
    .mini{
    	width: 20px;
    }
    .addBtn{
    	color: #004771;
        font-size: 14px;
        background: #FFFFFF;
		border: 0.5px solid #929292;
		outline: 0;
		margin-top: 20px;
    }
    .explain{
    	margin-bottom: 20px;
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 12px;
		line-height: 17px;
		color: #444444;
    }
    #modal{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}
.modal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 60%;
  min-height: 30%;
  background:#fff;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
  background : gold;
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
}
.modal-con .close{
  /* display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#000; font-size:20px; font-weight: bold;
  right:10px; top:10px; */
  outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: white;
    	
}
.modalTable{
	width: 500px;
	text-align: center;
	border-collapse: collapse;
}
.modalTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    .middleTitle{
    	color: #004771;
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
    }
    .searchBtn{
    	outline: 0;
    	border : 0.5px solid #929292;
    	color: #004771;
    	background-color: white;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>포상 휴가 생성</span>
            <br>
            <hr>
            <br>
            </div>
            <div class="explain">
            	근무 기간에 따른 연차 휴가 외 별도 포상 휴가를 부여할 때 사용하는 기능입니다.<br>
				※ '생성 후' 입력란에 최종 포상 휴가 일수를 입력합니다.<br>
				예) 현재 포상 휴가를 3일 받은 직원에게 2일을 추가하고 싶다면, '생성 후' 입력란에 5일을 입력합니다.<br>
				※ 포상 휴가 일수는 '정수' 로 입력할 수 있습니다.<br>
				※ 포상 휴가 일수를 입력한 후 '지금 생성하기'를 클릭하세요.
            </div>
            <form action="">
            	<table class="addTable">
            		<tr>
            			<th>대상자선택</th>
            			<td colspan="7" align="left">대상자를 추가해 주세요. <button type="button" class="btn" onclick="openModal('modal1');">선택하기</button></td>
            		</tr>
            		<tr>
            			<th rowspan="2">휴가 일수</th>
            			<th>이름</th>
            			<th>소속</th>
            			<th>연차</th>
            			<th>포상휴가명</th>
            			<th>현재 포상</th>
            			<th>생성 포상</th>
            			<th></th>
            		</tr>
            		<tr>
            			<td>헤일리최</td>
            			<td>기술지원팀</td>
            			<td>16일</td>
            			<td>체육대회우승</td>
            			<td>0일</td>
            			<td><input type="text" class="mini">일</td>
            			<td><button class="btn">삭제하기</button></td>
            		</tr>
            	</table>
            	<button class="addBtn">추가하기</button>
            </form>
		</div>
		
		<!-- 모달창 -->
		<div id="modal"></div>
	  <div class="modal-con modal1">
	    
	    <div class="con">
	      <div class="middleTitle">포상 휴가 대상자 선택</div>
	      <table>
	      	<tr>
	      		<td>
	      			<select id="optionVal">
	      			<option value="name">이름</option>
	      			<option value="dept">부서</option>
	      			</select>
	      		</td>
	      		<td><input type="search" id="searchVal"></td>
	      		<td><button class="searchBtn" onclick="searchBtn();">검색</button></td>
	      	</tr>
	      </table>
	      <script type="text/javascript">
	      	function searchBtn() {
				var searchVal = $("#searchVal").val();
				var optionVal = $("#optionVal").val();
				
				$.ajax({
					url:"searchEmployee.at",
					data:{searchVal: searchVal, optionVal: optionVal},
					method: "get",
					success: function(data) {
						console.log(data);
					},
					error: function() {
						console.log("오류");
					}
					
				});
				
			}
	      </script>
	      <table class="modalTable">
	      	<tr>
	      		<th></th>
	      		<th>이름</th>
	      		<th>소속</th>
	      		<th>연차</th>
	      		<th>포상</th>
	      	</tr>
	      	<tr>
	      		<td><input type="checkbox"></td>
	      		<td>헤일리최</td>
	      		<td>기술지원부</td>
	      		<td>16일</td>
	      		<td>0일</td>
	      	</tr>
	      </table>
	      	<button class="close">추가</button>
	    	<button class="close" onclick="">닫기</button>
	    </div>
	  </div>
	</section>
	<script type="text/javascript">
	  function openModal(modalname){
		  document.get
		  $("#modal").fadeIn(300);
		  $("."+modalname).fadeIn(300);
		}

		$("#modal, .close").on('click',function(){
		  $("#modal").fadeOut(300);
		  $(".modal-con").fadeOut(300);
		});
	  </script>
</body>
</html>