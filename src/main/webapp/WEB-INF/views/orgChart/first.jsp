<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">Step1 - ajax 요청 후 stream을 이용한 문자열 응답</h1>
	
	<h2>1. GET 방식의 데이터 요청</h2>
	
	<h3>1-1. 데이터 전송 없이 문자열 반환</h3>
	<button id="send-get-1">전송</button>
	<script>
		$("#send-get-1").click(function(){
			$.ajax({
				url: "/first/send",
				type: "get",
				success: function(data){
					alert(data)
				},
				error: function(error) {
					console.log(error)
				}
			});
		});
		
	</script>
	
	<br>
	
	<h3>1-2. PathVariable로 데이터 전송 후 문자열 반환</h3>
	<input type="text" id="message-get-2"><button id="send-get-2">메세지전송</button>
	<script>
		$("#send-get-2").click(function(){
			var message = $("#message-get-2").val();
			
			$.ajax({
				url: "/first/send/" + message,
				type: "get",
				success: function(data) {
					alert(data);
				},
				error: function(error) {
					console.log(error);
				}
			});
			
		});
	</script>
	
	<br>
	
	<h3>1-3. data로 값 전송 후 문자열 반환</h3>
	<input type="text" id="message-get-3"><button id="send-get-3">메세지전송</button>
	<script>
		$("#send-get-3").click(function(){
			var message = $("#message-get-3").val();
			
			$.ajax({
				url: "/first/send/message",
				type: "get",
				data: {message: message},
				success: function(data) {
					alert(data);
				},
				error: function(error) {
					console.log(error);
				}
			});
			
		});
	</script>
	
	<hr>
	
	<h2>2. POST 방식의 데이터 요청</h2>
	
	<h3>2-1. 데이터 전송 없이 문자열 반환</h3>
	<button id="send-post-1">전송</button>
	<script>
		$("#send-post-1").click(function(){
			$.ajax({
				url: "/first/send",
				type: "post",
				success: function(data){
					alert(data)
				},
				error: function(error) {
					console.log(error)
				}
			});
		});
		
	</script>
	
	<h3>2-2. PathVariable로 데이터 전송 후 문자열 반환</h3>
	<input type="text" id="message-post-2"><button id="send-post-2">메세지전송</button>
	<script>
		$("#send-post-2").click(function(){
			var message = $("#message-post-2").val();
			
			$.ajax({
				url: "/first/send/" + message,
				type: "post",
				success: function(data) {
					alert(data);
				},
				error: function(error) {
					console.log(error);
				}
			});
			
		});
	</script>
	
	<h3>2-3. data로 값 전송 후 문자열 반환</h3>
	<input type="text" id="message-post-3"><button id="send-post-3">메세지전송</button>
	<script>
		$("#send-post-3").click(function(){
			var message = $("#message-post-3").val();
			
			$.ajax({
				url: "/first/send/message",
				type: "post",
				data: {message: message},
				success: function(data) {
					alert(data);
				},
				error: function(error) {
					console.log(error);
				}
			});
			
		});
	</script>
	
</body>
</html>