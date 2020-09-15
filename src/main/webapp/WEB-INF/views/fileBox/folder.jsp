<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🦋itworks</title>
<style>
   
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
    }
    aside {
        float: left;
    }
    section {
        display: inline-block;
        float: left;
    }
    #fileBox {
        background: #FFFFFF;
        border: 0.5px solid #929292;
        box-sizing: border-box;
        box-shadow: inset 0px 2px 5px rgba(0, 0, 0, 0.1);
        width: 205px;
        height: 688px;
        margin: 10px;
    }

    .text {
        color: #004771;
    }

</style>
</head>
<body>
	<c:if test="${ !empty sessionScope.loginUser }">
    <jsp:include page="../common/menubar.jsp"/>
    
    <aside>
        <div id="asideBack">
            <div id="asideMenuTitle">메뉴명</div>
            <ul>
                <li><a href="#" class="asideMenu">- 세부 메뉴명 1</a></li>
                <li><a href="#" class="asideMenu">- 세부 메뉴명 2</a></li>
                <li><a href="#" class="asideMenu">- 세부 메뉴명 3</a></li>
            </ul>
        </div>
    </aside>
    <section>
        <h1 class="text">파일보관함</h1>
        <br>
        <hr>
        <br>
        <div id="fileBoxArea">
            <p class="text">전사문서함</p>
            <div id="fileBox">전체문서함
                <dl>
                    <dt>회사공용문서<span><br></span></dt>
                    <dd>공지사항</dd>
                    <dd>문서양식
                        <dd>인사관련</dd>
                        <dd>근태관련</dd>
                        <dd>일반기안</dd>
                        <dd>경비처리</dd>
                        <dd>기타양식</dd>
                    </dd>
                    <dd>전사자료</dd>
                    <dt>사내규정<span><br></span></dt>
                    <dd>규정</dd>
                    <dd>규칙</dd>
                    <dd>지침</dd>
                    <dd>보안</dd>
                </dl>
            </div>
        </div>
        <div id="tableArea">
            <table id="">
                <thead>
                    <th><input type="checkbox"></th>
                    <th>No.</th>
                    <th>문서제목</th>
                    <th>파일제목</th>
                    <th>파일종류</th>
                    <th>부서</th>
                    <th>담당자</th>
                    <th>크기</th>
                    <th>등록일</th>
                </thead>
                <tbody>
                    <th><input type="checkbox"></th>
                    <th>No.</th>
                    <th>문서제목</th>
                    <th>파일제목</th>
                    <th>파일종류</th>
                    <th>부서</th>
                    <th>담당자</th>
                    <th>크기</th>
                    <th>등록일</th>
                </tbody>
            </table>
        </div>
    </section>
    </c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
		<jsp:forward page="error.fb"/>
	</c:if>
</body>
</html>

