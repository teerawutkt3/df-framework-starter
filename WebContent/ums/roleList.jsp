<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/role">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">ค้นหากลุ่มผู้ใช้งาน</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>รหัสกลุ่มผู้ใช้งาน</label>
							<nested:text styleClass="form-control" property="searchCondition.code" size="10" maxlength="10" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>ชื่อกลุ่มผู้ใช้งาน</label>
							<nested:text styleClass="form-control" property="searchCondition.name" size="20" maxlength="50" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>ระบบงาน</label>
							<nested:select styleClass="form-control" property="searchCondition.moduleId">
								<option value="">ทั้งหมด</option>
								<nested:optionsCollection property="moduleList" label="name" value="id" />
							</nested:select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>สิทธิอัตโนมัติ</label>
							<nested:select styleClass="form-control" property="searchCondition.isAuto">
								<option value="">ทั้งหมด</option>
								<nested:optionsCollection property="isActiveList" />
							</nested:select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>สถานะ</label>
							<nested:select styleClass="form-control" property="searchCondition.isActive">
								<option value="">ทั้งหมด</option>
								<nested:optionsCollection property="isActiveList" />
							</nested:select>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12">
						<input class="btn btn-primary" type="button" value=" ค้นหา " onclick="doGoto(0)" />
						<input class="btn btn-primary" type="button" value=" แสดงทั้งหมด " onclick="doCmd('listAll')" /> <input class="btn btn-primary" type="button" value=" เริ่มค้นหาใหม่ " onclick="doCmd('resetSearch')" />
						<input class="btn btn-primary" type="button" value=" ส่งออกไฟล์ Excel " onclick="doCmd('exportExcel')" />
					</div>
				</div>
			</div>
		</div>
		
		<div class="box box-primary">
			<div class="box-body table-responsive">
				<nested:notEmpty property="searchResult.data">
					<table class="table table-bordered table-hover">
						<tr class="info">
						<th width="2%">&nbsp;</th>
						<% String thOrderBy[][] = {{"รหัสกลุ่มผู้ใช้งาน", "o.code"}, {"ชื่อกลุ่มผู้ใช้งาน", "o.name"},
								{"สิทธิอัตโนมัติ", "o.isAuto"}, {"สถานะ", "o.isActive"}, {"รายละเอียด", "o.description"}};
						%><%@ include file="/include/_thorderby.jsp" %>
						<th width="8%">&nbsp;</th>
						</tr>
						<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
						<nested:iterate property="searchResult.data" id="result" indexId="ind">
						<tr class="tr<%= ind.intValue()%2 %>">
							<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
							<td><nested:write name="result" property="code" /></td>
							<td><nested:write name="result" property="name" /></td>
							<td><nested:write name="result" property="isAutoLabel" /></td>
							<td><nested:write name="result" property="isActiveLabel" /></td>
							<td><nested:write name="result" property="description" /></td>
							<td align="center" nowrap="nowrap">
								&nbsp;<a class="btn btn-info btn-xs" title="ดูข้อมูล" href="javascript:doCmd('goView', <%= ind %>)"><i class="fa fa-search" aria-hidden="true"></i></a>&nbsp;
								<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">&nbsp;<a title="แก้ไข" class="btn btn-warning btn-xs" href="javascript:doCmd('goUpdate', <%= ind %>)"><i class="fa fa-edit" aria-hidden="true"></i></a>&nbsp;</nested:equal>
								<nested:equal name="<%= pageCode %>" property="canDelete" value="true">&nbsp;<a title="ลบข้อมูล" class="btn btn-danger btn-xs" href="javascript:doCmd('doDelete', <%= ind %>)"><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;</nested:equal>
								<nested:equal name="<%= pageCode %>" property="canPrint" value="true">&nbsp;<a title="ส่งออกสิทธิเป็นไฟล์ Excel" class="btn btn-success btn-xs" href="javascript:doCmd('exportRightExcel', <%= ind %>)"><i class="far fa-file-excel" aria-hidden="true"></i></a>&nbsp;</nested:equal>
							</td>
						</tr>
						</nested:iterate>
					</table>
					<br />
					<%@ include file="/include/_cursor.jsp" %>
				</nested:notEmpty>
				<nested:empty property="searchResult.data"><nested:equal property="searchResult.processed" value="true">
					<center class="error">ไม่พบข้อมูลตามเงื่อนไข</center></nested:equal></nested:empty>
				<nested:equal property="canCreate" value="true">
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12">
						<center><input class="btn btn-success" type="button" value=" เพิ่มข้อมูล " onclick="doCmd('goCreate')" /></center>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:equal>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
