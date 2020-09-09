<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>jsTree test</title>
  <!-- 2 load the theme CSS file -->
  <link rel="stylesheet" href="dist/themes/default/style.min.css" />
  <style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); font-family: 'Noto Sans KR', sans-serif;
   * {
        margin: 0px;
        font-family: "Noto Sans KR";
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
    }
    aside {
        float: left;
    }
    section {
        display: inline-block;
        float: left;
    }
    
    #fileBoxTitle {
        color: #004771;
        margin: 20px;
        
    }
	#fileboxArea {
		border: 1px solid #004771;
		display: inline-block;
        float: left;
	}
	#fileTableArea {
		width:60%;
		display: inline-block;
	}
	#filePath{
		display: inline-block;
		font-weight: bold; 
        color: #004771;
	}
	#fileSearch{
		text-align: right;
		
	}
	#searchSelect{
		border: 1px solid #9F9F9F;
		color: #29A2F7;
	}
	
	#searchText {
		border: 1px solid #29A2F7;
		
	  	border-radius: 10px;
	}
	/* 
	#searchBtn {
		content: '\f002';
	} */
	
	#fileTable {
        width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    #thead {
       border-bottom: 0.5px solid #9F9F9F;
       border-top: 0.5px solid #9F9F9F;
       color: #004771;
    }
    .tbody {
       border-bottom: 0.5px solid #9F9F9F;
       border-top: 0.5px solid #9F9F9F;
       color: #929292;
    }
    
	#filebox {
		display: inline-block;
		position: relative;
		width: 205px;
	    height: 408px;
		margin: 20px;
		margin-left: 40px;
		padding: 20px;
		border-top: 10px solid #004771;
	    border-left: 0.5px solid #929292;
	    border-bottom: 0.5px solid #929292;
	    border-right: 0.5px solid #929292;
	    background: #FFFFFF;
		box-shadow: inset 0px 2px 5px rgba(0, 0, 0, 0.1);
	}
	
	
	#file_title {
	  margin: 0;
	  padding-bottom: 20px;
	  border-bottom: 1px solid #004771;
	  color: #004771;
	  font-size: 1.1em;
	}
	
	.tree {
	  padding: 20px 0;
	}
	
	.tree::after {
	  content: '';
	  display: block;
	  clear: left;
	}
	
	.tree div {
	  clear: left;
	}
	
	#filebox input[type="checkbox"] {
	  position: absolute;
	  left: -9999px;
	}
	
	#filebox label, a {
	  display: block;
	  float: left;
	  clear: left;
	  position: relative;
	  margin-left: 25px;
	  padding: 5px;
	  border-radius: 5px;
	  color: #004771;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	#filebox label::before, a::before {
	  display: block;
	  position: absolute;
	  top: 6px;
	  left: -25px;
	  font-family: 'FontAwesome';
	}
	
	#filebox label::before {
	  content: '\f07b'; /* closed folder */
	}
	
	#filebox input:checked + label::before {
	  content: '\f07c'; /* open folder */
	}
	
	#filebox a::before {
	  content: '-'; /* dash */
	}
	
	#filebox input:focus + label, a:focus {
	  outline: none;
	  background-color: #e8ebed;
	}
	
	#filebox .sub {
	  display: none;
	  float: left;
	  margin-left: 30px;
	}
	
	#filebox input:checked ~ .sub {
	  display: block;
	}
	
	#filebox input[type="reset"] {
	  display: block;
	  width: 100%;
	  padding: 5px;
	  border: none;
	  border-radius: 10px;
	  color: #e8ebed;
	  background-color: #29A2F7;
	  font-family: inherit;
	  font-size: .9em;
	  cursor: pointer;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	}
	
	#filebox input[type="reset"]:focus {
	  outline: none;
	  box-shadow: 0 0 0 4px #b9c3c9;
	}
	#fileTable input {
		font-size: 0em;
		font-weight: lighter;
		
	}
	#fileOption{
		text-align: right;
	}
	.fileOptionBtn{
		background:none;
		 border: none;
		 color: #004771;
		 margin:0px;
	}

</style>
</head>
<body>
	<div id="fileBoxArea">
            <form id="filebox">
		    <h1 id="file_title">전사문서함</h1>
		    <div class="tree">
		      <div>
		        <input class="treebox" id="n-0" type="checkbox">
		        <label class="treelabel" for="n-0">회사공용문서</label>
		        <div class="sub">
		            <a href="#link">전사자료</a>
		            <div>
		              <input class="treebox" id="n-0-1" type="checkbox">
		              <label class="treelabel" for="n-0-1">문서양식</label>
		              <div class="sub">
		                <a href="#link">인사관련</a>
		                <a href="#link">근태관련</a>
		                <a href="#link">일반기안</a>
		                <a href="#link">경비처리</a>
		                <a href="#link">기타양식</a>
		              </div>
		            </div>
		          </div>
		      </div>
		      <div>
		        <input class="treebox" id="n-1" type="checkbox">
		        <label class="treelabel" for="n-1">사내규정</label>
		        <div class="sub">
		          <a href="#link">규정</a>
		          <a href="#link">규칙</a>
		          <a href="#link">지침</a>
		          <a href="#link">보안</a>
		        </div>
		      </div>
		      <div>
		        <input class="treebox" id="n-2" type="checkbox">
		        <label class="treelabel" for="n-2">기능속성</label>
		        <div class="sub">
		          <a href="#link">기능1</a>
		          <a href="#link">기능2</a>
		        </div>
		      </div>
		    </div>
		    <input type="reset" class="treebox" id="collapse" value="Collapse All">
		  </form>
        </div>
</body>
</html>