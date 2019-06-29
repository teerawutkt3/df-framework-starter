<%@ page language="java" contentType="text/html" session="true"%><html>
<head>
<title>Error 404 - Depth First Co., Ltd.</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/lib/bootstrap4/bootstrap.min.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/errorPage.css" />

</head>

<body>
	<h1>Not Found ( 404 )</h1>
	<p class="zoom-area">
		<b>:)</b> The file that you requested could not be found on this server. If you provided the URL, please check to ensure that it is correct. If you followed a hypermedia link, please notify the administrator of that server of this error.
	</p>
	<section class="error-container">
		<span>4</span> <span><span class="screen-reader-text">0</span></span> <span>4</span>
	</section>
	<div class="link-container">
		<input type="button" class="btn btn-info" value=" Back " onClick="window.history.back()">
	</div>

</body>
</html>
