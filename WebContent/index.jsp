<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
String ctxPath = request.getContextPath();
long random = (new java.util.Date()).getTime();
if(com.depthfirst.framework.ums.struts.CookiesLoginAction.hasLoginCookies(request)) {
	response.sendRedirect(ctxPath+"/login.do?ms="+random);
	return;
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TIS-620" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title> DF Starter : Depth First Co., Ltd. </title>
<script language="JavaScript">
<!--
var ctxPath = "<%= ctxPath %>";
// -->
setTimeout(function() { document.getElementById('loginField').focus(); }, 10);
</script>
<script language="JavaScript" src="<%= ctxPath %>/js/win.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/util.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/struts.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/popupCalendar.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/validateForm.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/validateDate.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/js/validateNumber.js"></script>

<script language="JavaScript" src="<%= request.getContextPath() %>/lib/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- theme css-->
<link rel="stylesheet" href="<%= request.getContextPath() %>/theme/css/sb-admin-2.min.css">

<!--style for login page only-->
<style>
</style>
</head>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>
<body class="bg-gradient-primary">
<!-- deployDate[] -->
<nested:form action="/login">
<input type="hidden" name="cmd" value="doLogin" />
<nested:hidden property="urlToken" />
 <div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"> 
              </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="login" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Username..." />
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password" />
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div> 
                      
                      <input type="submit" class="btn btn-primary btn-user btn-block" value="Login" />
                 
                    <hr>
                    <a href="index.html" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </a> 
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    
                  </div>
                </div>
              </div>
            </div>
            
            
          </div>
        </div>
        
        
      </div>
      	<div class="row">
			<div class="text-white">
	 			Depth First Co., Ltd. Copyright &copy; All rights reserved.
			</div>
		</div>
      
	</div>
	
   </div>
 	
</nested:form> 

<!-- Session Count[<%= com.depthfirst.framework.ums.web.UserSession.getSessionCount() %>] -->
<%@ include file="/include/_responseMessage.jsp" %>
<script language="JavaScript">
<!--
createErrorPane(getForm());
// -->
</script>
<script language="JavaScript" type="text/javascript" src="<%= request.getContextPath() %>/lib/jquery/dist/jquery.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/lib/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
