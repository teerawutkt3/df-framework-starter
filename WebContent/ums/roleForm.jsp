<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp" %>

<%@page import="com.depthfirst.framework.ums.web.UserSession"%>
<script language="JavaScript">
<!--
function doAddPage(val) {
	var form = getForm();
	form.elements['add_page_code'].value = val;
	doCmdA('doAddPage', 'a_page');
}
function hasPriv() {
	return getForm().elements['delete_ind']==null?'กรุณาเพิ่มสิทธิของกลุ่มผู้ใช้งานอย่างน้อย 1 สิทธิ':null;
}

function doCheckRightAll(form, ind) {
	if(form == null) return;
	var cbAll = form.elements['right_all['+ind+']'];
	if(cbAll == null) return;
	for(var i=0; form.elements['formPrivilegeList['+i+'].rightVals['+ind+'].value']!=null; i++)
		form.elements['formPrivilegeList['+i+'].rightVals['+ind+'].value'].checked = cbAll.checked;
}
function doCheckRightId(form, name) {
	if(form == null) return;
	var ind = getNameIndex(name)[1];
	var cbAll = form.elements['right_all['+ind+']'];
	if(cbAll == null) return;
	cbAll.checked = true;
	for(var i=0; form.elements['formPrivilegeList['+i+'].rightVals['+ind+'].value']!=null; i++)
		if(!form.elements['formPrivilegeList['+i+'].rightVals['+ind+'].value'].checked) cbAll.checked = false;
}
function initCheckRightAll() {
	var form = getForm();
	for(var r=0; form.elements['right_all['+r+']']!=null; r++) {
		form.elements['right_all['+r+']'].checked = true;
		for(var i=0; form.elements['formPrivilegeList['+i+'].rightVals['+r+'].value']!=null; i++)
			if(!form.elements['formPrivilegeList['+i+'].rightVals['+r+'].value'].checked)
				form.elements['right_all['+r+']'].checked = false;
	}
}
// -->
</script>

<nested:form action="/ums/role">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="add_page_code" value="" />
<nested:hidden property="formData.id" />
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><nested:write property="formModeStr" />ข้อมูลกลุ่มผู้ใช้งาน</th></h3>
			</div>
			<div class="box-body">
				<div class="row form-group">
					<div class="col-md-2">รหัสกลุ่มผู้ใช้งาน</div>
					<div class="col-md-2"><nested:text styleClass="form-control" property="formData.code" size="10" maxlength="10" lang="property['รหัสกลุ่มผู้ใช้งาน',required,,10]" disabled="<%= !editable.booleanValue() %>" /></div>
					<div class="col-md-2 col-md-offset-3">ชื่อกลุ่มผู้ใช้งาน</div>
					<div class="col-md-2"><nested:text styleClass="form-control" property="formData.name" size="20" maxlength="50" lang="property['ชื่อกลุ่มผู้ใช้งาน',required,,50]" disabled="<%= !editable.booleanValue() %>" /></div>
				</div>
				<div class="row form-group">
					<div class="col-md-2">รายละเอียด</div>
					<div class="col-md-3"><nested:text styleClass="form-control" property="formData.description" size="50" maxlength="200" lang="property['รายละเอียด',,,200]" disabled="<%= !editable.booleanValue() %>" /></div>
				</div>
				<div class="row form-group">
					<div class="col-md-2">สิทธิอัตโนมัติ</div>
					<div class="col-md-2">
						<nested:select styleClass="form-control" property="formData.isAuto" disabled="<%= !editable.booleanValue() %>">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
					<div class="col-md-2 col-md-offset-2">สถานะ</div>
					<div class="col-md-2">
						<nested:select styleClass="form-control" property="formData.isActive" disabled="<%= !editable.booleanValue() %>">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
				<hr>
				<div class="row form-group">
					<div class="col-md-12">
						<nested:equal property="editable" value="true"><tr class="trform"><td colspan="4"><a name="a_page" />
							<input class="btn btn-default" type="button" name="addPrivBtn" lang="property[hasPriv]" value="เพิ่มสิทธิของกลุ่มผู้ใช้งาน" onclick="popupCmd('listModulePage', 800, 600)" />
							<input class="btn btn-default" type="button" value="ลบสิทธิของกลุ่มผู้ใช้งาน" onclick="doCmdA('doDeletePage', 'a_page')" />
						</td></tr></nested:equal>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-bordered table-sm table-striped table-hover">
								<tr>
									<nested:equal property="editable" value="true"><th width="2%"><input type="checkbox" name="delete_all" onclick="doCheckAll(this.form, 'delete_all', 'delete_ind')" /></th></nested:equal>
									<th>ระบบงาน
										<nested:equal name="<%= pageCode %>" property="createMode" value="false"><br/><nested:select property="formModuleId" onchange="doCmd('changeFormModule')"><option value="">ทั้งหมด</option>
											<nested:optionsCollection property="formModuleList" value="id" label="name" /></nested:select></nested:equal>
									</th><th>ประเภทหน้าจอ</th><th>รหัสหน้าจอ</th><th>ชื่อหน้าจอ</th>
									<% for(int i=0; i<UserSession.RIGHT_LABELS.length; i++) { %>
										<th><%= UserSession.RIGHT_LABELS[i] %>
											<nested:equal name="<%= pageCode %>" property="editable" value="true"><br/>
												<table border="0" width="100%"><tr><td align="center"><input type="checkbox" name="right_all[<%= i %>]" onclick="doCheckRightAll(this.form, <%= i %>)" /></td></tr></table></nested:equal>
										</th><% } %>
								</tr>
								<nested:iterate id="priv" indexId="ind" property="formPrivilegeList"><tr class="tr<%= ind.intValue()%2 %>">
									<nested:equal name="<%= pageCode %>" property="editable" value="true"><td><input type="checkbox" name="delete_ind" value="<%= ind %>" onclick="doCheckId(this.form, 'delete_all', 'delete_ind')" /></td></nested:equal>
									<td><nested:write property="page.module.name" /></td>
									<td><nested:write property="page.pageType.name" /></td>
									<td><nested:write property="page.code" /></td>
									<td><nested:write property="page.name" /></td>
									<nested:iterate id="rightVal" property="rightVals"><td align="center">
										<nested:checkbox property="value" value="Y" disabled="<%= !editable.booleanValue() %>"  onclick="doCheckRightId(this.form, this.name)" />
									</td></nested:iterate>
								</tr></nested:iterate>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12">
						<nested:equal property="editable" value="true"><input type="button" class="btn btn-success" value=" บันทึก " onclick="doCmd('doSave')" /></nested:equal>
						<input type="button" class="btn btn-default" value=" กลับไป " onclick="doCmd('list')" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:form>
<script language="JavaScript">
<!--
initCheckRightAll();
// -->
</script>

<%@ include file="/include/_footermenu_mdb.jsp" %>
