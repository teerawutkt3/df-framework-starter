
</div>
<!-- /.container-fluid -->
<footer id="sticky-footer" class="py-4 bg-white text-dark-50 mt-4">
	<div class="container text-center">
		<strong> Copyright &copy; Depthfirst Co.,Ltd. </strong> All right reserved.
	</div>
	<!-- <a class="scroll-to-top rounded" class="btn" href="#page-top"> <i class="fa fa-angle-up" ></i></a> -->
</footer>
</div>
</div>

<!-- <footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<strong> Copyright &copy; Depthfirst Co.,Ltd. </strong> All right reserved.
		</div>
	</div>
</footer> -->
<!-- Scroll to Top Button-->

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="login.html">Logout</a>
			</div>
		</div>
	</div>
</div>

<% }catch(Exception _exception){ logger.error(request.getRequestURI(), _exception);_exception.printStackTrace(); } %></td>
</tr>
<!--end container-->
<%@ include file="/include/_responseMessage.jsp"%>
<!--end footer-->

<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBpzziFh3XpWAxnwo0CrDvdBFr5MX-4zTM&libraries=geometry,places&sensor=false"></script> -->
<script language="JavaScript">
$('body').on('click', '.day', function(){
	jQuery('.datepicker-dropdown').remove();
});

$(document).ready(function() {

	$('#sidebarCollapse').on('click', function() {
		$('#sidebar').toggleClass('active');
		$(".dataTables_scrollHeadInner").css({
			"width" : "100%"
		});
		$(".table ").css({
			"width" : "100%"
		});
	});

	$(".trigger").click(function() {
		$(".panel").toggle();
		$(this).toggleClass("active");
		return false;
	});

});


function doLogout() {
 
	swal.fire({
		title: 'ต้องการการออกจากระบบ ?',
		type: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'ยืนยัน',
		cancelButtonText: 'ยกเลิก',
		confirmButtonClass: 'btn btn-success',
		cancelButtonClass: 'btn btn-danger',
		buttonsStyling: false
	}).then(function (result) {
		if (result.value) {
			document.location.href = "<%=request.getContextPath() %>/login.do?cmd=doLogout&ts="+ new Date().getTime();
			}
	});
}
</script>

</body>
</html>
