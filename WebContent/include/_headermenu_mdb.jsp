<%@page import="com.depthfirst.framework.search.SearchCondition"%>
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
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%-- <title>SIS CCIS [<%= java.net.Inet4Address.getLocalHost().getHostName() %>]
</title> --%>
<title>
  DF Framework
</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="icon" href="<%= request.getContextPath() %>/assets/images/df_logo.png" type="image/x-icon">
<script type="text/javascript">

var ctxPath = "<%= request.getContextPath() %>";
</script>

<!-- font -->
<link href="<%= request.getContextPath() %>/assets/font/fonts.css" rel="stylesheet">

<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/css/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/icon/themify-icons/themify-icons.css">
 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/css/jquery.mCustomScrollbar.css">
 
 <!-- jQuery library -->
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/jquery/jquery.min.js"></script>

<!-- js framework -->
<script src="<%= request.getContextPath() %>/assets/js/win.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/util.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/validateDate.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/validateForm.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/validateNumber.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/validatePsnId.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/Style.js"></script>

</head>
<body>
<!-- 	<div class="fixed-button"> -->
<!-- 		<a href="https://codedthemes.com/item/gradient-able-admin-template" target="_blank" class="btn btn-md btn-primary"> -->
<!-- 			<i class="fa fa-shopping-cart" aria-hidden="true"></i> Upgrade To Pro -->
<!-- 		</a> -->
<!-- 	  </div> -->
     <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="loader-track">
            <div class="loader-bar"></div>
        </div>
    </div>
    <!-- Pre-loader end -->

<div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

            <nav class="navbar header-navbar pcoded-header">
               <div class="navbar-wrapper">
                   <div class="navbar-logo">
                       <a class="mobile-menu" id="mobile-collapse" href="#!">
                           <i class="ti-menu"></i>
                       </a>
                       <div class="mobile-search">
                           <div class="header-search">
                               <div class="main-search morphsearch-search">
                                   <div class="input-group">
                                       <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                       <input type="text" class="form-control" placeholder="Enter Keyword">
                                       <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <a href="index.html">
                           <img class="img-fluid" src="<%= request.getContextPath() %>/assets/images/df_logo.png" alt="Theme-Logo"  style="height: 40px !important;"/>
                           &nbsp;DF Framework
                       </a>
                       <a class="mobile-options">
                           <i class="ti-more"></i>
                       </a>
                   </div>

                   <div class="navbar-container container-fluid">
                       <ul class="nav-left">
                           <li>
                               <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                           </li>
<!--                            <li class="header-search"> -->
<!--                                <div class="main-search morphsearch-search"> -->
<!--                                    <div class="input-group"> -->
<!--                                        <span class="input-group-addon search-close"><i class="ti-close"></i></span> -->
<!--                                        <input type="text" class="form-control"> -->
<!--                                        <span class="input-group-addon search-btn"><i class="ti-search"></i></span> -->
<!--                                    </div> -->
<!--                                </div> -->
<!--                            </li> -->
                           <li>
                               <a href="#!" onclick="javascript:toggleFullScreen()">
                                   <i class="ti-fullscreen"></i>
                               </a>
                           </li>
                       </ul>
                       <ul class="nav-right">
                           <li class="header-notification">
                               <a href="#!">
                                   <i class="ti-bell"></i>
                                   <span class="badge bg-c-pink"></span>
                               </a>
                               <ul class="show-notification">
                                   <li>
                                       <h6>Notifications</h6>
                                       <label class="label label-danger">New</label>
                                   </li>
                                   <li>
                                       <div class="media">
                                           <img class="d-flex align-self-center img-radius" src="<%= request.getContextPath() %>/assets/images/df_logo.png" alt="Generic placeholder image">
                                           <div class="media-body">
                                               <h5 class="notification-user">John Doe</h5>
                                               <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                               <span class="notification-time">30 minutes ago</span>
                                           </div>
                                       </div>
                                   </li>
                                   <li>
                                       <div class="media">
                                           <img class="d-flex align-self-center img-radius" src="<%= request.getContextPath() %>/assets/images/df_logo.png" alt="Generic placeholder image">
                                           <div class="media-body">
                                               <h5 class="notification-user">Joseph William</h5>
                                               <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                               <span class="notification-time">30 minutes ago</span>
                                           </div>
                                       </div>
                                   </li>
                                   <li>
                                       <div class="media">
                                           <img class="d-flex align-self-center img-radius" src="<%= request.getContextPath() %>/assets/images/df_logo.png" alt="Generic placeholder image">
                                           <div class="media-body">
                                               <h5 class="notification-user">Sara Soudein</h5>
                                               <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                               <span class="notification-time">30 minutes ago</span>
                                           </div>
                                       </div>
                                   </li>
                               </ul>
                           </li>
                           
                           <li class="user-profile header-notification">
                               <a href="#!">
                                   <img src="<%= request.getContextPath() %>/assets/images/df_logo.png" class="img-radius" alt="User-Profile-Image">
                                   <span>John Doe</span>
                                   <i class="ti-angle-down"></i>
                               </a>
                               <ul class="show-notification profile-notification">
                                   <li>
                                       <a href="#!">
                                           <i class="ti-settings"></i> Settings
                                       </a>
                                   </li>
                                   <li>
                                       <a href="user-profile.html">
                                           <i class="ti-user"></i> Profile
                                       </a>
                                   </li>
                                   
                                   <li>
                                       <a href="auth-lock-screen.html">
                                           <i class="ti-lock"></i> Lock Screen
                                       </a>
                                   </li>
                                   <li>
                                       <a href="#" onclick="headerJs.logout()">
                                       <i class="ti-layout-sidebar-left"></i> Logout
                                   </a>
                                   </li>
                               </ul>
                           </li>
                       </ul>
                   </div>
               </div>
           </nav>

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu" style="padding-top: 12px !important;">
                            
