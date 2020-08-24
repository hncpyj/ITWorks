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
		font-size: 16px;
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>근태 현황 내역</span>
            <br>
            <hr>
            <br>
            </div>
            <table class="searchBox">
            <tr>
            <td width="95px"><span class="middleTitle">근태 현황 조회</span></td>
            <td><span class="miniText">※연 단위</span></td>
            <td width="230px"><input type="text" id="search" placeholder="이름 또는 조직을 검색하세요."></td>
         	<td width="10"><img src="${contextPath}/resources/images/searchBtn.png" onclick="location.href='#'" style="cursor: pointer;"></td>
            </tr>
            </table>
            <table id="employeeAtTable">
                	<tr>
                		<th rowspan="2">이름</th>
                		<th rowspan="2">소속</th>
                		<th rowspan="2">지각/미체크</th>
                		<th rowspan="2">상세</th>
                		<th id="year" colspan="12">2020</th>
                	</tr>
                	<tr>
                		<th class="month">1</th>
                		<th class="month">2</th>
                		<th class="month">3</th>
                		<th class="month">4</th>
                		<th class="month">5</th>
                		<th class="month">6</th>
                		<th class="month">7</th>
                		<th class="month">8</th>
                		<th class="month">9</th>
                		<th class="month">10</th>
                		<th class="month">11</th>
                		<th class="month">12</th>
                	</tr>
                	<tr>
                		<td>하이루</td>
                		<td>대표</td>
                		<td>0/0</td>
                		<td><button class="btn" onclick="openModal('modal1');">상세</button></td>
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
	<!-- 모달창 -->
	<!-- <div id="wrap">
	  <a href="javascript:openModal('modal1');" class="button modal-open">모달열기1</a>
	  <a href="javascript:openModal('modal2');" class="button modal-open">모달열기2</a>
	</div> -->
	
	<div id="modal"></div>
	  <div class="modal-con modal1">
	    <!-- <a href="javascript:;" class="close">X</a> -->
	    <div class="con">
	      <table>
	      	<tr>
	      		<td>
	      			<select>
	      				<option>2020</option>
	      				<option>2019</option>
	      				<option>2018</option>
	      				<option>2017</option>
	      				<option>2016</option>
	      				<option>2015</option>
	      				<option>2014</option>
	      				<option>2013</option>
	      				<option>2012</option>
	      				<option>2011</option>
	      				<option>2010</option>
	      			</select>
	      			<span>년</span>
	      		</td>
	      		<td>
	      			<select>
                				<option>01</option>
                				<option>02</option>
                				<option>03</option>
                				<option>04</option>
                				<option>05</option>
                				<option>06</option>
                				<option>07</option>
                				<option>08</option>
                				<option>09</option>
                				<option>10</option>
                				<option>11</option>
                				<option>12</option>
                			</select>
                			<span>월</span>
	      		</td>
	      	</tr>
	      </table>
	      <table class="modalTable">
	      	<tr>
	      		<th>날짜</th>
	      		<th>출근 시간</th>
	      		<th>퇴근 시간</th>
	      		<th>수정</th>
	      	</tr>
	      	<tr>
	      		<td>2020/08/24</td>
	      		<td>8 : 58 : 12</td>
	      		<td>6 : 00 : 02</td>
	      		<td><a href="updateEmpAt.at">수정</a></td>
	      	</tr>
	      </table>
	    <button class="close" onclick="">닫기</button>
	    </div>
	  </div>
	  
	   <!-- <div class="modal-con modal2">
	    <a href="javascript:;" class="close">X</a>
	    <p class="title">제목2</p>
	    <div class="con">
	      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
	    </div>
	  </div> -->
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