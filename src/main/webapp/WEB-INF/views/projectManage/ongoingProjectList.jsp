<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<style>
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
    #searchArea {
        width: 1012px; 
        height: 256px; 
        border: 0.5px solid #929292; 
        margin-top: 30px;
        margin: 0 auto; 
        box-shadow: 1px 4px 5px lightgray;
    }
    #searchArea>label {
        display: inline-block;
        margin-top: 13px;
        margin-left: 25px;
        font-size: 13px;
        font-weight: 600;
        width: 100px;
    }
    #searchArea>input {
        width: 171px;
    }
    .memberSearchBtn {
        width: 62px; 
        height: 25px; 
        background: #004771; 
        border: none; 
        color: white;
        margin-left: 10px;
        box-shadow: 1px 1px 5px lightgray;
        border-radius: 3px 3px;
    }
    article:nth-child(2)>button {
        width: 65px; 
        height: 30px; 
        background: #004771; 
        border: none; 
        color: white;
        margin-left: 87.5%;
        margin-top: 10px;
    }
    article:last-child table td {
        text-align: center;
    }
    #projectList tr td:nth-child(3) {
        text-align: left;
        padding-left: 20px;
    }
    #projectList {
        margin: 0 auto;
        font-size: 13px;
        border-top: 3px solid #929292;
        border-bottom: 3px solid #929292;
        border-collapse: collapse;
    }
    #projectList th {
        border-bottom: 3px solid #929292;
        background: white;
    }
    #projectList tr {
        height: 20px;
        border-bottom: 1px solid #929292;
    }
    #asideBack ul li:nth-child(2) {
        font-weight: bold;
    }
    button {
        cursor: pointer;
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="projectListAside.jsp"/>

    <section>
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>진행 프로젝트</span>
                <button>신규</button>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>

        <article style="margin-top: 30px;">
            <div id="searchArea">
                <label>기간</label><input type="date">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input type="date"><br>
                <label>프로젝트명</label><input type="text" style="width: 375px;"><br>
                <label style="width: 96px;">진행상태</label>
                <select name="" id="" style="width: 179px; height: 25px;">
                    <option value="">예정</option>
                    <option value="">진행</option>
                    <option value="">완료</option>
                    <option value="">보류</option>
                    <option value="">완료</option>
                </select><br>
                <label>작성자</label><input type="text"><button class="memberSearchBtn">조회</button><br>
                <label>담당자</label><input type="text"><button class="memberSearchBtn">조회</button><br>
                <label>참여자</label><input type="text"><button class="memberSearchBtn">조회</button><br>
                <label>담당부서</label><input type="text"><br>
            </div>
            <button>조회</button>
        </article>

        <article style="margin-top: 30px;">
            <table id="projectList" style="width: 1010px; height: 503px;">
                <tr>
                    <th width="60px">No</th>
                    <th width="100px">상태</th>
                    <th>프로젝트명</th>
                    <th width="100px">작성자</th>
                    <th width="200px">기간</th>
                </tr>
                <tr>
                    <td>10</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>2020/00/00 ~ 2020/00/00</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                    <td>temp</td>
                </tr>
            </table>
        </article>
    </section>
    <br><br><br><br><br><br><br><br><br><br>
</body>
</html>