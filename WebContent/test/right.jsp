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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/lib/bootstrap4/bootstrap.min.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/lib/fontawesome-4.7.0/css/font-awesome.min.css"/>

<!-- jQuery library -->
<script src="<%= request.getContextPath() %>/assets/lib/jquery/jquery.min.js"></script>

<!-- Popper JS -->
<script src="<%= request.getContextPath() %>/assets/lib/bootstrap4/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="<%= request.getContextPath() %>/assets/lib/bootstrap4/bootstrap.min.js"></script>

<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/css/css0.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%= request.getContextPath() %>/js/struts.js"></script>
</head>

<body>
<form method="post" action="<%= request.getContextPath() %>/test/right.jsp">
	
	<div class="container-fluid">
		
		<div class="row mt-3">
			<div class="col-sm-2 text-right"><h2>Test Right</h2></div>
			<div class="col-sm-6"></div>
		</div>
		<div class="row mt-5">
			<div class="col-sm-2 text-right">UserSession</div>
			<div class="col-sm-6"><% if(user != null) { %><textarea rows="10" cols="100" class="form-control" readonly="readonly"><%= user %></textarea><% } %></div>
		</div>
		<div class="row mt-3">
			<div class="col-sm-2 text-right">Code</div>
			<div class="col-sm-3"><input type="text" class="form-control" name="code" value="UMS001" size="5" /></div>
		</div>
		<div class="row mt-3">
			<div class="col-sm-2 text-right">Right</div>
			<div class="col-sm-6">
				<div class="row">
					<% for(int i=0; i<UserSession.RIGHTS.length; i++) { %>
						<div class="col-sm-3"> 
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" name="right"  id="<%= UserSession.RIGHTS[i] %>" />
								<label class="custom-control-label" for="<%= UserSession.RIGHTS[i] %>"><%= UserSession.RIGHT_LABELS[i] %></label>
							</div>
						</div>
					<% } %>
				</div>
			</div>
		</div>
		<br/>
		<br/>
		<br/>
		<div class="row mt-3">
			<div class="col-sm-2"></div>
			<div class="col-sm-10">
				<button type="submit" class="btn btn-success"  name="doAdd"><i class="fa fa-plus-circle"></i> Add </button>
				<button type="submit" class="btn btn-secondary"  name="doClear"><i class="fa fa-times-circle"></i> Clear </button>				
				<button type="submit" class="btn btn-info"  name="doAll"><i class="fa fa-list-alt"></i> All </button>
				<a class="btn btn-info" href="<%= request.getContextPath() %>/home.jsp?random=<%= new java.util.Date().getTime() %>"><i class="fa fa-home"></i> Home</a>
				<a class="btn btn-info" href="<%= request.getContextPath() %>/index.jsp?random=<%= new java.util.Date().getTime() %>"><i class="fa fa-sign-in"></i> Login</a>
			</div>
		</div>
	</div>
</form>
</body>
</html>
