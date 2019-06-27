<%@ page language="java" contentType="text/html" session="true"%>
<html>
<head>
<title>Error 503 - Depth First Co., Ltd.</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="<%=request.getContextPath()%>/css/style.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/lib/bootstrap4/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/errorPage.css" />
</head>
<body>

	<h1>Service Unavailable ( 503 )</h1>
	<p class="zoom-area">
		<b>:(</b>The server is currently unable to handle your request. The server is either temporarily overloaded or undergoing maintenance. Please try again later.
	</p>
	<section class="error-container">
		<span>5</span> <span><span class="screen-reader-text">0</span></span> <span>3</span>
	</section>
	<div class="link-container">
		<input type="button" class="btn btn-info" value=" Back " onClick="window.history.back()">
	</div>

</body>
</html>