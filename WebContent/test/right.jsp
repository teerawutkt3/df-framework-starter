<%@ page import="com.depthfirst.framework.ums.web.*,org.springframework.context.*,org.springframework.web.context.support.*,com.depthfirst.framework.ums.service.*,com.depthfirst.framework.ums.domain.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="_authorized.jsp" %><%
ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
IUserManagementService ums = (IUserManagementService)applicationContext.getBean("UserManagementService");

UserSession user = (UserSession)session.getAttribute(UserSession.SESSION_KEY);
if(request.getParameter("doClear") != null) session.setAttribute(UserSession.SESSION_KEY, user=null);
if(request.getParameter("doAdd")!=null || request.getParameter("doAll")!=null) {
	if(user == null) {
		user = new UserSession();
		user.setLogin("test");
		user.setRealName("ทดสอบระบบ");
		user.setPosition("เจ้าหน้าที่ทดสอบระบบ");
		user.setIpAddress(request.getRemoteAddr());
		session.setAttribute(UserSession.SESSION_KEY, user);
	}
	if(request.getParameter("doAdd") != null) {
		int right = 0;
		String rvals[] = request.getParameterValues("right");
		for(int i=0; rvals!=null && i<rvals.length; i++) right = right|Integer.parseInt(rvals[i]);
		user.addRight(request.getParameter("code"), right);
	}
	if(request.getParameter("doAll") != null) {
		int right = 0;
		for(int i=0; i<UserSession.RIGHTS.length; i++) right = right|UserSession.RIGHTS[i];
		UmsPage pages[] = (UmsPage[])ums.listBaseDomain(UmsPage.class).toArray(new UmsPage[]{});
		for(int p=0; p<pages.length; p++) user.addRight(pages[p].getCode(), right);
	}

	ums.loadMenuItems(user);
}

if(user!=null && request.getParameter("doSetPerType")!=null) {
	int ptRight = 0;
	String rvals[] = request.getParameterValues("ptRight");
	for(int i=0; rvals!=null && i<rvals.length; i++) ptRight = ptRight|Integer.parseInt(rvals[i]);
	user.setPersonTypeRight(ptRight);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.depthfirst.framework.web.UmsActionServletContextListener"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
<title>Test Right</title>

<!-- theme css-->

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

<%-- <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css"> --%>
<%-- <link href="<%= request.getContextPath() %>/css/css0.css" rel="stylesheet" type="text/css"> --%>
<script language="JavaScript" src="<%= request.getContextPath() %>/assets/js/struts.js"></script>
</head>

<body>
<form method="post" action="<%= request.getContextPath() %>/test/right.jsp">
	
	<div class="container-fluid">
		
		<div class="row mt-3">
			<div class="col-sm-2 text-right"><h2>Test Right</h2></div>
			<div class="col-sm-6"></div>
		</div>
		<div class="row mt-5">
			<div class="col-sm-4 ">
				<div class="row mt-3">
					<div class="col-sm-2 text-right"></div>
					<div class="col-sm-10">Code<input type="text" class="form-control" name="code" value="UMS001" size="5" /></div>
				</div>	
				<div class="row mt-3">
					<div class="col-sm-2 text-right"></div>
					<div class="col-sm-10">
					Right
							<% for(int i=0; i<UserSession.RIGHTS.length; i++) { %>
								<div class="row">
									<div class="col-lg-12">
									<div class="checkbox-fade fade-in-primary">
		                                 <label>
		                                     <input type="checkbox" name="right"  id="<%= UserSession.RIGHTS[i] %>" >
		                                     <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
		                                     <span class="text-inverse"><%= UserSession.RIGHT_LABELS[i] %></span>
		                                 </label>
		                             </div>
									</div>
								</div>
							<% } %>
					</div>
				</div>			
			</div>
<!-- 			<div class="col-sm-2 text-right"> -->
<!-- 			UserSession -->
<!-- 			</div> -->
			<div class="col-sm-7">
				UserSession
				<% if(user != null) { %><textarea rows="10" cols="100" class="form-control" readonly="readonly"><%= user %></textarea><% } %>
			</div>
		</div>		
		
		<div class="row mt-1">
			<div class="col-lg-1"></div>
			<div class="col-lg-11">
				<button type="submit" class="btn btn-success"  name="doAdd"><i class="fa fa-plus-circle"></i> Add </button>
				<button type="submit" class="btn btn-secondary"  name="doClear"><i class="fa fa-times-circle"></i> Clear </button>				
				<button type="submit" class="btn btn-info"  name="doAll"><i class="fa fa-list-alt"></i> All </button>
				<a class="btn btn-info" href="<%= request.getContextPath() %>/home.jsp?random=<%= new java.util.Date().getTime() %>"><i class="fa fa-home"></i> Home</a>
				<a class="btn btn-info" href="<%= request.getContextPath() %>/index.jsp?random=<%= new java.util.Date().getTime() %>"><i class="fa fa-sign-in"></i> Login</a>			
			</div>
		</div>
		
</form>
</body>
</html>
