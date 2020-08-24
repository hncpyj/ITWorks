<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	section{
		width: 75%;
		display: inline-block;
	}
	.inner{
        margin-top: 30px;
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
        vertical-align: middle;
    }
    #inner-title{
        color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: 500;
        font-size: 24px;
        line-height: 35px;
        margin-top: 30px;
    }
    #inner-title span{
    	margin-left: 20;
    }
    #overtimeTable{
    	width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    #overtimeTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 16px;
		line-height: 23px;
		color: #000000;
		background: white;
		width: 130px;
		height: 30px;
    }
    td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 30px;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
    .addBtn{
    	outline: 0;
    	border : 0;
    	background: #004771;
    	color: white;
    	width: 80px;
    	height: 25px;
    	margin-top: 20px;
    	font-size: 14px;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>휴직자 관리</span>
            <br>
            <hr>
            <br>
            </div>
            
            <table id="overtimeTable">
                	<tr>
                		<th>이름</th>
                		<th>소속</th>
                		<th>사유</th>
                		<th>기간</th>
                		<th>수정 및 삭제</th>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>육아휴직</td>
                		<td>2020-06-03 ~ 2020-12-03</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                </table>
                <button class="addBtn">추가</button>
		</div>
	</section>
</body>
</html>