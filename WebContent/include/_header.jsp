<% org.apache.log4j.Logger logger = org.apache.log4j.LogManager.getLogger( "com.depthfirst.jsp" );
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title> DF Start [<%= java.net.Inet4Address.getLocalHost().getHostName() %>] </title>
<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
<!--link href="<%= request.getContextPath() %>/css/mystyle.css" rel="stylesheet" type="text/css" /-->
<script language="JavaScript">
<!--
var ctxPath = "<%= request.getContextPath() %>";
// -->
</script>

<!-- theme bootstrap start-->
<!-- CSS -->
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
<!-- theme bootstrap end-->

<script language="JavaScript" src="<%= request.getContextPath() %>/js/win.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/util.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/struts.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/popupCalendar.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateForm.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateDate.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateNumber.js"></script>

<script language="JavaScript" src="<%= request.getContextPath() %>/js/Cookies.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/Style.js"></script>

<script language="JavaScript" src="<%= request.getContextPath() %>/js/tab.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/treeview/jquery.treeview.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/treeview/lib/jquery.cookie.js" ></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/treeview/jquery.treeview.js" ></script>
<!----------dwr------------>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/interface/ComDwrService.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/util.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/engine.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/dwr.js"></script>
<script language="JavaScript">
<!--
InitStyle();
// -->
</script>
</head>

<body id="page-top">
