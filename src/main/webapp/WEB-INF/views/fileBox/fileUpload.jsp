<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--     import="com.kh.itworks.notice.model.vo.Notice" 
<% Notice notice = (Notice) request.getAttribute("notice"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    
    .tableArea {
		width:60%;
		display: inline-block;
	}
	
	#fileboxArea {
		border: 1px solid #004771;
		display: inline-block;
        float: left;
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
	
	.tableTitle {
		width: 100xp;
		background: #f4f4f4;
	}
	
	#fileDetailTable{
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
	
	#back {
		background:none;
		 border: none;
		 color: #004771;
		 margin:5px;
		text-align: right;
	}
	#fileOption{
		text-align: right;
	}
	.textBox {
		border: none;
		width: 99%;
		
	}
	#uploadSubmit {
		align: right;
	}
	
</style>
</head>
<body>
	<c:if test="${ !empty sessionScope.loginUser }">
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
        <div class="tableArea">
        	<div id="filePath">전체 문서함/회사 공용 문서/전사자료</div>
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
	        	<button><a href="selectFirst.fb">뒤로가기</a><button>
	        </div>
	        <form action="upload.fb" enctype="multipart/form-data" method="post" onsubmit="return checkNull();">
		        
				<table id="fileDetailTable">
					<tr>
						<td class="tableTitle">파일 선택</td>
					</tr>
					<tr>
						<td colspan="4">
							
							<div id="selectedFileList" style="border:2px solid #c9c9c9;min-height:100px"></div>
							<input class="textBox" id="fileUpload" multiple="multiple" type="file" name="files">
							<!-- <input type="text" id="selectedFileList" style="border:2px solid #c9c9c9;min-height:50px"/> -->
						</td>
					</tr>
				</table>
				<br>
				<div align="right">
					<input id="uploadSubmit" type="submit" value="upload">
				</div>
			</form>
			<br>
		</div>

    
    </article>
	<script>
    //파일 업로드 시  div에 파일명 출력
    $("#fileUpload").change(function() {
       var fileList = $("#fileUpload")[0].files;
       
       for(var i = 0; i < fileList.length; i++) {
          $("#selectedFileList").wrapInner().append("<div><img src='${contextPath}/resources/fileBox/disk.png'>&nbsp;&nbsp;"
                                     + fileList[i].name + "</div>");
          console.log(fileList[i].name);
       }
    });
    
    //파일선택 클릭 시 파일명 출력 div 초기화
    $("#fileUpload").click(function() {
       $("#selectedFileList").empty();
    })
    
    </script>
    
    <!-- <script>
	$(document).ready(function(){
	    
	    //use jQuery MultiFile Plugin 
	    $('#multiform input[name=file]').MultiFile({
	        max: 5, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
	        accept: 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
	        maxfile: 1024, //각 파일 최대 업로드 크기
	        maxsize: 3024,  //전체 파일 최대 업로드 크기
	        STRING: { //Multi-lingual support : 메시지 수정 가능
	            remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
	            duplicate : "$file 은 이미 선택된 파일입니다.", 
	            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
	            selected:'$file 을 선택했습니다.', 
	            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
	            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
	            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
	        },
	        list:"#afile3-list" //파일목록을 출력할 요소 지정가능
	    });
	});
	</script>
    <script>
	
	/*jQuery form 플러그인을 사용하여 폼데이터를 ajax로 전송*/
	
	var downGroupCnt =0; //다운로드그룹 개수카운트
	
	$(function(){
	    
	    //폼전송 : 해당폼의 submit 이벤트가 발생했을경우 실행  
	    $('#multiform').ajaxForm({
	       cache: false,
	       dataType:"json",
	       //보내기전 validation check가 필요할경우
	       beforeSubmit: function (data, frm, opt) {
	           //console.log(data);
	           alert("전송전!!");
	           return true;
	       },
	       //submit이후의 처리
	       success: function(data, statusText){
	           
	           alert("전송성공!!");
	           console.log(data); //응답받은 데이터 콘솔로 출력         
	           
	           output(data); //받은 정보를 화면 출력하는 함수 호출
	       },
	       //ajax error
	       error: function(e){
	           alert("에러발생!!");
	           console.log(e);
	       }                               
	    });
	});
	
	//전달받은 정보를 가지고 화면에 보기 좋게 출력
	function output(data) {
	    //업로드한 파일을 다운로드할수있도록 화면 구성
	    $("#result").append("<h3>("+(++downGroupCnt)+") 다운로드</h3>");
	    $("#result").append("제목:"+data.title+"<br/>");
	    $("#result").append("설명:"+data.description+"<br/>");
	  
	    if(data.file && data.file.length != 0){
	        $("#result").append("파일:<br/>");           
	        $.each(data.file, function(index, item){
	            //var link = "fileDownload2?f="+item.fileName+"&of="+item.uploadedFileName;
	            $("#result").append("<a href='"+ item.downlink +"' download>"+item.fileName+"</a>");
	           $("#result").append("<br/>");                   
	        });
	    }       
	    
	    $('#multiform')[0].reset(); //폼 초기화(리셋);
	    //$('#multiform').resetForm(); //(jQuery.Form 플러그인 메서드)
	    //$('#multiform').clearForm(); //(jQuery.Form 플러그인 메서드)  
	    $('#multiform input:file').MultiFile('reset'); //멀티파일 초기화        
	}
	</script> -->
    </c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
		<jsp:forward page="error.fb"/>
	</c:if>
</body>
</html>


