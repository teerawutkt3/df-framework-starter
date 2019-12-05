<%@page import="com.depthfirst.framework.struts.BaseForm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp"%>

<nested:form action="/top/project">
<nested:define id="pageCode" property="pageCode" type="String" />
<nested:define id="editable" property="editable" type="Boolean" />
<input type="hidden" name="cmd" value="" />
<nested:hidden property="formData.id" />
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header"><b><nested:write property="formModeStr" /> Customer</b></div>
			<div class="card-body">
							
				<div class="row form-group">					
					<div class="col-sm-2 text-right">
						<label> Project Name: </label>
					</div>
					<div class="col-sm-3">
						<nested:text styleClass="form-control" property="formData.name" lang="property['code',required,,]" disabled="<%= !editable.booleanValue() %>" />
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-2 text-right">
						<label> Budget: </label>
					</div>
					<div class="col-sm-5">
						<nested:text styleClass="form-control" property="formData.budget" lang="property['code',required,,]" disabled="<%= !editable.booleanValue() %>" />						
					</div>					
				</div>
				<div class="row mt-5">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<nested:equal property="editable" value="true">
							<button type="button" class="btn  btn-success" onclick="doCmd('doSave')">บันทึก</button>
						</nested:equal>
						<nested:equal property="formMode" value="<%=BaseForm.FORM_VIEW%>">
							<nested:equal property="formData.isCanEdit" value="true">
								<button type="button" class="btn btn-warning" onclick="javascript:doCmd('goUpdate');">แก้ไข</button>
							</nested:equal>
						</nested:equal>
						<input type="button" class="btn btn-secondary" value=" กลับไป " onclick="doCmd('list')" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:form>
<%@ include file="/include/_footermenu_mdb.jsp"%>