<!--                             <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Layout</div> -->
                            <ul class="pcoded-item pcoded-left-item">
                                <_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
								<_nested:notEmpty property="menuItems">
									<_nested:iterate id="mainItem" indexId="mainInd" property="menuItems">
										<_nested:define name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>" id="currentPage" property="currentPage" type="com.depthfirst.framework.ums.web.PageInfo" />
										<_nested:define property="code" id="moduleCode" type="String" />
										<li class="pcoded-hasmenu <%= currentPage!=null&&moduleCode.equals(currentPage.getModuleCode())?"active pcoded-trigger":"" %>">
		                                    <a href="javascript:void(0)">
		                                        <span class="pcoded-micon"><i class="<_nested:write property="code" />"></i></span>
		                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">
			                                        <_nested:write property="name" />		                                       
		                                        </span>
		                                        <span class="pcoded-mcaret"></span>
		                                    </a>
		                                    <ul class="pcoded-submenu">
			                                    <_nested:iterate id="subItem" name="mainItem" indexId="subInd" property="subItemList">
													<_nested:define property="name" id="moduleCode2" type="String" />
				                                    <_nested:iterate id="menuItem" name="subItem" indexId="menuInd" property="subItemList">
														<_nested:define property="code" id="moduleCode3" type="String" />
														<li <%= currentPage!=null&&moduleCode3.equals(currentPage.getPageCode())?" class='active'":"" %>>
			                                            <a href="<%= request.getContextPath() %><_nested:write property="path" />?random=<%= random %>">
			                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
			                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert"><_nested:write property="name"/></span>
			                                                <span class="pcoded-mcaret"></span>
			                                            </a>
			                                        </li>
													</_nested:iterate>
												</_nested:iterate>  
		                                    </ul>
		                                </li>
										</_nested:iterate>
									</_nested:notEmpty>
								</_nested:root>                                
                            </ul>
<!--                             <div class="pcoded-navigatio-lavel" data-i18n="nav.category.forms">Forms &amp; Tables</div> -->
<!--                             <ul class="pcoded-item pcoded-left-item"> -->
<!--                                 <li> -->
<!--                                     <a href="form-elements-component.html"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span> -->
<!--                                         <span class="pcoded-mtext" data-i18n="nav.form-components.main">Form Components</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="bs-basic-table.html"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span> -->
<!--                                         <span class="pcoded-mtext" data-i18n="nav.form-components.main">Basic Table</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                             </ul> -->

<!--                             <div class="pcoded-navigatio-lavel" data-i18n="nav.category.forms">Chart &amp; Maps</div> -->
<!--                             <ul class="pcoded-item pcoded-left-item"> -->
<!--                                 <li> -->
<!--                                     <a href="chart.html"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span> -->
<!--                                         <span class="pcoded-mtext" data-i18n="nav.form-components.main">Chart</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="map-google.html"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span> -->
<!--                                         <span class="pcoded-mtext" data-i18n="nav.form-components.main">Maps</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li class="pcoded-hasmenu"> -->
<!--                                     <a href="javascript:void(0)"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span> -->
<!--                                         <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Pages</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                     <ul class="pcoded-submenu"> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="auth-normal-sign-in.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Login</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="auth-sign-up.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Register</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class=" "> -->
<!--                                             <a href="sample-page.html"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Sample Page</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </li> -->

<!--                             </ul> -->

<!--                             <div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">Other</div> -->
<!--                             <ul class="pcoded-item pcoded-left-item"> -->
<!--                                 <li class="pcoded-hasmenu "> -->
<!--                                     <a href="javascript:void(0)"> -->
<!--                                         <span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span> -->
<!--                                         <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">Menu Levels</span> -->
<!--                                         <span class="pcoded-mcaret"></span> -->
<!--                                     </a> -->
<!--                                     <ul class="pcoded-submenu"> -->
<!--                                         <li class=""> -->
<!--                                             <a href="javascript:void(0)"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">Menu Level 2.1</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li class="pcoded-hasmenu "> -->
<!--                                             <a href="javascript:void(0)"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-direction-alt"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Menu Level 2.2</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                             <ul class="pcoded-submenu"> -->
<!--                                                 <li class=""> -->
<!--                                                     <a href="javascript:void(0)"> -->
<!--                                                         <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                         <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.menu-level-31">Menu Level 3.1</span> -->
<!--                                                         <span class="pcoded-mcaret"></span> -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                             </ul> -->
<!--                                         </li> -->
<!--                                         <li class=""> -->
<!--                                             <a href="javascript:void(0)"> -->
<!--                                                 <span class="pcoded-micon"><i class="ti-angle-right"></i></span> -->
<!--                                                 <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">Menu Level 2.3</span> -->
<!--                                                 <span class="pcoded-mcaret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->

<!--                                     </ul> -->
<!--                                 </li> -->
<!--                             </ul> -->
                        </div>
                    </nav>
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                <_nested:root name="<%= com.depthfirst.framework.ums.web.UserSession.SESSION_KEY %>">
                                <div class="row">
									<div class="col-sm-12">
										<nav aria-label="breadcrumb">
										  <ol class="breadcrumb">
										    <li class="breadcrumb-item">
										    <span class="badge badge-light"><_nested:write property="currentPage.pageCode" /></span>
											    <_nested:present property="currentPage.moduleName">
													<_nested:write property="currentPage.moduleName" />
												</_nested:present>
											</li>
										    <li class="breadcrumb-item active"><_nested:write property="currentPage.pageName" /></li>
										  </ol>
										</nav>
									</div>									
								</div>
							</_nested:root>

		<% try { %>