<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/pageType">
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<div class="row">
					<div class="col-md-12">
						<h3 class="box-title"><nested:write property="formModeStr" />ข้อมูลประเภทหน้าจอ</h3>
					</div>
				</div>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-2"><label class="label-form">ชื่อประเภทหน้าจอ</label></div>
					<div class="col-md-4"><nested:text styleClass="form-control" property="formData.name" size="20" maxlength="50" lang="property['ชื่อประเภทหน้าจอ',required,,50]" disabled="<%= !editable.booleanValue() %>" /></div>
				</div>
				<div class="row">
					<div class="col-md-2"><label class="label-form">รายละเอียด</label></div>
					<div class="col-md-4"><nested:text  styleClass="form-control" property="formData.description" size="50" maxlength="200" lang="property['รายละเอียด',,,200]" disabled="<%= !editable.booleanValue() %>" /></div>
				</div>
				<div class="row">
					<div class="col-md-2"><label class="label-form">ลำดับเมนู</label></div>
					<div class="col-md-1"><nested:text  styleClass="form-control" property="formData.order" size="5" maxlength="3" lang="property['ลำดับเมนู',,,3,isInt]" disabled="<%= !editable.booleanValue() %>" /></div>
				</div>
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12">
						<nested:equal property="editable" value="true"><input class="btn btn-success" type="button" value=" บันทึก " onclick="doCmd('doSave')" /></nested:equal>
						<input type="button" value=" กลับไป " class="btn btn-default" onclick="doCmd('list')" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
