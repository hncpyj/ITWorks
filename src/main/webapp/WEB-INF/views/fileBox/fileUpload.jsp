<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--     import="com.kh.itworks.notice.model.vo.Notice" 
<% Notice notice = (Notice) request.getAttribute("notice"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/yourcode.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>itworks</title>
<style>
	
    .tableArea {
		width:60%;
		display: inline-block;
	}
	
	#fileboxArea {
		border: 1px solid #004771;
		display: inline-block;
        float: left;
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
		border: 1px solid #29A2F7;
		color: #29A2F7;
		background: #ffffff;
		margin: 13px;
	}
	#fileUpload {
		margin: 10px;
	}
	#selectedFileList {
		padding:5px;
		text-align:left;
		border:2px solid #c9c9c9;
		height:337px;
		overflow: auto;
	}
	#selectedFileList::-webkit-scrollbar-thumb {
    	background-color: #2f3542;
    	border-radius: 10px;
    }
    
    #selectedFileList::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	}
	
</style>
</head>
<body>
	<c:if test="${ !empty sessionScope.loginUser }">
    <jsp:include page="../common/menubar.jsp"/>
    
    <aside id="aside">
        <div id="asideBack">
            <div id="asideMenuTitle">파일보관함</div>
            <ul>
                <li><a href="selectFirst.fb" class="asideMenu">- 전사문서함</a></li>
                <li><a href="admin.fb" class="asideMenu">- 파일보관함 관리자</a></li>
            </ul>
        </div>
    </aside>
        <h1 id="fileBoxTitle">&nbsp;&nbsp;&nbsp;파일보관함</h1>
        <hr>
        <br>
    <section id="section">
    	<jsp:include page="../fileBox/folderTree.jsp"/>
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
	        
	        <!-- <div id="fileOption">
	        	<button class="btn" onclick="referer();">뒤로가기<button>
	        </div> -->
	        <form action="upload.fb" enctype="multipart/form-data" method="post" onsubmit="return checkNull();">
		        
				<div align="right">
					<input id="uploadSubmit" type="submit" value="upload">
				</div>
				<table id="fileDetailTable">
					<tr>
						<td class="tableTitle">파일 선택</td>
					</tr>
					<tr>
						<td colspan="4">
							
							<input class="textBox" id="fileUpload" multiple="multiple" type="file" name="files">
							<div id="selectedFileList"></div>
							<!-- <input type="text" id="selectedFileList" style="border:2px solid #c9c9c9;min-height:50px"/> -->
						</td>
					</tr>
				</table>
			</form>
			<br>
		</div>

    
    </article>
	<script>
	//뒤로가기
	function referer() {
	      location.href="referer.fb";
	}
	
	
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


