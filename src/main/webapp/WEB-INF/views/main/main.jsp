<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITworks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    #asideBack {
        width: 270px;
        height: 1200px;
        background: #E4EBF3;
    }
    #atManagementInfo {
        height: 98px;
        width: 250px;
        display: table-cell;
        vertical-align: middle;
        text-align: center;
    }
    #atManagementInfo img {
        position: relative;
        top: 3px;
        width: 17px;
        height: 17px;
        margin-top: 30px;
    }
    #atManegeTitle {
        display: inline-block;
        font-size: 15px;
        font-weight: bold;
        color: #004771;
        margin-bottom: 15px;
    }
    #atTimeCheck {
        width: 203px; 
        height: 50px; 
        background: white; 
        border: none; 
        margin: auto; 
        border-radius: 7px 7px 7px 7px; 
        margin-bottom: 10px; 
        font-size: 14px; 
        padding-top: 4px;
    }
    #goAtManage {
        width: 203px; 
        height: 30px; 
        background: #004771; 
        border: none; 
        margin: auto; 
        border-radius: 7px 7px 7px 7px; 
        color: white; 
        font-size: 14px; 
        font-weight: 550;
        padding-top: 4px;
    }
    #goAtManage:hover {
        cursor: pointer;
    }
    
    section>article:nth-child(2) {
        border-radius: 10px 10px 10px 10px; 
        background: white; 
        width: 535px; 
        height: 285px; 
        margin-left: 38px;
        box-shadow: 1px 2px 5px lightgray;
        padding-top: 15px;
        padding-bottom: 15px;
        float: left;
    }
    section>article:nth-child(3) {
        border-radius: 10px 10px 10px 10px; 
        background: white; 
        width: 535px; 
        height: 285px; 
        margin-top: 35px;
        margin-left: 603px;
        box-shadow: 1px 2px 5px lightgray;
        padding-top: 15px;
        padding-bottom: 15px;
    }
    section>article:first-child {
        margin-top: 100px;
        margin-bottom: 80px;
        text-align: center;
        width: 1200px;
    }
    section>article:first-child>img {
        margin-left: 50px;
    }
    section>article:first-child>img:first-child {
        margin-left: 0;
    }
    #newNoticeList {
        width: 880px; 
        height: 200px;     
    }
    #eaList, #projectList {
        width: 495px;
        height: 200px;
        margin: auto;
        margin-top: 10px;
    }
    #eaList, #projectList, #newNoticeList {
        text-align: center; 
        border-collapse: collapse; 
        border-top: 3px solid #929292; 
        border-bottom: 3px solid #929292;
        margin-bottom: 3px;
    }
    #newNoticeList tr>td:first-child, #eaList tr>td:first-child, #projectList tr>td:first-child {
        text-align: left;
        padding-left: 20px;
    }
    #newNoticeList th, #eaList th, #projectList th {
        font-size: 14px;
        border-bottom: 3px double #929292;
    }
    #newNoticeList td, #eaList td, #projectList td {
        font-size: 13.5px;
        border-bottom: 1px solid #929292;
    }
    #newNoticeList tr:hover, #eaList tr:hover, #projectList tr:hover {
        cursor: pointer;
        background: rgb(211, 211, 211);
    }
    section>article:last-child>img:hover {
        cursor: pointer;
        
    }
    .timeText{
    	width: 270px;
    	text-align: center;
    	margin-bottom: 5px;
    }
	#nowTime{
		font-weight: bold;
		font-size: 35px;
	}
	#mainSchedule{
		margin-left: 70px;
		margin-right: auto;
		margin-top: 30px;
	}
	.active{
           background: #ef3333bd;
           color: white;
           border-radius: 50px;
        }
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"></jsp:include>

    <aside style="float: left;">
        <div id="asideBack">
            <div id="atManagementInfo">
                <img src="${ contextPath }/resources/mainImages/mainAtManagementIcon.png">
                <div id="atManegeTitle">&nbsp;출퇴근 관리</div>
                <div class="timeText" id="todayDay"></div>
                <div class="timeText" id="nowTime"></div>
                <div id="atTimeCheck">
                <div style="margin-bottom: 5px;">
                    <b>출근</b>  <!-- 출근등록시간 출력(미등록시 미등록) --><span id="start">미등록</span><!--출근등록시간 출력 끝-->
                </div>
                <div>
                    
                    <b>퇴근</b>  <!-- 퇴근등록시간 출력(미등록시 미등록) --><span id="end">미등록</span><!--퇴근등록시간 출력 끝--> 
                </div>
                </div>
                <button type="button" id="goAtManage" onclick="location.href='selectAtStatus.at'">
                    출퇴근 등록
                </button>
                
                <!-- 달력 -->
                
                <div id="mainSchedule">
               
               
                  <div id="calendar">
                      <div class="calmain">
                         <div class="content-wrap" style="margin-left: 0px; border: none; height: 360px; margin-top: 0px;">
                           <div class="content-right" style="margin-left: -60px;">
                             <table id="calendar" align="center">
                               <thead>
                                 <tr class="btn-wrap clearfix">
                                   <td style="text-align: center;">
                                      <div onclick="prev();">
                                        <label id="prev" >
                                           &#60;
                                        </label>
                                     </div>
                                   </td>
                                   <td align="center" id="current-year-month" colspan="5" ></td>
                                   <td style="text-align: center;">
                                      <div onclick="next();">
                                     <label id="next">
                                         &#62;
                                     </label>
                                     </div>
                                   </td>
                                 </tr>
                                 <tr>
                                     <td class = "sun" align="center">Sun</td>
                                     <td align="center">Mon</td>
                                     <td align="center">Tue</td>
                                     <td align="center">Wed</td>
                                     <td align="center">Thu</td>
                                     <td align="center">Fri</td>
                                     <td class= "sat" align="center">Sat</td>
                                   </tr>
                               </thead>
                               <tbody id="calendar-body" class="calendar-body"></tbody>
                             </table>
                           </div>
                         </div>
                       </div>
                  </div>
               
            </div>
                
                
                
                
            </div>
            
        </div>
    </aside>
    
    
    <script>
      var currentTitle = document.getElementById('current-year-month');
      var calendarBody = document.getElementById('calendar-body');
      var today = new Date();
      var first = new Date(today.getFullYear(), today.getMonth(),1);
      var dayList = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
      var monthList = ['January','February','March','April','May','June','July','August','September','October','November','December'];
      var leapYear=[31,29,31,30,31,30,31,31,30,31,30,31]; //윤년
      var notLeapYear=[31,28,31,30,31,30,31,31,30,31,30,31]; //윤년 아님
      var pageFirst = first; 
      var firstMonth = today.getMonth();
      var pageMonth = today.getMonth();
      var todayMonth = firstMonth+1;
      var todayYear = today.getFullYear();
      var todayDate = today.getDate();
      var calYear = todayYear;      
      var pageYear;

      if(todayMonth<10){
         todayMonth = "0"+todayMonth;
      }
      
      todayText = todayYear + "/" + todayMonth + "/" + todayDate;
      
      if(first.getFullYear() % 4 === 0){
          pageYear = leapYear;
      }else{
          pageYear = notLeapYear;
      }

      //달력을 출력하는 함수
      function showCalendar(){
          let monthCnt = 100;
          let cnt = 1;
          for(var i = 0; i < 6; i++){
              var $tr = document.createElement('tr');
              $tr.setAttribute('id', monthCnt);   
              for(var j = 0; j < 7; j++){
                  if((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]){
                      var $td = document.createElement('td');
                      $tr.appendChild($td);     
                  }else{
                      var $td = document.createElement('td');
                      var $tdEle = document.createElement('div');
                      $tdEle.textContent = cnt;

                  var eleId = calYear +""+ (pageMonth+1) +""+ cnt  
                      
                      $tdEle.setAttribute('id', eleId); 
                      //표 칸마다 id를 붙이며 id값는 숫자
                      
                      $tdEle.setAttribute('style','text-align: center;')
                      //90x60 스타일을 적용하는 setAttribute
                      
                      $td.appendChild($tdEle);
                  //td부분에 요소 추가
                                     
                      $tr.appendChild($td);
                      cnt++;
                  }
              }
              monthCnt++;
              currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;'+ first.getFullYear();
              today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
              calendarBody.appendChild($tr);
          }
      }

      showCalendar();

      //달력 달수를 변경할때 달력을 전부 지우고 다시불러오기 위해 지우는 함수
      function removeCalendar(){
          let catchTr = 100;
          for(var i = 100; i< 106; i++){
              var $tr = document.getElementById(catchTr);
              $tr.remove();
              catchTr++;
          }
      }

      //전달로 이동하는 함수
      function prev(){
          const $divs = document.querySelectorAll('#input-list > div');
          $divs.forEach(function(e){
            e.remove();
          });
          const $btns = document.querySelectorAll('#input-list > button');
          $btns.forEach(function(e1){
            e1.remove();
          });
          if(pageFirst.getMonth() === 1){
              pageFirst = new Date(first.getFullYear()-1, 12, 1);
              first = pageFirst;
              if(first.getFullYear() % 4 === 0){
                  pageYear = leapYear;
              }else{
                  pageYear = notLeapYear;
              }
          }else{
              pageFirst = new Date(first.getFullYear(), first.getMonth()-1, 1);
              first = pageFirst;
          }
          pageMonth = pageFirst.getMonth();
          calYear = pageFirst.getFullYear();
          currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;'+ first.getFullYear();
          removeCalendar();
          showCalendar();
           showToday();
      }

      //다음달로 이동하는 함수
      function next(){
          const $divs = document.querySelectorAll('#input-list > div');
          $divs.forEach(function(e){
            e.remove();
          });
          const $btns = document.querySelectorAll('#input-list > button');
          $btns.forEach(function(e1){
            e1.remove();
          });
          if(pageFirst.getMonth() === 12){
              pageFirst = new Date(first.getFullYear()+1, 1, 1);
              first = pageFirst;
              if(first.getFullYear() % 4 === 0){
                  pageYear = leapYear;
              }else{
                  pageYear = notLeapYear;
              }
          }else{
              pageFirst = new Date(first.getFullYear(), first.getMonth()+1, 1);
              first = pageFirst;
          }
          pageMonth = pageFirst.getMonth();
          calYear = pageFirst.getFullYear();
          currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;'+ first.getFullYear();
          removeCalendar();
          showCalendar(); 
           showToday();
      }

      //오늘인 부분은 오페라 색상으로 변경(연도 구분없음 )
      function showToday(){
      
         if(firstMonth == pageMonth && todayYear == calYear){

             clickedDate1 = document.getElementById(calYear+""+(pageMonth+1)+""+todayDate);
             clickedDate1.classList.add('active');
         }
      }
        showToday();
   </script>
   

    
