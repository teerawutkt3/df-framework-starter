
</div>
</div>
<!-- Warning Section Starts -->

<div id="styleSelector">

</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="logoutModalLabel" style="color:#f98aa2 !important;"><i class="fas fa-exclamation-triangle"></i>&nbsp;แจ้งเตือน
 </h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
			</div>
			<div class="modal-body">ต้องการออกจากระบบ ?</div>
			<div class="modal-footer">
				<button class="btn " style="background-color: #f98aa2 !important;" type="button" 
				onclick="headerJs.logoutContinue()"><i class="fas fa-sign-out-alt"></i>&nbsp;ออกจากระบบ </button>
				<button class="btn btn-default" type="button" data-dismiss="modal">ยกเลิก </button>
			</div>
		</div>
	</div>
</div>

<!-- Confirm Delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-danger" id="deleteModalLabel"><i class="fas fa-exclamation-triangle"></i>&nbsp;แจ้งเตือน</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="idDeleteModal">
				<span>ยืนยันการลบข้อมูล</span>
			</div>
			<div class="modal-footer">
				<a title="ลบข้อมูล" class="btn btn-danger" href="javascript:doCmd('doDeleteContinue',0)"><i class="fas fa-check"></i>&nbsp;ตกลง</a>				
				<button class="btn btn-default" type="button" data-dismiss="modal">ยกเเลิก</button>
			</div>
		</div>
	</div>
</div>

<% }catch(Exception _exception){ logger.error(request.getRequestURI(), _exception);_exception.printStackTrace(); } %>
<!-- Required Jquery -->

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


<%@ include file="/include/_responseMessage.jsp"%>

<script type="text/javascript">
var headerJs = {};
$(function () {
	
	
	headerJs.getName = function() {
		let id  = $('#userId').val();
		let url =  ctxPath+"/ccis/childCenter.do?cmd=getNameOfUser";
		console.log("GetName id: ", id);
		console.log("GetName url: ", url);
// 		$.ajax({
// 			  type: "GET",
// 			  contentType: "application/json",
// 			  url: url,
// 			  dataType: "json",
// 			  success: function(res){
// 				console.log("user =>", res);
// 				$("#userNameLogin").text(res.name);
// 			  },
// 			  error: function(err){
// 				  var username = $("#userId").val();
// 				 	console.log("username==> ", username);
// 					$("#userNameLogin").text(username);
// 					console.log("err =>", err);
// 			  }
// 		});
	}
	
	
	headerJs.logout = function(){			
		$("#logoutModal").modal('show')			
	}
	
	headerJs.logoutContinue = function(){
		document.location.href = "<%=request.getContextPath() %>/login.do?cmd=doLogout&ts="+ new Date().getTime();
	}
	
	/* Block UI */
	headerJs.blockUi = function() {
		$.blockUI({
<%--             message: '<img src="<%=request.getContextPath() %>/assets/images/loadingCCIS.gif" style="width:60px; padding-bottom: 5px;"/><br>กำลังโหลด...', --%>
            message: '<img src="<%=request.getContextPath() %>/assets/images/loadingCCIS.svg" style="width:60px; padding-bottom: 5px;"/><br>กำลังโหลด...',

            css: {
                'z-index': '6000',
                position: 'fixed',
                padding: '0px',
                margin: '0px',
                width: '30%',
                top: '40%',
                left: '35%',
                'text-align': 'center',
                color: 'rgb(251, 251, 251)',
                border: 'none',
                'background-color': 'transparent'
            }
        });
	}
	headerJs.unBlockUi = function() {
		$.unblockUI();
	}
// 	headerJs.getName();
});

</script> 
<script>
    $(document).ready(function() {
        $('[data-toggle="popover"]').popover({
            html: true,
            content: function() {
                return $('#primary-popover-content').html();
            }
        });
    });
</script>
<script src="<%= request.getContextPath() %>/assets/js/struts.js"></script> 
</body>
</html>
