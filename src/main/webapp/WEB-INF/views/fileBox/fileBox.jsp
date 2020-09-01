<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<title>itworks</title>
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
    
    #text1 {
        color: #004771;
        margin-left: 20px;
        font-family: "Noto Sans KR";
        
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
    th {
       border-bottom: 0.5px solid #9F9F9F;
       border-top: 0.5px solid #9F9F9F;
       color: #004771;
    }
    tr {
    	font-weight: normal;
       border-bottom: 0.5px solid #9F9F9F;
       border-top: 0.5px solid #9F9F9F;
       color: #474747;
    }
	#filebox {
		display: inline-block;
		position: relative;
		width: 205px;
	    height: 608px;
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
		 margin:5px;
	}

</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    
    <aside>
        <div id="asideBack">
            <div id="asideMenuTitle">파일보관함</div>
            <ul>
                <li><a href="#" class="asideMenu">- 전사문서함</a></li>
                <li><a href="admin.fb" class="asideMenu">- 파일보관함 관리자</a></li>
            </ul>
        </div>
    </aside>
        <h1 id="text1">파일보관함</h1>
        <br>
        <hr>
        <br>
    <section>
        <div id="fileBoxArea">
            <form id="filebox">
		    <h1 id="file_title">전사문서함</h1>
		    <div class="tree">
		      <div>
		        <input class="treebox" id="n-0" type="checkbox">
		        <label class="treelabel" for="n-0">회사공용문서</label>
		        <div class="sub">
		            <a href="#link">공지사항</a>
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
		            <a href="#link">전사자료</a>
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
        <br>
    </section>
    <article>
        <div id="fileTableArea">
        	<div id="filePath">전체 문서함/회사 공용 문서/공지사항</div>
	        <div id="fileSearch">
	        	<form action="" method="get">
	        		<select id="searchSelect">
	        			<option>검색조건</option>
	        			<option>파일명</option>
	        			<option>확장자</option>
	        			<option>문서명</option>
	        			<option>담당자</option>
	        		</select>
	        		<input id="searchText">
	        		<button id="searchBtn"><i class="fas fa-search"></i></button>
	        	</form>
	        </div>
        <br><br>
        <div id="fileOption">
        	<button class="fileOptionBtn"><a href="uploadPage.fb">파일 업로드</a></button>
        	<button class="fileOptionBtn">삭제</button>
        	<button class="fileOptionBtn">폴더 이동</button>
        	<button class="fileOptionBtn">다운로드</button>
        </div>
            <table id="fileTable">
                <thead>
                    <th><input type="checkbox"></th>
                    <th>No.</th>
                    <th>문서제목</th>
                    <th>파일제목</th>
                    <th>파일종류</th>
                    <th>담당자</th>
                    <th>조회수</th>
                    <th>등록일</th>
                </thead>
                <tbody>
                <%for(int i = 0; i < 10; i++) { %>
	                <tr>
	                    <td><input type="checkbox"></td>
	                    <td>No.</td>
	                    <td><a href="selectOne.fb">문서제목</a></td>
	                    <td>파일제목</td>
	                    <td>파일종류</td>
	                    <td>담당자</td>
	                    <td>조회수</td>
	                    <td>등록일</td>
	                </tr>
	              <% } %>
	              <%-- <% for(Notice n : list) { %>
					<tr>
						<td><%= n.getNoticeNo() %></td>
						<td><%= n.getnTitle() %></td>
						<td><%= n.getfileName() %></td>
						<td><%= n.getnType() %></td>
						<td><%= n.geteName() %></td>
						<td><%= n.getnViews() %></td>
						<td><%= n.getnDate() %></td>
					</tr>
				  <% } %> --%>
                </tbody>
            </table>
        </div>
    </article>
    
    <script>
    $(function(){
	    $("#fileTableArea td").mouseenter(function(){
	    	$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
	    }).mouseout(function(){
			$(this).parent().css({"background":"white"});
	    }).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
			console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.fb?num=" + num;
		});
    });
    
    </script>
</body>
</html>


