
</div>
<!-- /.container-fluid -->
<footer id="sticky-footer" class="bg-white text-dark-50">
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
<!--
createErrorPane(getForm());
// -->

$('.datepicker').datepicker({language:'th-th',format:'dd/mm/yyyy'})
$('body').on('click', '.day', function(){
	jQuery('.datepicker-dropdown').remove();
});


$('.select2').select2()
$('[data-toggle="tooltip"]').tooltip()

// var ctx = document.getElementById('myChart').getContext('2d');
// var myDoughnutChart = new Chart(ctx, {
//     type: 'doughnut',
//     data: {
//         labels: ["January", "February", "March", "May"],
//         datasets: [{
//             label: "My First dataset",
//             backgroundColor: [
//                 'red',
//                 'blue',
//                 'green',
//                 'orange',
//             ],
//             data: [2, 10, 5, 7],
//         }]
//     },
//     options: {}
// });
</script>

<script language="JavaScript" src="<%= request.getContextPath() %>/js/win.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/util.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/struts.js"></script>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/js/popupCalendar.js"></script> --%>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateForm.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateDate.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/validateNumber.js"></script>

<!-- <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script> -->
<%-- <script type="text/javascript" src="<%= request.getContextPath() %>/km_back/js/jquery-1.7.2.min.js"></script> --%>
<%-- <script language="JavaScript" type="text/javascript" src="<%= request.getContextPath() %>/lib/jquery/dist/jquery.js"></script>  --%>

<!-- <!-- new theme -->
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/lib/jquery-ui/jquery-ui.min.js"></script> --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/lib/jquery-easing/jquery.easing.min.js"></script> --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/lib/bootstrap/dist/js/bootstrap.min.js"></script> --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/js/bootstrap-datepicker.js"></script> --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/js/bootstrap-datepicker-thai.js"  charset="UTF-8"></script> --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/js/locales/bootstrap-datepicker.th.js"  charset="UTF-8"></script> --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/lib/jquery-knob/dist/jquery.knob.min.js"></script> --%>

<!-- <!-- theme css-->

<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/theme/js/sb-admin-2.min.js"></script> --%>

<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/lib/dist/js/adminlte.min.js"></script> --%>
<%-- <script language="JavaScript" src="<%= ctxPath %>/js/Chart.min.js"></script>  --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/lib/select2/dist/js/select2.full.min.js"></script> --%>
<!-- <script language="JavaScript" type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBpzziFh3XpWAxnwo0CrDvdBFr5MX-4zTM&libraries=geometry,places&sensor=false"></script> -->
<!-- <script src="http://rawgit.com/Logicify/jquery-locationpicker-plugin/master/dist/locationpicker.jquery.js"></script> -->
<%-- <script src="<%= request.getContextPath() %>/lib/location_picker/js/locationpicker.jquery.min.js"></script> --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/lib/location_picker/js/locationpicker.jquery.js"></script>  --%>
<%-- <script language="JavaScript" src="<%= request.getContextPath() %>/lib/sweetalert2/sweetalert2.all.min.js"></script> --%>

<script language="JavaScript">

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
			document.location.href = '<%= request.getContextPath() %>
	/login.do?cmd=doLogout&ts='
										+ (new Date()).getTime();
							}
						});
	}
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
</script>

</body>
</html>
