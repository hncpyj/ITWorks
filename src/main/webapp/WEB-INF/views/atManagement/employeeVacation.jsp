<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                		<th rowspan="2">상세</th>
                		<th id="year" colspan="12">2020</th>
                	</tr>
                	<tr>
                		<th class="month">생성</th>
                		<c:forEach begin="0" end="${leave.size() -1 }" var="i">
                		<th class="month"><c:out value="${leave.get(i).lname }"/></th>
                		</c:forEach>
                		
                		<th class="month">잔여</th>
                	</tr>
                <c:forEach begin="0" end="${emp.size()-1 }" var="i">
                	<tr>
                		<td><c:out value="${emp.get(i).ename }"/></td>
                		<td><c:out value="${emp.get(i).dname }"/></td>
                		<td><c:out value="${emp.get(i).hiredate }"/></td>
                		<td><%-- <button class="btn" onclick="openModal('modal2${emp.get(i).mno}');">수정</button>/ --%><button class="btn" onclick="openModal('modal1${emp.get(i).mno}');">상세</button></td>
                		<td class="month2"><c:out value="${emp.get(i).aleaveCount }"/></td>
                		<c:forEach begin="0" end="${leave.size() -1 }" var="j">
                		<td class="month2" id="${leave.get(j).leaveNo }"><span class="spanMno${i}" id="${emp.get(i).mno }">0</span></td>
                		</c:forEach>
                		<td class="month2">0</td>
                	</tr>
            	</c:forEach>
                </table>
		</div>
	</section>
	<c:forEach begin="0" end="${leave.size() -1 }" var="j">
   		<input type="hidden" id="lstart${j}" value="${leave.get(j).lstartDay }">
   		<input type="hidden" id="lend${j}" value="${leave.get(j).lendDay }">
   		<input type="hidden" id="leaveNo${j}" value="${leave.get(j).leaveNo }">
   		<input type="hidden" id="mno${j}" value="${leave.get(j).mno }">
   </c:forEach>
   		<script type="text/javascript">
   			$(document).ready(function() {
   				var empSize = ${emp.size()};
   				var leaveSize = ${leave.size()};
   				for(var i = 0; i < empSize; i++){
				var spanClass = $('.spanMno'+i).attr('id');
				for(var j = 0; j < leaveSize; i++){
					if(spanClass == $("#mno"+j).val()){
						console.log(spanClass);
						
					}
				}
   					
   				}
			});
   		</script>
   		     		
	<!-- 상세모달ㅌ창 -->
	<c:forEach begin="0" end="${emp.size()-1 }" var="i">
	<div id="modal"></div>
	  <div class="modal-con modal1${emp.get(i).mno}">
	    <div class="con">
	      <div class="middleTitle">직원 휴가일 상세</div>
	      <div class="explain">입사일 : <c:out value="${emp.get(i).hiredate }"/></div>
	      <table class="modalTable">
	    <c:forEach begin="0" end="${vacation.size()-1 }" var="j">
	    <c:if test="${emp.get(i).mno eq vacation.get(j).mno}">
	      	<tr>
	      		<th>신청자</th>
	      		<th>휴가 종류</th>
	      		<th>신청일</th>
	      		<th>기간</th>
	      	</tr>
	      	<tr>
	      		<td><c:out value="${emp.get(i).ename }"/></td>
	      		<td><c:out value="${vacation.get(j).lname }"/></td>
	      		<td><c:out value="${vacation.get(j).ldate }"/></td>
	      		<td><c:out value="${vacation.get(j).lstartDay }"/>~<c:out value="${vacation.get(j).lendDay }"/></td>
	      	</tr>
	    </c:if>
	    </c:forEach>
	      </table>
	    	<button class="close" onclick="">닫기</button>
	    </div>
	  </div>
	  <!-- 수정 모달창 -->
	   <div class="modal-con modal2${emp.get(i).mno}">
	    <div class="con">
	    <div class="middleTitle">직원 휴가일 수정</div>
	      <div class="explain">입사일 : <c:out value="${emp.get(i).hiredate }"/></div>
	      <div class="explain">※ 정기 연차와 포상 휴가 일수는 ‘정수’ 로 입력할 수 있습니다.</div>
	      <table class="modalTable">
	       <c:forEach begin="0" end="${vacation.size()-1 }" var="j">
	    <c:if test="${emp.get(i).mno eq vacation.get(j).mno}">
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
	      	</c:if>
	    </c:forEach>
	      </table>
	      <a href="updateEmpAt.at">수정</a>
	    	<button class="close" onclick="">닫기</button>
	    
	    </div>
	  </div>
	  </c:forEach>
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