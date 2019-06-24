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
<title> DF STARTER [<%= java.net.Inet4Address.getLocalHost().getHostName() %>] </title> 

<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/font-awesome/css/fontawesome-all.min.css">

<!-- theme css-->
<link rel="stylesheet" href="<%= request.getContextPath() %>/theme/css/sb-admin-2.min.css">
 
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/select2/dist/css/select2.min.css"> 
<link rel="stylesheet" href="<%= request.getContextPath() %>/lib/sweetalert2/sweetalert2.min.css">
<link rel="stylesheet"href="<%= request.getContextPath() %>/css/custom.css">

<script language="JavaScript">
<!--
var ctxPath = "<%= ctxPath %>";
// -->
</script>

</head>

<body id="page-top">
	<div class="wrapper">

 <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">DF FRAMEWORK <sup>starter</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>
	<%-- <_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
	<_nested:notEmpty property="menuItems">
						<_nested:iterate id="mainItem" indexId="mainInd" property="menuItems">
							<_nested:define name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>" id="currentPage" property="currentPage" type="com.depthfirst.framework.ums.web.PageInfo" />
							<_nested:define property="code" id="moduleCode" type="String" />
							<li class="nav-item <%= currentPage!=null&&moduleCode.equals(currentPage.getModuleCode())?" active menu-open":"" %>">
								<a href="#">
									<i class="fa fa-<_nested:write property="code" />" aria-hidden="true"></i>
									<span><_nested:write property="name" /></span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								
								<ul class="treeview-menu" <%= currentPage!=null&&moduleCode.equals(currentPage.getModuleCode())?" style='overflow: hidden; display: block;'":"" %>>
									<_nested:iterate id="subItem" name="mainItem" indexId="subInd" property="subItemList">
										<_nested:define property="name" id="moduleCode2" type="String" />
					              		<_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList">
										</_nested:iterate>
							            <li class="treeview <%= currentPage!=null&&moduleCode2.equals(currentPage.getPageType())?" menu-open":"" %>">
					              			<a href="#">
					              				<_nested:write property="name" />
							                	<span class="pull-right-container">
							                  		<i class="fa fa-angle-left pull-right"></i>
							                	</span>
						              		</a>
											<ul class="treeview-menu" <%= currentPage!=null&&moduleCode2.equals(currentPage.getPageType())?" style='overflow: hidden; display: block;'":"" %>>
						              		<_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList">
												<_nested:define property="code" id="moduleCode3" type="String" />
												<li<%= currentPage!=null&&moduleCode3.equals(currentPage.getPageCode())?" class='active'":"" %>><a data-toggle="tooltip" data-placement="right" title="<_nested:write property="name" />" href="<%= request.getContextPath() %><_nested:write property="path" />?random=<%= random %>"> <_nested:write property="name" /></a></li>
											</_nested:iterate>
											</ul>
							            </li>
									</_nested:iterate>
								</ul>
							</li>
						</_nested:iterate>
					</_nested:notEmpty>
	</_nested:root> --%>
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="utilities-color.html">Colors</a>
            <a class="collapse-item" href="utilities-border.html">Borders</a>
            <a class="collapse-item" href="utilities-animation.html">Animations</a>
            <a class="collapse-item" href="utilities-other.html">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

	
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun · 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
            <_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><_nested:write property="login" /></span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="<%= ctxPath %>/password.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="<%= ctxPath %>/password.jsp">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript:doLogout();" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
              </_nested:root>
            </li> 
          </ul>

        </nav>
        <!-- End of Topbar -->
        
        
		<%-- <header class="main-header fix-top">
			<!-- Logo -->
			<a href="index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini">DF</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>DF </b>STARTER</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <i class="fas fa-bars"></i><span class="sr-only">Toggle navigation</span>
				</a>

				<div class="navbar-custom-menu user-login">
						<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">				
						<span class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
								<i class="fa fa-user-circle" aria-hidden="true"></i>
								<span class="hidden-xs">
									�Թ�յ�͹�Ѻ : <_nested:write property="login" /> 
				                  	<a class="change-pass" href="<%= ctxPath %>/password.jsp"> <i class="fa fa-key" aria-hidden="true"></i> ����¹���ʼ�ҹ</a>
									<a class="logout" id="logout" href="javascript:doLogout();"> <i class="fa fa-sign-out" aria-hidden="true"></i> �͡�ҡ�к�</a>
								</span>
							</a>
						</span>
						</_nested:root>
						
						<!-- User Account: style can be found in dropdown.less -->
						<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
							<span class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<span class="hidden-xs">
										<i class="fa fa-user-circle" aria-hidden="true"></i> <_nested:write property="login" />
									</span>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header">
									<div style="background: url('<%= request.getContextPath() %>/images/user-male.png'); height: 150px; background-size: cover; border-radius: 50%; width: 150px; background-position: center; display: inline-block; margin: 10px;"></div>
										<p style="font-weight: bold; color: white;"><_nested:write property="login" /></p>
									</li>
									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a href="<%= ctxPath %>/password.jsp" class="btn btn-warning btn-flat">เปลี่ยนรหัสผ่าน</a>
										</div>
										<div class="pull-right">
											<a href="javascript:doLogout();" class="btn btn-danger btn-flat">ออกจากระบบ</a>
										</div>
									</li>
								</ul>
							</span>
						</_nested:root>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar bd-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">MAIN MENU</li>
					<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
					<_nested:notEmpty property="menuItems">
						<_nested:iterate id="mainItem" indexId="mainInd" property="menuItems">
							<_nested:define name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>" id="currentPage" property="currentPage" type="com.depthfirst.framework.ums.web.PageInfo" />
							<_nested:define property="code" id="moduleCode" type="String" />
							<li class="treeview <%= currentPage!=null&&moduleCode.equals(currentPage.getModuleCode())?" active menu-open":"" %>">
								<a href="#">
									<i class="fa fa-<_nested:write property="code" />" aria-hidden="true"></i>
									<span><_nested:write property="name" /></span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
								
								<ul class="treeview-menu" <%= currentPage!=null&&moduleCode.equals(currentPage.getModuleCode())?" style='overflow: hidden; display: block;'":"" %>>
									<_nested:iterate id="subItem" name="mainItem" indexId="subInd" property="subItemList">
										<_nested:define property="name" id="moduleCode2" type="String" />
					              		<_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList">
										</_nested:iterate>
							            <li class="treeview <%= currentPage!=null&&moduleCode2.equals(currentPage.getPageType())?" menu-open":"" %>">
					              			<a href="#">
					              				<_nested:write property="name" />
							                	<span class="pull-right-container">
							                  		<i class="fa fa-angle-left pull-right"></i>
							                	</span>
						              		</a>
											<ul class="treeview-menu" <%= currentPage!=null&&moduleCode2.equals(currentPage.getPageType())?" style='overflow: hidden; display: block;'":"" %>>
						              		<_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList">
												<_nested:define property="code" id="moduleCode3" type="String" />
												<li<%= currentPage!=null&&moduleCode3.equals(currentPage.getPageCode())?" class='active'":"" %>><a data-toggle="tooltip" data-placement="right" title="<_nested:write property="name" />" href="<%= request.getContextPath() %><_nested:write property="path" />?random=<%= random %>"> <_nested:write property="name" /></a></li>
											</_nested:iterate>
											</ul>
							            </li>
									</_nested:iterate>
								</ul>
							</li>
						</_nested:iterate>
					</_nested:notEmpty>
					</_nested:root>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside> --%>
 
		 <!-- Begin Page Content -->
        <div class="container-fluid">
		

			<!-- Main content -->
			<section class="content">
			
				<!-- Content Header (Page header) -->
			<section class="content-header content-hg">
				<_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
					<h1>
						<_nested:present property="currentPage.moduleName"><_nested:write property="currentPage.moduleName" />&nbsp;>>&nbsp;</_nested:present>
						<_nested:write property="currentPage.pageName" /></span>
					</h1>
					<ol class="breadcrumb">
						<li><_nested:write property="currentPage.pageCode" /></li>
					</ol>
				</_nested:root>
			</section>
<%try { %>
