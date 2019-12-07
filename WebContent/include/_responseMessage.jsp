<% 	String msg = (String)request.getAttribute(com.depthfirst.framework.message.ResponseMessageManager.MESSAGE_ATTRIBUTE_KEY);
	String color = "dark_green";
if(msg != null) { %>
<script language="JavaScript">
	console.log("msg : ", '<%= msg %>');
	if('<%= msg %>' == 'บันทึกข้อมูลเรียบร้อย') alertMsg('success', 'บันทึกข้อมูลเรียบร้อย', '');			
	if('<%= msg %>' == 'ระบบผิดพลาดกรุณาติดต่อเจ้าหน้าที่ดูแลระบบ') alertMsg('error', '', 'ระบบผิดพลาดกรุณาติดต่อเจ้าหน้าที่ดูแลระบบ');			
	if('<%= msg %>' == 'ไม่สามารถบันทึกข้อมูลได้เนื่องจากข้อมูลถูกแก้ไขก่อนหน้า') alertMsg('warning', '', 'ไม่สามารถบันทึกข้อมูลได้เนื่องจากข้อมูลถูกแก้ไขก่อนหน้า');			
function alertMsg(icon, title, text){
	Swal.fire({
		  icon: icon,
		  title: title,
		  text: text,
// 		  footer: footer,
		  confirmButtonText : 'ตกลง'
		});
}
</script><% } %>