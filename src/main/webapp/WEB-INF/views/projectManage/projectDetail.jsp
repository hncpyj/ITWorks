<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<style>
    /*메뉴 타이틀 관련 css 설정*/
    body {
        width: 1420px;
        height: 900px;
    }
    section {
       width: 1170px; 
       height: 100%; 
       margin-left: 250px;
    }
    #menuTitle {
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
    }
    #menuTitle>span {
        font-size: 24px; 
        color: #004771; 
        padding-left: 20px; 
        font-weight: 400;
    }
    #menuTitle>button {
        width: 62px; 
        height: 27px; 
        background: #004771; 
        border: none; 
        color: white;
        margin-left: 75%;
    }
    #asideBack ul li:first-child {
        font-weight: bold;
    }
    #menuTitle>button {
        margin: 0;
        width: 62px; 
        height: 27px; 
        background: #004771; 
        border: none; 
        color: white;
    }
    /*메뉴 타이틀 관련 css 설정 종료*/

    /*프로젝트 정보*/
    article:nth-child(2) {
        margin-top: 30px;
        width: auto;
    }
    article:nth-child(2)>table {
        width: 983px;
        /* height: 320px; */
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        background: white;
        border-collapse: collapse;
        margin: auto;
        box-shadow: 1px 1px 5px lightgray;
    }
    article:nth-child(2)>table th {
        width: 103px;
        background: #f4f4f4;
        font-size: 14px;
        border-bottom: 1px solid #929292;
        height: 35px;
    }
    article:nth-child(2)>table td {
        height: 30px;
        border-bottom: 1px solid #929292;
        padding-left: 15px;
        font-size: 13px;
        height: 35px;
    }
    /*프로젝트 정보 끝*/

    /*프로젝트 전체 일정*/
    article:nth-child(3) {
        margin-top: 40px;
    }
    article:nth-child(3) div:first-child, article:nth-child(4) div:first-child {
        padding-left: 65px;
    }
    #overallSchedule, #wbs {
        text-align: center;
        overflow-x: auto;
        width: 983px; 
        margin: auto; 
        margin-top: 15px;
    }
    #overallSchedule table, #wbs table {
        white-space: nowrap;
        border-collapse: collapse;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
    }
    #overallSchedule table th, #wbs table th {
        font-size: 14px;
        background: #f4f4f4;
        border-right: 1px solid #929292;
        height: 25px;
    }
    #overallSchedule table td {
        height: 24px;
        font-size: 13px;
        background: rgba(0, 71, 113, 10%);
        border-right: 1px solid #929292;
    }
    #overallSchedule table th:last-child, #overallSchedule table td:last-child {
        border-right: none;
    }
    .week {
        min-width: 210px;
        width: 210px;
        background: #004771;
        border-bottom: 1px solid #929292;
    }
    .date {
        min-width: 25px;
        width: 25px;
        border-bottom: 2px solid #929292;
    }
    #overallSchedule table tr:first-child th:nth-child(-n+4) {
        min-width: 73px;
        width: 73px;
        border-bottom: 2px solid #929292;
    }
    #overallSchedule table tr:nth-child(n+2) th:nth-child(n+4) {
        min-width: 25px;
        width: 25px;
    }
    /* 프로젝트 전체 일정 끝 */

    /* WBS */
    article:nth-child(4) {
        margin-top: 40px;
    }
    #wbs table td {
        height: 24px;
        font-size: 13px;
        background: white;
        border-right: 1px solid #929292;
        background: rgba(0, 71, 113, 10%);
    }
    #wbs table th:last-child, #wbs table td:last-child {
        border-right: none;
    }
    
    #wbs table tr:first-child th:nth-child(-n+7) {
        min-width: 73px;
        width: 73px;
        border-bottom: 2px solid #929292;
    }
    #wbs table tr:nth-child(n+2) th:nth-child(n+4) {
        min-width: 25px;
        width: 25px;
    }
    article:nth-child(4) div:first-child button {
        width: 75px;
        height: 27px;
        background: #004771;
        color: white;
        border: none;
        font-size: 13px;
        margin-left: 900px;
    }
    /* WBS 끝 */

</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="projectDetailAside.jsp"/>
    <section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>프로젝트 상세보기</span>
                <button style="margin-left: 65%;">수정</button>
                <button onclick="location.href='selectAllProjectList.pm'">목록으로</button>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!--프로젝트정보-->
        <article>
            <table>
                <tr>
                    <th>프로젝트명</th>
                    <td colspan="7">프로젝트명</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td colspan="3"></td>
                    <th>상태</th>
                    <td>temp</td>
                </tr>
                <tr>
                    <th>담당자</th>
                    <td colspan="3">temp</td>
                    <th>관리부서</th>
                    <td>temp</td>
                </tr>
                <tr>
                    <th>참여자</th>
                    <td colspan="6">temp</td>
                </tr>
                <tr>
                    <th>열람 권한</th>
                    <td colspan="6">temp</td>
                </tr>
                <tr>
                    <th>계획 시작일</th>
                    <td>2020/08/21</td>
                    <th>계획 종료일</th>
                    <td>2020/08/21</td>
                    <th>실제 종료일</th>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <th>프로젝트 개요</th>
                    <td colspan="6">프로젝트 개요입니다.<br>두 줄도 돼요<br>세 줄도요</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="6">
                        첨부파일 1
                    </td>
                </tr>
            </table>
        </article>
        <!--프로젝트 정보 종료-->

        <!--프로젝트 전체일정표-->
        <article>
            <div style="color: #004771; font-size: 15px; font-weight: 550;">프로젝트 전체 일정</div>
            <div id="overallSchedule">
                <table>
                    <tr>
                        <th rowspan="2">계획<br>시작일</th>
                        <th rowspan="2">계획<br>종료일</th>
                        <th rowspan="2">실제<br>종료일</th>
                        <th rowspan="2"><br>상태</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                    </tr>
                    <tr>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                    </tr>
                    <tr>
                        <td>00/00/00</td>
                        <td>00/00/00</td>
                        <td>  </td>
                        <td>예정</td>

                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </article>
        <!--프로젝트 전체일정표 종료-->

        <!--WBS-->
        <article>
            <div style="color: #004771; font-size: 15px; font-weight: 550;">WBS <button onclick="insertTaskForm.pm">업무등록</button></div>

            <div id="wbs">
                <table>
                    <tr>
                        <th rowspan="2" style="min-width: 220px;"><br>업무명</th>
                        <th rowspan="2"><br>담당자</th>
                        <th rowspan="2">계획<br>시작일</th>
                        <th rowspan="2">계획<br>종료일</th>
                        <th rowspan="2">실제<br>종료일</th>
                        <th rowspan="2"><br>상태</th>
                        <th rowspan="2"><br>특이사항</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                    </tr>
                    <tr>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 10px;">
                            <img src="${ contextPath }/resources/projectManageImages/projectTaskIcon.png" style="margin-right: 7px;">업무명입니다.
                        </td>
                        <td>temp</td>
                        <td>00/00/00</td>
                        <td>00/00/00</td>
                        <td></td>
                        <td>예정</td>
                        <td></td>

                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </article>
        <!--WBS 종료-->
    </section>

</body>
</html>