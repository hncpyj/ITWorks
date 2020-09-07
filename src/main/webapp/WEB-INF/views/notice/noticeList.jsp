<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
</head>
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

    /* 검색 영역 */
    article:nth-child(2) {
        margin-top: 20px;
        text-align: right;
        font-size: 13px;
        margin-right: 50px;
    }
    article:nth-child(2)>form>select {
        width: 80px;
        border: 1px solid #929292;
        border-radius: 3px 3px 3px 3px;
    }
    article:nth-child(2)>form>input[type="search"] {
        width: 250px;
        border: 1px solid #929292;
        border-radius: 3px 3px 3px 3px;
        margin-left: 10px;
    }
    article:nth-child(2)>form>input[type="submit"] {
        width: 60px;
        height: 25px;
        background: #004771;
        border: none;
        border-radius: 3px 3px 3px 3px;
        color: white;
        font-weight: 550;
        margin-left: 5px;
    }
    /* 검색 영역 종료 */

    /* 공지사항 리스트 */
    article:nth-child(3) {
        margin-top: 40px;
    }
    article:nth-child(3)>table {
        width: 1030px;
        margin: auto;
        border-collapse: collapse;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        text-align: center;
    }
    th {
        font-size: 13px;
        background: #f4f4f4;
        height: 35px;
        border-bottom: 2px solid #929292;
    }
    td {
        font-size: 13px;
        background: white;
        height: 30px;
        border-bottom: 1px solid #929292;
    }
    tr>td:nth-child(2) {
        padding-left: 10px;
        text-align: left;
    }
    a {
        color: black;
        text-decoration: none;
    }
    button, input[type="submit"] {
        cursor: pointer;
    }
    /* 공지사항 리스트 종료 */
	
	
</style>

<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="noticeAside.jsp"></jsp:include>
	
	<section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>공지사항</span>
                <button onclick="location.href='insertNotice.no'" style="margin-left: 79%;">작성하기</button>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 검색 영역 -->
        <article>
            <form action="">
                <select name="" id="">
                    <option value="">제목</option>
                    <option value="">내용</option>
                </select>
                <input type="search" placeholder="검색할 내용을 입력하세요.">
                <input type="submit" value="검색">
            </form>
        </article>
        <!-- 검색 영역 종료 -->

        <!-- 공지사항 리스트 -->
        <article>
            <table>
                <tr>
                    <th width="50px">No</th>
                    <th>제목</th>
                    <th width="100px">작성자</th>
                    <th width="100px">작성일</th>
                    <th width="50px">조회수</th>
                </tr>
                <tr>
                    <td>00</td>
                    <td><a href="noticeDetail.no">공지사항 제목입니다.</a></td>
                    <td>최재영</td>
                    <td>YYYY/MM/DD</td>
                    <td>00</td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>공지사항 제목입니다.</td>
                    <td>최재영</td>
                    <td>YYYY/MM/DD</td>
                    <td>00</td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>공지사항 제목입니다.</td>
                    <td>최재영</td>
                    <td>YYYY/MM/DD</td>
                    <td>00</td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>공지사항 제목입니다.</td>
                    <td>최재영</td>
                    <td>YYYY/MM/DD</td>
                    <td>00</td>
                </tr>
            </table>
        </article>
        <!-- 공지사항 리스트 종료 -->
    </section>
	
	 
</body>
</html>