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
	<h1 align="center">Step2 - ajax 요청 후 stream을 이용한 json 응답(json-simple library 사용)</h1>
	
	<h2>1. GET 방식의 데이터 요청</h2>
	
	<h3>1-1. 데이터 전송 없이 json 반환</h3>
	<button id="send-get-1">전송</button>
	<script>
		$("#send-get-1").click(function(){
			$.ajax({
				url: "/fourth/send/simple",
				type: "get",
				success: function(data){
					console.log(data);					
					
					let jsonObject = JSON.parse(data);
					
					console.table(jsonObject);
					
				},
				error: function(error) {
					console.log(error)
				}
			});
		});
		
	</script>
	
	<h3>1-2. 데이터 전송 없이 jsonArray 반환</h3>
	<button id="send-get-2">전송</button>
	<script>
		$("#send-get-2").click(function(){
			$.ajax({
				url: "/fourth/send/array",
				type: "get",
				success: function(data){
					console.table(data);					
					
					let jsonObject = JSON.parse(data);
					
					console.table(jsonObject);
					
				},
				error: function(error) {
					console.log(error)
				}
			});
		});
		
	</script>
	
</body>
</html>