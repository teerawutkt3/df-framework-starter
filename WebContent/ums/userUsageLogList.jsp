<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu.jsp" %>

<nested:form action="/ums/userUsageLog">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">ค้นหาประวัติการใช้งาน</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>วันที่</label><br>
							<nested:text style="width: 30%; display: inline-block" property="searchCondition.startDate" size="10" maxlength="10" styleClass="form-control datepicker" />
							- <nested:text style="width: 30%; display: inline-block" property="searchCondition.endDate" lang="property['วันที่',,,,isToDate,searchCondition.startDate]" size="10" maxlength="10" styleClass="form-control datepicker" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>IP Address</label>
							<nested:text styleClass="form-control" property="searchCondition.ipAddress" size="20" maxlength="20" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>รหัสผู้ใช้</label>
							<nested:text styleClass="form-control" property="searchCondition.login" size="20" maxlength="20" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>รหัสหน้าจอ</label>
							<nested:text styleClass="form-control" property="searchCondition.pageCode" size="10" maxlength="10" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>ระบบงาน</label>
							<nested:select styleClass="form-control" property="searchCondition.moduleId">
								<option value="">ทั้งหมด</option>
								<nested:optionsCollection property="moduleList" label="name" value="id"/>
							</nested:select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>ประเภทหน้าจอ</label>
							<nested:select styleClass="form-control" property="searchCondition.pageTypeId">
								<option value="">ทั้งหมด</option>
								<nested:optionsCollection property="pageTypeList" label="name" value="id"/>
							</nested:select>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<input class="btn btn-primary" type="button" value=" ค้นหา " onclick="if(validateForm(this.form)) doGoto(0)" />
				<input class="btn btn-primary" type="button" value=" แสดงทั้งหมด " onclick="doCmd('listAll')" /> <input class="btn btn-primary" type="button" value=" เริ่มค้นหาใหม่ " onclick="doCmd('resetSearch')" />
				<input class="btn btn-primary" type="button" value=" ส่งออกไฟล์ Excel " onclick="doCmd('exportExcel')" />
			</div>
		</div>
		
		<div class="box box-primary">
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<nested:notEmpty property="searchResult.data">
							<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<tr class="info">
								<th width="2%">&nbsp;</th>
								<% String thOrderBy[][] = {{"วันที่/เวลา", "o.lastUpdDate"}, {"IP Address", "o.ipAddress"}, {"รหัสผู้ใช้", "o.login"},
										{"รหัสหน้าจอ", "o.pageCode"}, {"การดำเนินการ", "o.cmd"}, {"รายละเอียด", "o.key"}};
								%><%@ include file="/include/_thorderby.jsp" %>
								</tr>
								<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
								<nested:iterate property="searchResult.data" id="result" indexId="ind">
								<tr class="tr<%= ind.intValue()%2 %>">
									<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
									<td><nested:write name="result" property="lastUpdDateStr" /></td>
									<td><nested:write name="result" property="ipAddress" /></td>
									<td><nested:write name="result" property="login" /></td>
									<td><nested:write name="result" property="pageCode" /></td>
									<td><nested:write name="result" property="cmd" /></td>
									<td><nested:write name="result" property="key" /></td>
								</tr>
								</nested:iterate>
								</table>
								<%@ include file="/include/_cursor.jsp" %>
							</div>
						</nested:notEmpty>
						<nested:empty property="searchResult.data"><nested:equal property="searchResult.processed" value="true">
							<center class="error">ไม่พบข้อมูลตามเงื่อนไข</center></nested:equal></nested:empty>
						</nested:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/include/_footermenu.jsp" %>