<c:if test="${not empty at }">
<c:forEach begin="0" end="${at.size()-1 }" var="i">
<input type="hidden" id="wstart${i }" value="${at.get(i).wstart }">
<input type="hidden" id="wend${i }" value="${at.get(i).wend }">
<input type="hidden" id="wdate${i }" value="${at.get(i).wdate }">
</c:forEach>
</c:if>  
<script type="text/javascript">
            	
            	
            	$(document).ready(function() {
            		//시계, 날짜
            		clock();
            		setInterval(clock, 1000);
            		
            		var size =  ${at.size()};
            		
            		for(var i = 0; i < size; i++){
            			if($("#wstart"+i).val() != null){
            				$("#start").text($("#wstart0").val());
            			}
            			if($("#wend"+i).val() != null){
            				$("#end").text($("#wend"+i).val());
            			}
            		}
            		
            		/* if(${at} != null){
            			$("#start").text($("#wstart0").val());
            			if($("#wend1").val() != null){
            				$("#end").text($("#wend1").val());
            			}
            		} */
            		
            		
				});

            	function clock() {
            		var now = new Date();
            		
            	    var todayYear= now.getFullYear();
            	    var todayMon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
            	    var todayDay = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            	    var week = new Array('일', '월', '화', '수', '목', '금', '토');
            	    var chan_val = todayYear + '년 ' + todayMon + '월 ' + todayDay + '일 ' + week[now.getDay()] + '요일';
					$("#todayDay").text(chan_val);
					
					var nowHour = now.getHours();
					var nowMin = now.getMinutes();
					var nowSecond = now.getSeconds();
					if (nowHour < 10){ nowHour = "0" + nowHour; }
					if (nowMin < 10){ nowMin = "0" + nowMin; } 
					if (nowSecond < 10){ nowSecond = "0" + nowSecond; }
					
					var nowTime = nowHour + " : " + nowMin + " : " + nowSecond;
					$("#nowTime").text(nowTime);
				}
            </script>



    <section style="margin-left: 250px;">
        
