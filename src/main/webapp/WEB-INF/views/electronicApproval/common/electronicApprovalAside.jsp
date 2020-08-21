<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 0px;
        font-family: "Noto Sans KR";
    }
    body {
        background: #fafafa;
    }
    #asideBack {
        width: 250px;
        height: 900px;
        background: #E4EBF3;
    }      
    #asideBack ul li{
        padding-left: 25px;
        height: 35px;
        vertical-align: middle;
    }
    #asideMenuTitle {
        padding-top: 22px; 
        padding-left: 36px; 
        font-size: 15px; 
        font-weight: bold; 
        color: #004771; 
        margin-bottom: 10px;
    }
    .asideMenu {
        text-decoration: none;
        color: #004771;
        font-size: 14px;
        cursor: pointer; 
    }
    #draft {
        background: #29A2F7;
        color: white;
        width: 150px;
        height:50px;
        border-radius: 20px;
        text-align: center;
        margin-left: 50px;
        line-height: 50px;
        cursor: pointer;
    } 
    .asideMenu:hover {
    	font-weight: bold;
    }
/*     #asideBack ul li:nth-child(2) {
        font-weight: bold;
    } */
</style>
</head>
<body>
	<aside style="display: inline-block; float:left;">
        <div id="asideBack">
            <br>
            <div id="draft" onclick="location.href='#'">새 기안 작성</div>
            <div id="asideMenuTitle">결재</div>
            <ul>
                <li><a href="approvalIng.ea" class="asideMenu">- 결재진행함</a></li>
                <li><a href="approvalRequest.ea" class="asideMenu">- 결재요청함</a></li>
                <li><a href="approvalWait.ea" class="asideMenu">- 결재대기함</a></li>
            </ul>
            <div id="asideMenuTitle">문서함</div>
            <ul>
                <li><a href="temSave.ea" class="asideMenu">- 임시저장함</a></li>
                <li><a href="completion.ea" class="asideMenu">- 완료문서함</a></li>
                <li><a href="return.ea" class="asideMenu">- 반려문서함</a></li>
                <li><a href="deptReception.ea" class="asideMenu">- 부서수신함</a></li>
                <li><a href="refRead.ea" class="asideMenu">- 참조/열람문서함</a></li>
            </ul>
        </div>
    </aside>
</body>
</html>