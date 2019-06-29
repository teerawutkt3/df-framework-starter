<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/page">
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><nested:write property="formModeStr" />ข้อมูลหน้าจอ</th></h3>
			</div>
			<div class="box-body">
				<div class="row form-group">
					<div class="col-md-2"><label class="label-form">รหัสหน้าจอ</label></div>
					<div class="col-md-2"><nested:text styleClass="form-control" property="formData.code" size="10" maxlength="6" lang="property['รหัสหน้าจอ',required,6,6]" disabled="<%= !editable.booleanValue() %>" /></div>
					<div class="col-md-2 col-md-offset-3 text-right"><label class="label-form">ชื่อหน้าจอ</label></div>
					<div class="col-md-3"><nested:text property="formData.name" styleClass="form-control" size="50" maxlength="200" lang="property['ชื่อหน้าจอ',required,,200]" disabled="<%= !editable.booleanValue() %>" /></div>
				</div>
				<div class="row form-group">
					<div class="col-md-2"><label class="label-form">ระบบงาน</label></div>
					<div class="col-md-2">
						<nested:select property="moduleId" styleClass="form-control" lang="property['ระบบงาน',required]" disabled="<%= !editable.booleanValue() %>">
							<option value=""></option>
							<nested:optionsCollection property="moduleList" label="name" value="id"/>
						</nested:select>
					</div>
					<div class="col-md-2 text-right"><label class="label-form">ประเภทหน้าจอ</label></div>
					<div class="col-md-3">
						<nested:select styleClass="form-control" property="pageTypeId" lang="property['ประเภทหน้าจอ',required]" disabled="<%= !editable.booleanValue() %>">
							<option value=""></option>
							<nested:optionsCollection property="pageTypeList" label="name" value="id"/>
						</nested:select>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-md-2"><label class="label-form">รายละเอียด</label></div>
					<div class="col-md-4"><nested:text styleClass="form-control" property="formData.description" size="50" maxlength="200" lang="property['รายละเอียด',,,200]" disabled="<%= !editable.booleanValue() %>" /></div>
				</div>
				<div class="row">
					<div class="col-md-2"><label class="label-form">หน้าจอ</label></div>
					<div class="col-md-4"><nested:text styleClass="form-control" property="formData.path" size="50" maxlength="200" lang="property['หน้าจอ',required,,200]" disabled="<%= !editable.booleanValue() %>" /></div>
				</div>
				<div class="row form-group">
					<div class="col-md-2"><label class="label-form">ลำดับเมนู</label></div>
					<div class="col-md-4">
						<nested:text property="formData.order" styleClass="form-control" style="width: 50%; display: inline-block" size="5" maxlength="3" lang="property['ลำดับเมนู',,,3,isInt]" disabled="<%= !editable.booleanValue() %>" />
						
						<nested:checkbox property="formData.isMenu" value="Y" disabled="<%= !editable.booleanValue() %>" /> แสดงเมนู
                       
					</div>				
				</div>
				<div class="row form-group">
					<div class="col-md-2"><label class="label-form">สถานะ</label></div>
					<div class="col-md-2">
						<nested:select styleClass="form-control" property="formData.isActive" disabled="<%= !editable.booleanValue() %>">
							<nested:optionsCollection property="isActiveList" />
						</nested:select>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12 ">
							<nested:equal property="editable" value="true"><input class="btn btn-success" type="button" value=" บันทึก " onclick="doCmd('doSave')" /></nested:equal>
							<input class="btn btn-secondary" type="button" value=" กลับไป " onclick="doCmd('list')" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
