<% 	String msg = (String)request.getAttribute(com.depthfirst.framework.message.ResponseMessageManager.MESSAGE_ATTRIBUTE_KEY);
	String color = "dark_green";
if(msg != null) { %><script language="JavaScript">
	if('<%= msg %>' == 'บันทึกข้อมูลเรียบร้อย'){
		<%-- $.notify('<%= msg %>', {
			className: 'success',
			position: 'top center'
		}); --%>
		
		swal.fire({
			position: 'center',
			type: 'success',
			title: '<%= msg %>',
			showConfirmButton: false,
			timer: 1500
		})
	}else{
		<%-- alert("<%= msg %>"); --%>
		$.jAlert({
		  'title': 'Notification',
		  'clickAnywhere': true,
		  'content': '<%= msg %>',
		  'theme': '<%= color %>',
		  'size': 'sm',
		  'showAnimation': 'fadeInUp',
		  'hideAnimation': 'fadeOutDown'
		});
	}
</script><% } %>