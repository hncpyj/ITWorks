<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="jquery.jOrgChart.js"></script>
<link href="jquery.orgchart.css" rel="stylesheet">
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<style>
section {
	display: inline-block;
	width: 75%;
	margin-left: 50px;
	margin-top: 30px;
}

#middleSection {
	width: 100%;
}

.mainTitleArea {
	display: inline-block;
	width: 100%;
	margin: 0 auto;
}

.mainTitleArea span {
	font-size: 24px;
	color: #004771;
	font-weight: 400;
}

.org_map_header {
	margin-top: 30px;
	height: 40px;
}

dl, li, ol, ul {
	list-style: none;
}

.org_map_header li {
	display: inline-block;
}

#orgChart {
	width: auto;
	height: auto;
}

#orgChartContainer {
	width: 1000px;
	height: 500px;
	overflow: auto;
	background: #eeeeee;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/orgChart/common/aside.jsp"></jsp:include>
	<div id="jquery-script-menu">
		<div class="jquery-script-center">
			<ul>
				<li><a
					href="http://www.jqueryscript.net/chart-graph/Create-An-Editable-Organization-Chart-with-jQuery-orgChart-Plugin.html">Download
						This Plugin</a></li>
				<li><a href="http://www.jqueryscript.net/">Back To
						jQueryScript.Net</a></li>
			</ul>
			<div class="jquery-script-ads">
				<script type="text/javascript" async=""
					src="http://www.google-analytics.com/ga.js"></script>
				<script type="text/javascript">
				<!--
					google_ad_client = "ca-pub-2783044520727903";
					/* jQuery_demo */
					google_ad_slot = "2780937993";
					google_ad_width = 728;
					google_ad_height = 90;
				//-->
				</script>
				<script type="text/javascript"
					src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
					
				</script>
			</div>
			<div class="jquery-script-clear"></div>
		</div>
	</div>
	<h1 style="margin-top: 150px;">jQuery orgChart Plugin Demo</h1>
	<div id="orgChartContainer">
		<div id="orgChart" class="orgChart">
			<table cellpadding="0" cellspacing="0" border="0">
				<tbody>
					<tr>
						<td colspan="6"><div class="node" node-id="1">
								<h2>My Organization</h2>
								<div class="org-add-button">Add Child</div>
								<div class="org-del-button"></div>
							</div></td>
					</tr>
					<tr class="lines">
						<td colspan="6"><table cellpadding="0" cellspacing="0"
								border="0">
								<tbody>
									<tr class="lines x">
										<td class="line left half"></td>
										<td class="line right half"></td>
									</tr>
								</tbody>
							</table></td>
					</tr>
					<tr class="lines v">
						<td class="line left"></td>
						<td class="line right top"></td>
						<td class="line left top"></td>
						<td class="line right top"></td>
						<td class="line left top"></td>
						<td class="line right"></td>
					</tr>
					<tr>
						<td colspan="2"><table cellpadding="0" cellspacing="0"
								border="0">
								<tbody>
									<tr>
										<td colspan="2"><div class="node" node-id="2">
												<h2>CEO Office</h2>
												<div class="org-add-button">Add Child</div>
												<div class="org-del-button"></div>
											</div></td>
									</tr>
								</tbody>
							</table></td>
						<td colspan="2"><table cellpadding="0" cellspacing="0"
								border="0">
								<tbody>
									<tr>
										<td colspan="2"><div class="node" node-id="8">
												<h2>Division 5</h2>
												<div class="org-add-button">Add Child</div>
												<div class="org-del-button"></div>
											</div></td>
									</tr>
								</tbody>
							</table></td>
						<td colspan="2"><table cellpadding="0" cellspacing="0"
								border="0">
								<tbody>
									<tr>
										<td colspan="2"><div class="node" node-id="9">
												<h2></h2>
												<div class="org-add-button">Add Child</div>
												<div class="org-del-button"></div>
											</div></td>
									</tr>
								</tbody>
							</table></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div id="consoleOutput">
		<p>Created new node on node 1</p>
		<p>Deleted node 3</p>
		<p>Deleted node 4</p>
		<p>Deleted node 6</p>
		<p>Deleted node 7</p>
	</div>
	<script type="text/javascript">
		var testData = [ {
			id : 1,
			name : 'My Organization',
			parent : 0
		}, {
			id : 2,
			name : 'CEO Office',
			parent : 1
		}, {
			id : 3,
			name : 'Division 1',
			parent : 1
		}, {
			id : 4,
			name : 'Division 2',
			parent : 1
		}, {
			id : 6,
			name : 'Division 3',
			parent : 1
		}, {
			id : 7,
			name : 'Division 4',
			parent : 1
		}, {
			id : 8,
			name : 'Division 5',
			parent : 1
		}, {
			id : 5,
			name : 'Sub Division',
			parent : 3
		},

		];
		$(function() {
			org_chart = $('#orgChart').orgChart({
				data : testData,
				showControls : true,
				allowEdit : true,
				onAddNode : function(node) {
					log('Created new node on node ' + node.data.id);
					org_chart.newNode(node.data.id);
				},
				onDeleteNode : function(node) {
					log('Deleted node ' + node.data.id);
					org_chart.deleteNode(node.data.id);
				},
				onClickNode : function(node) {
					log('Clicked node ' + node.data.id);
				}

			});
		});

		// just for example purpose
		function log(text) {
			$('#consoleOutput').append('<p>' + text + '</p>')
		}
	</script>
	<script>
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>