<!--바로가기 버튼영역-->
        <article>
            <img src="${ contextPath }/resources/mainImages/orgBtn.png" onclick="location.href='orgChart.org'">
            <img src="${ contextPath }/resources/mainImages/projectBtn.png" onclick="location.href='selectAllProjectList.pm'">
            <img src="${ contextPath }/resources/mainImages/fileBtn.png" onclick="location.href='selectFirst.fb'">
            <img src="${ contextPath }/resources/mainImages/addressBtn.png" onclick="location.href='mainAddress.ad'">
            <img src="${ contextPath }/resources/mainImages/atBtn.png" onclick="location.href='selectAtStatus.at'">
        </article>
        

        <!--진행중인프로젝트-->
        <article>
            <img src="${ contextPath }/resources/mainImages/mainProjectLogo.png" width="495px" height="50px" style="margin-left: 20px;">
            <table id="projectList">
                <tr style="background: #f6f6f6;">
                    <th width="400px">제목</th>
                    <th>등록일</th>
                </tr>
                <c:forEach begin="0" end="${project.size()-1 }" var="i">
                <tr>
                    <td><c:out value="${project.get(i).pname }"/></td>
                    <td><c:out value="${project.get(i).pdate }"/></td>
                </tr>
                </c:forEach>
                
            </table>
            <a href="#" style="padding-left: 470px; color:gray; font-size: 13px;">더보기</a>
        </article>
<!--공지사항-->
        <article>
            <img src="${ contextPath }/resources/mainImages/mainNotice.png" width="495px" height="50px" style="margin-left: 20px;">
            <table id="eaList">
                <tr style="background: #f6f6f6;">
                    <th width="400px">제목</th>
                    <th>등록일</th>
                </tr>
                <c:forEach begin="0" end="${notice.size()-1 }" var="i">
                <tr>
                    <td><c:out value="${notice.get(i).ntitle }"/></td>
                    <td><c:out value="${notice.get(i).ndate }"/></td>
                </tr>
                </c:forEach>
               
            </table>
            <a href="#" style="padding-left: 470px; color:gray; font-size: 13px;">더보기</a>
        </article>
        
    </section>
</body>
</html>