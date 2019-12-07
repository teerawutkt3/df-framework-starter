<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp" %>


<nested:form action="/ums/page">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border"><h3 class="box-title">ค้นหาข้อมูล</h3> </div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>รหัสหน้าจอ</label>
							<nested:text styleClass="form-control" property="searchCondition.code" size="10" maxlength="6" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>ชื่อหน้าจอ</label>
							<nested:text styleClass="form-control" property="searchCondition.name" size="50" maxlength="200" />
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
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>หน้าจอ</label>
							<nested:text styleClass="form-control" property="searchCondition.path" size="50" maxlength="200" />
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
				<input class="btn btn-primary btn-sm" type="button" value=" ค้นหา " onclick="doGoto(0)" />
				<input class="btn btn-primary btn-sm" type="button" value=" แสดงทั้งหมด " onclick="doCmd('listAll')" />
				<input class="btn btn-primary btn-sm" type="button" value=" เริ่มค้นหาใหม่ " onclick="doCmd('resetSearch')" />
				<input class="btn btn-primary btn-sm" type="button" value=" ส่งออกไฟล์ Excel " onclick="doCmd('exportExcel')" />
			
			</div>
		</div>
		<hr>
		<div class="row mb-2">
			<div class="col-lg-12 text-right">
				<button class="btn btn-success btn-sm" onclick="doCmd('goCreate')"  type="button" ><i class="ti-plus"></i>&nbsp;เพิ่มข้อมูลระบบงาน</button>
			</div>
		</div>
		<div class="box box-primary ">
			<div class="box-body table-responsive">
				<nested:notEmpty property="searchResult.data">
					<table class="table table-bordered table-striped table-hover table-sm" border="0" width="95%" align="center">
						<tr class="info">
							<th width="2%">&nbsp;</th>
							<% String thOrderBy[][] = {{"รหัสหน้าจอ", "o.code"}, {"ชื่อหน้าจอ", "o.name"}, {"ระบบงาน", "o.module"}, {"ประเภทหน้าจอ", "o.pageType"}, {"ลำดับ", "o.order"}};
							%><%@ include file="/include/_thorderby.jsp" %>
							<th width="8%">&nbsp;</th>
						</tr>
					<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
					<nested:iterate property="searchResult.data" id="result" indexId="ind">
					<tr>
						<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
						<td><nested:write name="result" property="code" /></td>
						<td><nested:write name="result" property="name" /></td>
						<td><nested:write name="result" property="module.name" /></td>
						<td><nested:write name="result" property="pageType.name" /></td>
						<td><nested:write name="result" property="order" /></td>
						<td align="center" nowrap="nowrap">
						<a class="btn btn-icon btn-outline-info btn-info" title="ดูข้อมูล" href="javascript:doCmd('goView', <%= ind %>)"><i class="ti-search"></i></a>
								<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">
								<a title="แก้ไข" class="btn btn-warning btn-outline-warning btn-icon" href="javascript:doCmd('goUpdate', <%= ind %>)"><i class="ti-pencil-alt"></i></a></nested:equal>
								<nested:equal name="<%= pageCode %>" property="canDelete" value="true">
								<a title="ลบข้อมูล" class="btn btn-danger btn-outline-danger btn-icon" href="javascript:doCmd('doDelete', <%= ind %>)"><i class="ti-trash"></i></a></nested:equal>								
						</td>
					</tr>
					</nested:iterate>
					</table>
					<br>
				<%@ include file="/include/_cursor.jsp" %>
				</nested:notEmpty>
				<nested:empty property="searchResult.data"><nested:equal property="searchResult.processed" value="true">
					<center class="error">ไม่พบข้อมูลตามเงื่อนไข</center></nested:equal>
				</nested:empty>
			</div>			
		</div>
	</div>
</div>
</nested:form>

<%@ include file="/include/_footermenu_mdb.jsp" %>
