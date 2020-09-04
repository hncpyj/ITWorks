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
</head>
<body>
	<c:if test="${ !empty sessionScope.loginUser }">
	<input type="button" class="button" value="toggle_node" id="toggle_node" style="clear:both;" />
	<div id="demo1" class="demo">
	 <ul>
	  <li id="phtml_1">
	   <a href="#">Root node 1</a>
	   <ul>
	    <li id="phtml_2">
	     <a href="#">Child node 1</a>
	    </li>
	    <li id="phtml_3">
	     <a href="#">Child node 2</a>
	    </li>
	   </ul>
	  </li>
	  <li id="phtml_4">
	   <a href="#">Root node 2</a>
	  </li>
	 </ul>
	</div>
	
	<script type="text/javascript" class="source">
	$(function () {
	 $("#toggle_node").click(function () {
	  $("#demo1").jstree("toggle_node","#phtml_1");
	 });
	 $("#demo1")
	  .bind("open_node.jstree close_node.jstree", function (e) {
	   $("#log1").html("Last operation: " + e.type);
	  })
	  .jstree({ "plugins" : [ "themes", "html_data" ] });
	});
	</script>
	</c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
		<jsp:forward page="error.fb"/>
	</c:if>
</body>
</html>