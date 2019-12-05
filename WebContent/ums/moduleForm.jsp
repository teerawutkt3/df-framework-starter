<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp" %>

<nested:form action="/ums/module">
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><nested:write property="formModeStr" />ข้อมูลระบบงาน</h3>
			</div>
			<div class="box-body">
				<div class="form-group row">
					<div class="col-md-2"><label class="label-form">ไอคอน</label></div>
					<div class="col-md-5">
						<nested:text property="formData.code" styleClass="form-control" size="10" maxlength="50" lang="property['ไอคอน',required]" disabled="<%= !editable.booleanValue() %>" placeholder="" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-2"><label class="label-form">ชื่อระบบงาน</label></div>
					<div class="col-md-5">
						<nested:text property="formData.name" styleClass="form-control" size="20" maxlength="50" lang="property['ชื่อระบบงาน',required,,50]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-2"><label class="label-form">รายละเอียด</label></div>
					<div class="col-md-5">
						<nested:text property="formData.description" styleClass="form-control" size="50" maxlength="200" lang="property['รายละเอียด',,,200]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-2"><label class="label-form">ลำดับเมนู</label></div>
					<div class="col-md-2">
						<nested:text property="formData.order" styleClass="form-control" size="5" maxlength="3" lang="property['ลำดับเมนู',,,3,isInt]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12">					
						<nested:equal property="editable" value="true"><input type="button" class="btn btn-success" value=" บันทึก " onclick="doCmd('doSave')" /></nested:equal>
						<input type="button" value=" กลับไป " class="btn btn-secondary" onclick="doCmd('list')" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu_mdb.jsp" %>
