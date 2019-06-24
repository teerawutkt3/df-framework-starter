<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.depthfirst.framework.ums.web.*" pageEncoding="UTF-8"%><%
try {
	UserSession userSession = (UserSession)session.getAttribute(UserSession.SESSION_KEY);
	if(userSession == null) {
		response.sendRedirect(request.getContextPath()+"/");
		return;
	}else userSession.setCurrentPage(new PageInfo("เปลี่ยนรหัสผ่าน"));
}catch(Exception e){ e.printStackTrace(); }
%><%@ include file="/include/_headermenu.jsp" %>

<form action="<%= request.getContextPath() %>/login.do" method="post">
<input type="hidden" name="cmd" value="" />

<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-body">
				<div class="row">
					<div class="col-md-2"><label class="label-form">รหัสผ่านเดิม</label></div>
					<div class="col-md-4"><input type="password" class="form-control" name="password0" size="20" maxlength="20" lang="property['รหัสผ่านเดิม',required,6,15,isPasswordChars]" />
    					<font color="red">*</font></div>
				</div>
				<div class="row">
					<div class="col-md-2"><label class="label-form">รหัสผ่านใหม่</label></div>
					<div class="col-md-4"><input type="password" class="form-control" name="password1" size="20" maxlength="20" lang="property['รหัสผ่านใหม่',required,6,15,isPasswordChars]" />
    					<font color="red">*</font> </div>
    				<div class="col-md-1">
    					<input type="button" class="btn btn-default" value="สุ่มรหัสผ่าน" onclick="setRandomPassword(this.form)" />
    				</div>
				</div>
				<div class="row">
					<div class="col-md-2"><label class="label-form">ยืนยันรหัสผ่าน</label></div>
					<div class="col-md-4"><input type="password" class="form-control" name="password2" size="20" maxlength="20" lang="property['ยืนยันรหัสผ่าน',required,6,15,isConfirmPassword]" />
    					<font color="red">*</font></div>
				</div>
			</div>
			<div class="box-footer">
				<input type="button" class="btn btn-success" value=" บันทึก " onclick="if(validateForm(this.form)) doCmd('doSavePassword')" />
			</div>
		</div>
	</div>
</div>
</form>

<%@ include file="/include/_footermenu.jsp" %>
