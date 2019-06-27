<%@ page language="java" contentType="text/html" session="true"%>
<html>
<head>
<title>Error 403 - Depth First Co., Ltd.</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="<%=request.getContextPath()%>/css/style.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/lib/bootstrap4/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/errorPage.css" />
</head>
<body>

	<h1>Unauthorized (403)</h1>
	<p class="zoom-area">
		<b>:)</b> You have requested data that the server has decided not to provide to you. Your request was understood and denied.
	</p>
	<section class="error-container">
		<span>4</span> <span><span class="screen-reader-text">0</span></span> <span>3</span>
	</section>
	<div class="link-container">
		<input type="button" class="btn btn-info" value=" Back " onClick="window.history.back()">
	</div>
</body>
</html>