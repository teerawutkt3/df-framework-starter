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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=5; IE=EDGE ;IE=9; IE=EmulateIE9; IE=8; IE=EmulateIE8; IE=7; IE=EmulateIE7; IE=11; IE=EmulateIE10; IE=10; IE=EmulateIE11; IE=EmulateIE8" />
<!-- <meta http-equiv="x-ua-compatible" content="ie=edge"> -->
<title>lec.dla.go.th (Local Education Center Information System) </title>

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
 
 
<script language="JavaScript">
<!--
var ctxPath = "<%= ctxPath %>";
// -->
setTimeout(function() { document.getElementById('loginField').focus(); }, 10);
</script>
<script language="JavaScript" src="<%= ctxPath %>/assets/js/win.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/assets/js/util.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/assets/js/struts.js"></script>
<%-- <script language="JavaScript" src="<%= ctxPath %>/assets/js/popupCalendar.js"></script> --%>
<script language="JavaScript" src="<%= ctxPath %>/assets/js/validateForm.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/assets/js/validateDate.js"></script>
<script language="JavaScript" src="<%= ctxPath %>/assets/js/validateNumber.js"></script>

<link href="<%= request.getContextPath() %>/assets/font/fonts.css" rel="stylesheet">

<!-- jQuery library -->
<script src="<%= request.getContextPath() %>/assets/lib/jquery/jquery.min.js"></script>

</head>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>
<body class="bg-gradient-primary">
<!-- deployDate[] -->
<nested:form action="/login">
<input type="hidden" name="cmd" value="doLogin" />
<nested:hidden property="urlToken" />  
      <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="loader-track">
            <div class="loader-bar"></div>
        </div>
    </div>
    <!-- Pre-loader end -->

    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                        <form class="md-float-material">
                            <div class="text-center">
                                <img src="<%= request.getContextPath() %>/assets/images/df_logo.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">Sign In</h3>
                                    </div>
                                </div>
                                <hr/>
                                <div class="input-group">
                                	<input type="text" name="login" class="form-control" id="exampleInputEmail" placeholder="Username" />
<!--                                     <input type="email" class="form-control" placeholder="Your Email Address"> -->
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
<!--                                     <input type="password" class="form-control" placeholder="Password"> -->
                                    <input type="password"  name="password" class="form-control" id="exampleInputPassword" placeholder="Password"/>
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-25 text-left">
                                    <div class="col-sm-7 col-xs-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" value="" id="customCheck">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">Remember me</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-5 col-xs-12 forgot-phone text-right">
                                        <a href="auth-reset-password.html" class="text-right f-w-600 text-inverse"> Forgot Your Password?</a>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Sign in</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <p class="text-inverse text-left m-b-0  text-center">Depth First Co., Ltd. Copyright &copy; All rights reserved.</p>
                                    </div>
                                </div>

                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
 	 
</nested:form> 

<!-- Session Count[<%= com.depthfirst.framework.ums.web.UserSession.getSessionCount() %>] -->
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/modernizr/modernizr.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/modernizr/css-scrollbars.js"></script>

<!-- Custom js -->
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/script.js"></script>
<script src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/pcoded.min.js"></script>
<script src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/vartical-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/lib/theme/gradient-able-bsp4-lite/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>


<%@ include file="/include/_responseMessage.jsp" %>
<script language="JavaScript">
<!--
createErrorPane(getForm());
// -->
</script>
</body>
</html>
