<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp" %>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/interface/PpsService.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/util.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/dwr/engine.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/dwr.js"></script>
<script language="JavaScript" src="<%= request.getContextPath() %>/js/selectOrg.js"></script>
<script language="JavaScript">
<!--
function hasRole() {
	var form=getForm(), n=0;
	for(var i=0; form.elements['userRoleList['+i+'].isSelect']!=null; i++)
		if(form.elements['userRoleList['+i+'].isSelect'].checked) n++;
	if(n == 0) return 'กรุณาเลือกกลุ่มผู้ใช้งานอย่างน้อย 1 กลุ่ม';
	return null;
}
function setPersonNo(personNo) {
	setPerson(personNo);
}
function setPerson(psnId) {
	var form = getForm();
	if(psnId != null) form.elements['psnId'].value = psnId;
	form.elements['formData.login'].value = form.elements['psnId'].value;
	doCmd('setPerson');
}
function hasPerson() {
	var form = getForm();
	if(form.elements['personCheck'] == null) return 'กรุณากรอกเลขประจำตัวประชาชนที่ถูกต้อง';
	return null;
}
function checkToDateStatus(val) {
	var form = getForm();
	var d = toDate(form.elements['formData.toDateStr'].value);
	if(d == null) return null;
	var ddiff = dateDiff(d, new Date());
	if(val=='Y' && ddiff>0) return 'สถานะไม่ถูกต้องตามวันที่สิ้นสุด';
	return null; 
}
// -->
</script>

<nested:form action="/ums/user">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="editable" property="editable" type="Boolean" />
<nested:define id="createMode" property="createMode" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />

