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

<!-- theme css-->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/lib/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/login.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/lib/fontawesome-4.7.0/css/font-awesome.min.css">

<!-- jQuery library -->
<script src="<%= request.getContextPath() %>/assets/lib/jquery/jquery.min.js"></script>

<!-- Popper JS -->
<script src="<%= request.getContextPath() %>/assets/lib/bootstrap4/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="<%= request.getContextPath() %>/assets/lib/bootstrap4/bootstrap.min.js"></script>

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

        <div class=" o-hidden border-0 ">
          <div>
            <!-- Nested Row within Card Body -->
            <div class="row">
              
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 mb-4" style="color:#ffffff;">Welcome Back!</h1>
                  </div>
                  <br>
                  <br>
                  <form class="user">
                   <div class="container h-100">
				        <div class="d-flex justify-content-center h-100">
				            <div class="user_card">
				                <div class="d-flex justify-content-center">
				                    <div class="brand_logo_container">
				                        <img src="<%= request.getContextPath() %>/assets/images/df_logo.png" class="brand_logo" alt="Logo">
				                    </div>
				                </div>
				                <div class="d-flex justify-content-center form_container">                	
				                    <div >                    	
				                        <div class="input-group mb-3">
				                            <div class="input-group-append">
				                                <span class="input-group-text"><i class="fa fa-user-circle-o"></i></span>
				                            </div>
				                            <input type="login" name="" class="form-control input_user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Username..." >
				                        </div>
				                        <div class="input-group mb-2">
				                            <div class="input-group-append">
				                                <span class="input-group-text"><i class="fa fa-unlock-alt  fa-lg"></i></span>
				                            </div>
				                            <input type="password" class="form-control input_pass" id="exampleInputPassword" placeholder="Password">
				                        </div>
				                        <div class="form-group">
				                            <div class="custom-control custom-checkbox">
				                                <input type="checkbox" class="custom-control-input" id="customCheck">
				                                <label class="custom-control-label" for="customCheck">Remember me</label>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				                <div class="d-flex justify-content-center mt-3 login_container">               
				                      <button type="submit" class="btn login_btn"><i class="fa fa-sign-in"></i> Login</button>                            
				                </div><br>
				                <div class="d-flex justify-content-center login_container">               
				                      <a href="index.html" class="btn btn-danger btn-user btn-block">
				                       <i class="fa fa-google"></i> Login with Google
				                      </a>                         
				                </div><br>
								
				                <div class="mt-4">
				                    <div class="d-flex justify-content-center links">
				                        Don't have an account? <a href="#" class="ml-2">Sign Up</a>
				                    </div>
				                    <div class="d-flex justify-content-center links">
				                         <a class="small" href="forgot-password.html">Forgot Password?</a>
				                    </div>
				                </div>
				            </div>            
				        </div>        
				    </div>
    
                  </form>
                  
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
</body>
</html>
