<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    }
    #asideBack ul li:last-child {
        font-weight: bold;
    }

    button {
        cursor: pointer;
    }
    /*메뉴 타이틀 관련 css 설정 종료*/

    /* 공지사항 내용 */
    article:nth-child(2), article:nth-child(3) {
        margin-top: 40px;
    }
    article:nth-child(2)>table, article:nth-child(3)>form>table {
        width: 1030px;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        margin: auto;
        border-collapse: collapse;
    }
    th {
        width: 100px;
        height: 30px;
        background: #f4f4f4;
        border-bottom: 1px solid #929292;
        font-size: 13px;
    }
    td {
        background: white;
        border-bottom: 1px solid #929292;
        padding-left: 10px;
        font-size: 13px;
    }
    button, article:last-child>form>input[type="submit"] {
        width: 62px;
        height: 25px;
        border: none;
        background: #004771;
        color: white;
        font-size: 13px;
    }
    button:nth-child(-n+2) {
        margin-bottom: 10px;
    }
    button:last-child {
        margin-top: 10px;
        margin-left: 88.5%;
    }
    button:first-child, article:last-child>form>button {
        margin-left: 82%;
        margin-right: 5px;
    }
    tr:nth-child(3)>th, tr:nth-child(3)>td, tr:nth-child(4)>td {
        border-bottom: 2px solid #929292;
    }
    /* 공지사항 내용 종료 */

    /* 공지사항 수정 폼 */
    article:last-child>form>button, article:last-child>form>input[type="submit"] {
        margin-top: 10px;
    }
    button, input[type="submit"] {
        cursor: pointer;
    }
    /* 공지사항 수정 폼 종료 */
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="noticeAside.jsp"/>
    <section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>공지사항</span>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 공지사항 폼 -->
        <article>
            <button onclick="">수정하기</button>
            <button onclick="">삭제하기</button>
            <table>
                <tr>
                    <th>No</th>
                    <td width="650px">00</td>
                    <th>조회수</th>
                    <td>00</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="3"><p><c:out value="${ notice.nContent }"/></p></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><p><c:out value="${ notice.mNo }"/></p></td>
                    <th>작성일</th>
                    <td style="text-align: center; padding-left: 0;"><p><c:out value="${ notice.nDate }"/></p></td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 400px;"></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3"></td>
                </tr>
            </table>
            <button onclick="history.go(-1);">목록으로</button>
        </article>
        <!-- 공지사항 폼 종료-->
        <article id="modifyNoticeForm" style="display: none;">
            <form action="">
                <table>
                    <tr>
                        <th>No</th>
                        <td width="650px">00</td>
                        <th>조회수</th>
                        <td>00</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="3"><input type="text" style="width: 900px;"></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>최재영</td>
                        <th>작성일</th>
                        <td style="text-align: center; padding-left: 0;">YYYY/MM/DD hh:MM:ss</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 400px;">
                            <textarea name="" id="" cols="141" rows="20" style="resize: none; margin-top: 5px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="3"><input type="file"></td>
                    </tr>
                </table>
                <button onclick="history.go(0);" style="background: lightgray; color: black;">취소하기</button>
                <input type="submit" value="수정하기">
            </form>
        </article>
        <!-- 공지사항 수정 폼 -->
    </section>

    <script>
        function modifyNotice() {
            $('article:nth-child(n+2)').css('display', 'none');
            $('#modifyNoticeForm').css('display', 'block');
            $('#menuTitle>span').text('프로젝트 공지사항 수정');
            $('#menuTitle>button').hide();
        }
    </script>
</body>
</html>