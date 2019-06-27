<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/user">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">ค้นหาผู้ใช้งาน</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>รหัสผู้ใช้</label>
							<nested:text styleClass="form-control" property="searchCondition.login" size="20" maxlength="20" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>ชื่อผู้ใช้งาน</label>
							<nested:text styleClass="form-control" property="searchCondition.note1" size="30" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>สังกัด</label>
							<nested:text styleClass="form-control" property="searchCondition.note2" size="30" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>กลุ่มผู้ใช้งาน</label>
							<nested:select styleClass="form-control" property="searchCondition.roleId">
								<option value=""></option>
								<nested:optionsCollection property="roleList" label="name" value="id" />
							</nested:select>
						</div>
					</div>
				</div>
				<div class="row">
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
		<hr>
		<div class="box box-primary">
			<nested:notEmpty property="searchResult.data">
				<div class="box-header with-border">
					<div class="row">
						<div class="col-md-12">
							<nested:equal property="canUpdate" value="true">
								<input class="btn btn-success" type="button" value=" เปิดการใช้งาน " onclick="if(confirm('ยืนยันการเปิดการใช้งาน')) doCmd('doEnableUsers')" />
								<input class="btn btn-danger" type="button" value=" ปิดการใช้งาน " onclick="if(confirm('ยืนยันการปิดการใช้งาน')) doCmd('doDisableUsers')" />
							</nested:equal>
						</div>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-md-12">
							<div class="box-responsive">
								<table class="table table-bordered table-hover">
									<tr class="info">
									<nested:equal property="canUpdate" value="true"><th width="2%">
										<input type="checkbox" name="status_all" onclick="doCheckAll(this.form, 'status_all', 'status_ind')" /></th></nested:equal>
									<th width="2%">&nbsp;</th>
									<% String thOrderBy[][] = {{"รหัสผู้ใช้", "o.login"}, {"ชื่อผู้ใช้งาน", "o.note1"}, {"สังกัด", "o.note2"}, {"สถานะ", "o.isActive"}};
									%><%@ include file="/include/_thorderby.jsp" %>
									<th width="8%">&nbsp;</th>
									</tr>
									<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
									<nested:iterate property="searchResult.data" id="result" indexId="ind">
									<tr class="tr<%= ind.intValue()%2 %>">
										<nested:equal name="<%= pageCode %>" property="canUpdate" value="true"><td align="center" valign="top">
											<input type="checkbox" name="status_ind" value="<%= ind.intValue() %>" onclick="doCheckId(this.form, 'status_all', 'status_ind')" /></td></nested:equal>
										<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
										<td><nested:write name="result" property="login" /></td>
										<td><nested:write name="result" property="note1" /></td>
										<td><nested:write name="result" property="note2" /></td>
										<td><nested:write name="result" property="isActiveLabel" /></td>
										<td align="center" nowrap="nowrap">
											&nbsp;<a class="btn btn-info btn-xs" title="ดูข้อมูล" href="javascript:doCmd('goView', <%= ind %>)"><i class="fa fa-search" aria-hidden="true"></i></a>&nbsp;
											<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">&nbsp;<a title="แก้ไข" class="btn btn-warning btn-xs" href="javascript:doCmd('goUpdate', <%= ind %>)"><i class="fa fa-edit" aria-hidden="true"></i></a>&nbsp;</nested:equal>
											<nested:equal name="<%= pageCode %>" property="canDelete" value="true">&nbsp;<a title="ลบข้อมูล" class="btn btn-danger btn-xs" href="javascript:doCmd('doDelete', <%= ind %>)"><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;</nested:equal>
										</td>
									</tr>
									</nested:iterate>
								</table>
								<%@ include file="/include/_cursor.jsp" %>
							</div>
						</div>
					</div>
				</div>
			</nested:notEmpty>
			
			<nested:empty property="searchResult.data">
				<div class="box-body">
					<div class="row">
						<div class="col-md-12">
							<nested:equal property="searchResult.processed" value="true">
							<center class="error">ไม่พบข้อมูลตามเงื่อนไข</center></nested:equal>
						</div>
					</div>
				</div>
			</nested:empty>
			
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12">
						<center>
							<nested:equal property="canCreate" value="true"><input class="btn btn-success" type="button" value=" เพิ่มข้อมูล " onclick="doCmd('goCreate')" /></nested:equal>
							<input class="btn btn-info" type="button" value=" การใช้งานขณะนี้ " onclick="doCmd('listUserSession')" />
						</center>
					</div>
				</div>
			</div>
		</div>		
		
	</div>
</div>

</nested:form>

<%@ include file="/include/_footermenu.jsp" %>
