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
    #search {
       border-radius:15px;
       border:1px solid #29A2F7;
       width:230px;
       height: 25px;
    }
    .middleTitle{
    	color: #004771;
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
    }
    .searchBox{
    	width: 100%;
    }
    .miniText{
    	color: #929292;
    	font-size: 12px;
    }
    #employeeAtTable{
    	width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    #employeeAtTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 15px;
		line-height: 23px;
		color: #000000;
		background: white;
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
    .month{
    	width: 45px;
    }
    #year{
    	color: #004771;
    	font-weight: bold;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
    .month2{
    	border-left:  0.5px solid #9F9F9F;
    	border-right:  0.5px solid #9F9F9F;
    	height: 40px;
    }
    a.button{
	    display:inline-block; 
	    padding: 10px 20px; 
	    text-decoration:none; 
	    color:#fff; 
	    background:#000; 
	    margin:20px;
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
    .modalTable th{
    	background: #fafafa;
    }
    a{
    	text-decoration: none;
        color: #004771;
        font-size: 14px;
    }
    .explain{
    	margin-top: 10px;
    	margin-bottom: 10px;
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 12px;
		line-height: 17px;
		color: #444444;
    }
    .dayBox{
    	width: 20px;
    }
    .long{
    	width: 280px;
    }
    input[type=text]{
    	border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
    }
    select{
    	border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
    }
    
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>휴가 현황 조회</span>
            <br>
            <hr>
            <br>
            </div>
            <table class="searchBox">
            <tr>
            <td width="95px"><span class="middleTitle">휴가 현황 조회</span></td>
            <td><span class="miniText">※연 단위</span></td>
            <td width="230px"><input type="text" id="search" placeholder="이름 또는 조직을 검색하세요."></td>
         	<td width="10"><img src="${contextPath}/resources/images/searchBtn.png" onclick="location.href='#'" style="cursor: pointer;"></td>
            </tr>
            </table>
            <table id="employeeAtTable">
                	<tr>
                		<th rowspan="2">이름</th>
                		<th rowspan="2">소속</th>
                		<th rowspan="2">입사일</th>
                		<th rowspan="2">수정/상세</th>
                		<th id="year" colspan="12">2020</th>
                	</tr>
                	<tr>
                		<th class="month">생성</th>
                		<th class="month">연차</th>
                		<th class="month">반차</th>
                		<th class="month">교육/훈련</th>
                		<th class="month">출장</th>
                		<th class="month">경조사</th>
                		<th class="month">병가</th>
                		<th class="month">출산</th>
                		<th class="month">여름휴가</th>
                		<th class="month">무급</th>
                		<th class="month">외출</th>
                		<th class="month">잔여</th>
                	</tr>
                	<tr>
                		<td>하이루</td>
                		<td>대표</td>
                		<td>2016/05/03</td>
                		<td><button class="btn" onclick="openModal('modal2');">수정</button>/<button class="btn" onclick="openModal('modal1');">상세</button></td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                		<td class="month2">0</td>
                	</tr>
                </table>
		</div>
	</section>
	
	<!-- 상세모달ㅌ창 -->
	<div id="modal"></div>
	  <div class="modal-con modal1">
	    
	    <div class="con">
	      <div class="middleTitle">직원 휴가일 상세</div>
	      <div class="explain">입사일 : 2016 / 05 / 03</div>
	      <table class="modalTable">
	      	<tr>
	      		<th>번호</th>
	      		<th>신청자</th>
	      		<th>휴가 종류</th>
	      		<th>일수</th>
	      		<th>기간</th>
	      		<th>상태</th>
	      	</tr>
	      	<tr>
	      		<td>1</td>
	      		<td>헤일리최</td>
	      		<td>연차</td>
	      		<td>2일</td>
	      		<td>2020/08/21~2020/08/22</td>
	      		<td>결재 완료</td>
	      	</tr>
	      </table>
	    	<button class="close" onclick="">닫기</button>
	    </div>
	  </div>
	  <!-- 수정 모달창 -->
	   <div class="modal-con modal2">
	    <div class="con">
	    <div class="middleTitle">직원 휴가일 수정</div>
	      <div class="explain">입사일 : 2016 / 05 / 03</div>
	      <div class="explain">※ 정기 연차와 포상 휴가 일수는 ‘정수’ 로 입력할 수 있습니다.</div>
	      <table class="modalTable">
	      	<tr>
	      		<th>종류</th>
	      		<th>현재</th>
	      		<th>변경 후</th>
	      		<th>비고</th>
	      	</tr>
	      	<tr>
	      		<td>연차</td>
	      		<td>15일</td>
	      		<td><input class="dayBox" type="text">일</td>
	      		<td><input class="long" type="text"></td>
	      	</tr>
	      </table>
	      <a href="updateEmpAt.at">수정</a>
	    	<button class="close" onclick="">닫기</button>
	    
	    </div>
	  </div>
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