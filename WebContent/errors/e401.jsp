<%@ page language="java" contentType="text/html; charset=TIS620" session="true"%>
<html>
<head>
<%
	String ctxPath = request.getContextPath();
%>
<script language="javascript">
   alert('ไม่ได้ใช้งานเกินเวลา!!! \n กรุณา login ใหม่');
   window.location.href="<%=ctxPath%>
	/index.jsp";
</script>
<title>Error 401 - Depth First Co., Ltd.</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="<%=request.getContextPath()%>/css/style.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/lib/bootstrap4/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/errorPage.css" />
</head>
<body>
	<h1>Unauthorized (401)</h1>
	<p class="zoom-area">
		<b>:)</b> You have requested data that requires authorization to access. Either your authorization was rejected or you need to authenticate yourself before you proceed.
	</p>
	<section class="error-container">
		<span>4</span> <span><span class="screen-reader-text">0</span></span> <span>1</span>
	</section>
	<div class="link-container">
		<input type="button" class="btn bnt-info" value=" Back " onClick="window.history.back()">
	</div>

</body>
</html>