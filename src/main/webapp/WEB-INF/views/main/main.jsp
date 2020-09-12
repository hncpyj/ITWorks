<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    section>article:first-child {
        border-radius: 10px 10px 10px 10px; 
        background: white; 
        width: 1100px; 
        height: 220px; 
        margin: auto; 
        margin-top: 35px; 
        box-shadow: 1px 2px 5px lightgray;
        padding-top: 15px;
        padding-bottom: 15px;
    }
    section>article:nth-child(2) {
        border-radius: 10px 10px 10px 10px; 
        background: white; 
        width: 535px; 
        height: 285px; 
        margin-top: 35px; 
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
    section>article:last-child {
        margin-top: 35px;
        text-align: center;
    }
    section>article:last-child>img {
        margin-left: 30px;
    }
    section>article:last-child>img:first-child {
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
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"></jsp:include>

    <aside style="float: left;">
        <div id="asideBack">
            <div id="atManagementInfo">
                <img src="${ contextPath }/resources/mainImages/mainAtManagementIcon.png">
                <div id="atManegeTitle">&nbsp;출퇴근 관리</div>
                <div id="atTimeCheck">
                    <b>출근</b>  <!-- 출근등록시간 출력(미등록시 미등록) -->미등록<!--출근등록시간 출력 끝-->
                    &nbsp;&nbsp;ㅣ&nbsp;&nbsp;
                    <b>퇴근</b>  <!-- 퇴근등록시간 출력(미등록시 미등록) -->미등록<!--퇴근등록시간 출력 끝--> 
                </div>
                <div id="goAtManage">
                    출퇴근 등록
                </div>
            </div>
        </div>
    </aside>

    <section style="margin-left: 250px;">
        <!-- 공지사항 -->
        <article>
            <img src="${ contextPath }/resources/mainImages/mainNoticeLogo.png" style="width: 172px; height: 108px; margin-left: 15px; margin-right: 15px; float: left;">
            <table id="newNoticeList">
                <tr style="background: #f6f6f6;">
                    <th width="550px">제목</th>
                    <th width="120px">작성자</th>
                    <th>등록일</th>
                    <th width="80px">조회수</th>
                </tr>
                <tr>
                    <td>공지사항제모오오오오오오옥</td>
                    <td>공지작성자</td>
                    <td>2020/08/21</td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>example</td>
                    <td>example</td>
                    <td>example</td>
                    <td>example</td>
                </tr>
                <tr>
                    <td>example</td>
                    <td>example</td>
                    <td>example</td>
                    <td>example</td>
                </tr>
                <tr>
                    <td>example</td>
                    <td>example</td>
                    <td>example</td>
                    <td>example</td>
                </tr>
                <tr>
                    <td>example</td>
                    <td>example</td>
                    <td>example</td>
                    <td>example</td>
                </tr>
            </table>
            <a href="#" style="padding-left: 1040px; color:gray; font-size: 13px;">더보기</a>
        </article>

        <!--결재대기문서함-->
        <article>
            <img src="${ contextPath }/resources/mainImages/mainEAlogo.png" width="495px" height="50px" style="margin-left: 20px;">
            <table id="eaList">
                <tr style="background: #f6f6f6;">
                    <th width="400px">제목</th>
                    <th>등록일</th>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
            </table>
            <a href="#" style="padding-left: 470px; color:gray; font-size: 13px;">더보기</a>
        </article>

        <!--진행중인프로젝트-->
        <article>
            <img src="${ contextPath }/resources/mainImages/mainProjectLogo.png" width="495px" height="50px" style="margin-left: 20px;">
            <table id="projectList">
                <tr style="background: #f6f6f6;">
                    <th width="400px">제목</th>
                    <th>등록일</th>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
            </table>
            <a href="#" style="padding-left: 470px; color:gray; font-size: 13px;">더보기</a>
        </article>

        <!--바로가기 버튼영역-->
        <article>
            <img src="${ contextPath }/resources/mainImages/eaBtn.png" onclick="location.href='approvalIng.ea'">
            <img src="${ contextPath }/resources/mainImages/projectBtn.png" onclick="location.href='#'">
            <img src="${ contextPath }/resources/mainImages/fileBtn.png" onclick="location.href='#'">
            <img src="${ contextPath }/resources/mainImages/addressBtn.png" onclick="location.href='#'">
            <img src="${ contextPath }/resources/mainImages/messangerBtn.png" onclick="location.href='#'">
        </article>
    </section>
</body>
</html>