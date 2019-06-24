<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/user">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">กำหนดรหัสผ่าน</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-2"><label class="label-form">รหัสผู้ใช้</label></div>
					<div class="col-md-2"><nested:write property="formData.login" /></div>
				</div>
				<div class="row">
					<div class="col-md-2"><label class="label-form">รหัสผ่าน</label></div>
					<div class="col-md-2"><nested:password property="password1" styleClass="form-control" size="20" maxlength="20" lang="property['รหัสผ่าน',required,6,15,isPasswordChars]" />
					</div>
					<div class="col-md-1"><input type="button" class="btn btn-default" value="สุ่มรหัสผ่าน" onclick="setRandomPassword(this.form)" /></div>
				</div>
				<div class="row">
					<div class="col-md-2"><label class="label-form">ยืนยันรหัสผ่าน</label></div>
					<div class="col-md-2"><nested:password property="password2" styleClass="form-control" size="20" maxlength="20" lang="property['ยืนยันรหัสผ่าน',required,6,15,isConfirmPassword]" /></div>
				</div>
			</div>
			<div class="box-footer">
				<input type="button" class="btn btn-success" value=" บันทึก " onclick="if(validateForm(this.form)) doCmd('setPassword')" />
				<input type="button" class="btn btn-danger" value=" ยกเลิก " onclick="doCmd('list')" />
			</div>
		</div>
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