<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><nested:write property="formModeStr" />ข้อมูลผู้ใช้งาน</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-4">
						<label class="label-form"></label>
					</div>
					<div class="col-md-4">
					
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">รหัสผู้ใช้</label>
					</div>
					<div class="col-md-2">
						<nested:text styleClass="form-control" property="formData.login" size="15" maxlength="13" lang="property['รหัสผู้ใช้',required,,13]" disabled="<%= !createMode.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">ชื่อผู้ใช้งาน</label>
					</div>
					<div class="col-md-4">
						<nested:text styleClass="form-control" property="formData.note1" size="30" maxlength="100" lang="property['ชื่อผู้ใช้งาน',required,,100]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">สังกัด</label>
					</div>
					<div class="col-md-4">
						<nested:text styleClass="form-control" property="formData.note2" size="30" maxlength="100" lang="property['สังกัด',required,,100]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<nested:equal property="createMode" value="true">
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">รหัสผ่าน</label>
					</div>
					<div class="col-md-3">
						<nested:password styleClass="form-control" property="password1" size="20" maxlength="20" lang="property['รหัสผ่าน',required,6,15,isPasswordChars]" />
					</div>
					<div class="col-md-1">
						<input type="button" class="btn btn-default" value="สุ่มรหัสผ่าน" onclick="setRandomPassword(this.form)" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">ยืนยันรหัสผ่าน</label>
					</div>
					<div class="col-md-3">
						<nested:password styleClass="form-control" property="password2" size="20" maxlength="20" lang="property['ยืนยันรหัสผ่าน',required,6,15,isConfirmPassword]" />
					</div>
				</div>
				</nested:equal>
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">วันที่เริ่มต้น</label>
					</div>
					<div class="col-md-2">
						<nested:text property="formData.fromDateStr" disabled="<%= !editable.booleanValue() %>" styleClass="form-control datepicker" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">วันที่สิ้นสุด</label>
					</div>
					<div class="col-md-2">
						<nested:text styleClass="form-control datepicker" property="formData.toDateStr" lang="property['วันที่สิ้นสุด',,,,isToDate,formData.fromDateStr]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">สถานะ</label>
					</div>
					<div class="col-md-2">
						<nested:select property="formData.isActive" lang="property['',,,,checkToDateStatus]" styleClass="form-control" disabled="<%= !editable.booleanValue() %>">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label class="label-form">หมายเหตุ</label>
					</div>
					<div class="col-md-6">
						<nested:text styleClass="form-control" property="formData.remark" size="50" disabled="<%= !editable.booleanValue() %>" maxlength="200" />
					</div>
				</div>
				<nested:equal property="editable" value="false">
					<div class="row">
						<div class="col-md-4">
							<label class="label-form">เปลี่ยนรหัสผ่านครั้งล่าสุด</label>
						</div>
						<div class="col-md-4">
							<nested:write property="formData.lastChangePasswordStr" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="label-form">การเข้าสู่ระบบสำเร็จล่าสุด</label>
						</div>
						<div class="col-md-4">
							<nested:write property="formData.lastLoginSuccessStr" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="label-form">การเข้าสู่ระบบไม่สำเร็จล่าสุด</label>
						</div>
						<div class="col-md-4">
							<nested:write property="formData.lastLoginFailedStr" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="label-form">จำนวนครั้งเข้าสู่ระบบไม่สำเร็จล่าสุด</label>
						</div>
						<div class="col-md-4">
							<nested:write property="formData.loginFailedCount" format="0" />
						</div>
					</div>
				</nested:equal>
			</div>
		</div>
		<div class="box box-primary">
			<div class="box-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<nested:present property="formData.person">
							<tr><th colspan="4">สังกัดในการใช้ระบบ</th></tr>
							<nested:equal property="editable" value="true"><tr class="trform">
								<td>สังกัด</td>
								<td colspan="3"><nested:hidden property="addNodeId" />
									<table id="orgTable" border="0"></table>
									<input type="button" value=" เพิ่ม " onclick="doCmd('doAddUserNode')" /></td>
							</tr></nested:equal>
							<tr><td colspan="4"><table border="0" width="100%">
							<nested:notPresent property="userNodeList">
							<tr>
								<nested:equal property="editable" value="true"><th width="20">
									<input type="button" value=" ลบ " onclick="doCmd('doDeleteUserNode')" /></th></nested:equal>
								<th>สังกัด</th>
							</tr>
							<nested:iterate id="userNode" indexId="ind" property="formData.userNodeList"><tr class="tr<%= ind.intValue()%2 %>">
								<nested:equal name="<%= pageCode %>" property="editable" value="true"><td align="center">
									<input type="checkbox" name="delete_ind" value="<%= ind.intValue() %>" /></td></nested:equal>
								<td><nested:write property="node.shortName" /></td>
							</tr></nested:iterate>
							</nested:notPresent>
							
							<nested:present property="userNodeList">
							<tr>
								<nested:equal property="editable" value="true"><th width="20">
									<input type="button" value=" ลบ " onclick="doCmd('doDeleteUserNode')" /></th></nested:equal>
								<th>สังกัด</th>
								<th>กลุ่มผู้ใช้งาน</th>
							</tr>
							<nested:iterate id="userNode" indexId="ind" property="userNodeList"><tr class="tr<%= ind.intValue()%2 %>">
								<nested:equal name="<%= pageCode %>" property="editable" value="true"><td align="center" valign="top">
									<input type="checkbox" name="delete_ind" value="<%= ind.intValue() %>" /></td></nested:equal>
								<td valign="top" width="30%"><nested:write property="userNode.node.shortName" /></td>
								<td width="70%"><table border="0" width="100%">
								<nested:iterate id="userRole" property="userRoleList"><tr>
									<td width="10" align="center"><nested:checkbox property="isSelect" value="Y" disabled="<%= !editable.booleanValue() %>" /></td>
									<td width="30%"><nested:write property="role.code" /></td>
									<td width="70%"><nested:write property="role.name" /></td>
								</tr></nested:iterate>
							</table></td></tr></nested:iterate>
							</nested:present>
							
							</table></td></tr>
						</nested:present>
						
						<nested:present property="userRoleList"><tr><th colspan="4">กลุ่มผู้ใช้งาน</th></tr>
						<tr><td colspan="4"><table width="100%" border="0">
						<nested:iterate id="userRole" indexId="ind" property="userRoleList"><tr class="tr<%= ind.intValue()%2 %>">
							<td width="10" align="center"><nested:checkbox property="isSelect" value="Y" disabled="<%= !editable.booleanValue() %>" /></td>
							<td width="30%"><nested:write property="role.code" /></td>
							<td width="70%"><nested:write property="role.name" /></td>
						</tr></nested:iterate>
						</table></td></tr></nested:present>
						
						</table>
				</div>
			</div>
			<div class="box-footer">
				<nested:equal property="editable" value="true">
					<input class="btn btn-success" type="button" name="saveBtn" value=" บันทึก " onclick="doCmd('doSave')" />
					<nested:equal property="canChangePassword" value="true"><nested:equal property="createMode" value="false">
						<input class="btn btn-warning" type="button" value=" กำหนดรหัสผ่าน " onclick="doCmd('goPassword')" /></nested:equal></nested:equal>
				</nested:equal>
				<input type="button" class="btn btn-secondary" value=" กลับไป " onclick="doCmd('list')" />
			</div>
		</div>
	</div>
</div>

</nested:form>
<%@ include file="/include/_footermenu_mdb.jsp" %>
