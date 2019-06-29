<%@ page language="java" contentType="text/html" session="true"%>
<html>
<head>
<title>Error 500 - Depth First Co., Ltd.</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="<%=request.getContextPath()%>/css/style.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/lib/bootstrap4/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/errorPage.css" />
</head>
<body>	
	<h1>Internal Server Error ( 500 )</h1>
	<p class="zoom-area">
		<b>:(</b><!--	The server has encountered an unexpected error which is preventing it from fullfilling your request.--> ระบบไม่สามารถติดต่อฐานข้อมูลได้ กดปุ่ม Refresh หรือ F5
	</p>
	<section class="error-container">
		<span>5</span> <span><span class="screen-reader-text">0</span></span> <span>0</span>
	</section>
	<div class="link-container">
		<input type="button" class="btn btn-info" value=" Back " onClick="window.history.back()">
	</div>
</body>
</html>