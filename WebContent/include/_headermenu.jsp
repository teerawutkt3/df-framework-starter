<%@page import="com.depthfirst.framework.util.StringUtil"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="_nested"%>
<%
org.apache.log4j.Logger logger = org.apache.log4j.LogManager.getLogger( "com.depthfirst.jsp" );
String ctxPath = request.getContextPath();
long random = (new java.util.Date()).getTime();
com.depthfirst.framework.ums.web.UserSession userSession = 
(com.depthfirst.framework.ums.web.UserSession)session.getAttribute(com.depthfirst.framework.ums.web.UserSession.SESSION_KEY);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title>DF STARTER [<%= java.net.Inet4Address.getLocalHost().getHostName() %>]
</title>

<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- theme bootstrap start-->
<!-- CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/lib/bootstrap4/bootstrap.min.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/lib/fontawesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/siteBarMenu.css" />

<!-- font -->
<link href="<%= request.getContextPath() %>/assets/font/fonts.css" rel="stylesheet">

<script type="text/javascript">

var ctxPath = "<%= request.getContextPath() %>";

</script >
<!-- jQuery library -->
<script src="<%= request.getContextPath() %>/assets/lib/jquery/jquery.min.js"></script>

<!-- Popper JS -->
<script src="<%= request.getContextPath() %>/assets/lib/bootstrap4/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="<%= request.getContextPath() %>/assets/lib/bootstrap4/bootstrap.min.js"></script>
<!-- theme bootstrap end-->

<!-- js framework -->
<script src="<%= request.getContextPath() %>/assets/js/win.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/util.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/struts.js"></script> 
<script src="<%= request.getContextPath() %>/assets/js/validateDate.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/validateForm.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/validateNumber.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/validatePsnId.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/Style.js"></script> 



</head>

<body id="page-top">
	<div class="wrapper">

		<!-- Sidebar -->
		<nav id="sidebar" class="shadow">
			<div class="sidebar-header">
				<!-- <h3>Bootstrap</h3> -->
<!-- 				<h3 class="text-center"> -->
				<div class="text-center">
					<img class="logo" src="<%= request.getContextPath() %>/assets/images/df_logo.png" alt="logo" style="width: 44px;">
						 DF Framework
				</div>
<!-- 				</h3> -->
			</div>

			<ul class="list-unstyled components">
<!-- 				<h3 class="text-center"> -->
<!-- 					DF Framework -->
<!-- 				</h3> -->
				<li><a href="#"> <i class="fa fa-tachometer"></i> Dashboard
				</a></li>
				<li><a href="#"> <i class="fa fa-tachometer"></i> Dashboard2
				</a></li>
				<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
					<_nested:notEmpty property="menuItems">
						<_nested:iterate id="mainItem" indexId="mainInd" property="menuItems">
							<_nested:define name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>" id="currentPage" property="currentPage" type="com.depthfirst.framework.ums.web.PageInfo" />
							<_nested:define property="code" id="moduleCode" type="String" />
							<li class="">
							<a href="#mainMenu<%= mainInd.intValue() %>" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">
							 <i class="fa fa-folder-o"></i> 
							 <span><_nested:write property="name" /></span> 
							 <span class="pull-right-container"> <!-- <i class="fa fa-angle-left pull-right"></i> --></span>
							</a>
								<ul class="collapse list-unstyled <%= currentPage!=null&&moduleCode.equals(currentPage.getModuleCode())?"show":"" %>" id="mainMenu<%= mainInd.intValue() %>">
									<_nested:iterate id="subItem" name="mainItem" indexId="subInd" property="subItemList">
										<_nested:define property="name" id="moduleCode2" type="String" />
<%-- 										<_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList"> --%>
<%-- 										</_nested:iterate> --%>
										<li class="treeview <%= currentPage!=null&&moduleCode2.equals(currentPage.getPageType())?" menu-open":"" %>">
										<a href="#homeSubmenu<%= subInd.intValue() %>" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> 
										<i class="fa fa-minus-square-o"></i> <_nested:write property="name" /> <span class="pull-right-container"> <!-- <i class="fa fa-angle-left pull-right"></i> -->
											</span>
										</a>
											<ul class="collapse list-unstyled <%= currentPage!=null&&moduleCode2.equals(currentPage.getPageType())?"show":"" %>" id="homeSubmenu<%= subInd.intValue() %>">
												<_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList">
													<_nested:define property="code" id="moduleCode3" type="String" />
													<li <%= currentPage!=null&&moduleCode3.equals(currentPage.getPageCode())?" class='active'":"" %>>
													<a data-toggle="tooltip" data-placement="right" title="<_nested:write property="name" />" href="<%= request.getContextPath() %><_nested:write property="path" />?random=<%= random %>">
														&nbsp;&nbsp;&nbsp;<i class="fa fa-circle-thin"></i> <_nested:write property="name" />
													</a></li>
												</_nested:iterate>
											</ul></li>
									</_nested:iterate>
								</ul>
							</li>
						</_nested:iterate>
					</_nested:notEmpty>
				</_nested:root>
			</ul>
		</nav>	

				<div id="content" style="width: 100%; background-color: #fbfbfb;">
					<nav class="navbar navbar-expand-lg navbar-dark bg-light shadow colorNav">
						<div class="container-fluid">
							<i class="fa fa-bars" aria-hidden="true" id="sidebarCollapse" style="color: aliceblue; cursor: pointer;"></i> <span class="d-inline-block d-lg-none ml-auto" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <i class="fa fa-bars" style="color: #fbfbfb"></i>
							</span>

							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="nav navbar-nav ml-auto">
									<li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Dashboard2</a></li>
<!-- 									<li class="nav-item"><a class="nav-link" href="#">Page</a></li> -->
<!-- 									<li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign in</a></li> -->
									<li class="nav-item dropdown">
<!-- 									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-user-o" aria-hidden="true"></i> User </a> -->
									<a class="nav-link" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-user-o" aria-hidden="true"></i> User </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="margin-left: -94px !important;">
											<a class="dropdown-item" href="#"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;Profile</a> 
											<a class="dropdown-item" href="#"><i class="fa fa-cogs" aria-hidden="true"></i>&nbsp;Setting</a> 
											<a href="javascript:doLogout();" data-toggle="modal" data-target="#logoutModal" class="dropdown-item" href="#"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;Logout</a>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</nav>
					<div class="container-fluid">
						<!-- Begin Page Content -->


						<!-- Main content -->
						<section class="content">

							<!-- Content Header (Page header) -->
							<section class="content-header content-hg">
								<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
									<ol class="breadcrumb">
									<li class="breadcrumb-item">
										<a href="#">
										<b><span class="badge badge-dark badge-pill " style="padding-top: 5px !important;"><_nested:write property="currentPage.pageCode" /></span></b>
											<_nested:present property="currentPage.moduleName">
												<_nested:write property="currentPage.moduleName" />
											</_nested:present>
										</a>
									</li>								    
								    <li class="breadcrumb-item active" aria-current="page"><_nested:write property="currentPage.pageName" /></li>
									</ol>
<%-- 										<li><_nested:write property="currentPage.pageCode" /></li> --%>
								</_nested:root>
							</section>
							<%try { %>