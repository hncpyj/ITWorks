<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>                                                                                                                                                                                                              
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#menuTitle {
        width: 100%; 
        margin: 0 auto;
    }
    #menuTitle>span {
        font-size: 24px; 
        color: #004771; 
        padding-left: 90px; 
        font-weight: 400;
    }

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<section>
		<article style="margin-top: 30px;">
			<div id="menuTitle">
				<span style="">마이페이지</span>
				<div style="margin-top: 10px;">
					<hr style="width: 90%; margin-top: 30px; margin: auto; color: #929292;">
				</div>
			</div>
		</article>	
		
		<article style="margin-top: 200px;">
			<div style="width: 600px; height: 300px; background: white; margin: auto; box-shadow: 2px 2px 10px #929292;" align="center">
				<img src="${ contextPath }/resources/images/cautionIcon.png" style="margin-top: 80px; margin-right: 10px;"><span style="color: #004771; font-weight: bold;">개인정보 보호를 위해 비밀번호를 입력 해 주세요.</span><br>
				<input type="password" name="epwd" style="width: 350px; margin-top: 20px;"><br>
				<button type="button" onclick="checkPwd()" style="margin-top: 40px; margin-right: 10px; border: none; box-shadow: 1px 1px 1px #929292; width: 70px; height: 30px; background: #004771; color: white;">확인</button>
				<button type="button" onclick="history.go(-1)" style="border: none; box-shadow: 1px 1px 1px #929292; width: 70px; height: 30px;">취소</button>
			</div>
		</article>

		<script>
			function checkPwd() {
				var mno = ${ loginUser.mno };
				var pwd = $("input[type='password']").val();
				
				$.ajax({
					url: "myPageCheckPwd.me",
					type: "post",
					data: {mno: mno, pwd: pwd},
					success: function(data) {
						if(data.result) {
							location.href="goMyPage.me";
						} else {
							alert("비밀번호를 확인 해 주세요.");
						}
					},
					error: function(data) {
						console.log("실패");
					}
				});
			}
		</script>
		
	</section>
	<br><br><br><br><br><br><br>
</body>
</html>