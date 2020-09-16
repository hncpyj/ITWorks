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
        width: 250px;
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
        height: 27px; 
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
        height: 27px; 
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
                    <b>출근</b>  <!-- 출근등록시간 출력(미등록시 미등록) --><span id="start">미등록</span><!--출근등록시간 출력 끝-->
                    &nbsp;&nbsp;ㅣ&nbsp;&nbsp;
                    <b>퇴근</b>  <!-- 퇴근등록시간 출력(미등록시 미등록) --><span id="end">미등록</span><!--퇴근등록시간 출력 끝--> 
                </div>
                <div id="goAtManage">
                    출퇴근 등록
                </div>
                
            </div>
            
        </div>
    </aside>
<c:forEach begin="0" end="${at.size()-1 }" var="i">
<input type="hidden" id="wstart${i }" value="${at.get(i).wstart }">
<input type="hidden" id="wend${i }" value="${at.get(i).wend }">
<input type="hidden" id="wdate${i }" value="${at.get(i).wdate }">
</c:forEach>
<script type="text/javascript">
            	
            	$("#goAtMAnage").click(function() {
					location.href="selectAtStatus.at";
				});
            	$(document).ready(function() {
            		//시계, 날짜
            		clock();
            		setInterval(clock, 1000);
            		
            		var size =  ${at.size()};
            		
            		for(var i = 0; i < size; i++){
            			if($("#wstart"+i).val() != null){
            				$("#start").text($("#wstart"+i).val());
            			}
            			if($("#wend"+i).val() != null){
            				$("#end").text($("#wend"+i).val());
            			}
            		}
            		
            		
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