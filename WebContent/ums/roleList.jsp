<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp"%>

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
						<div class="col-md-4">
							<div class="form-group">
								<label>รหัสกลุ่มผู้ใช้งาน</label>
								<nested:text styleClass="form-control"
									property="searchCondition.code" size="10" maxlength="10" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>ชื่อกลุ่มผู้ใช้งาน</label>
								<nested:text styleClass="form-control"
									property="searchCondition.name" size="20" maxlength="50" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>ระบบงาน</label>
								<nested:select styleClass="form-control"
									property="searchCondition.moduleId">
									<option value="">ทั้งหมด</option>
									<nested:optionsCollection property="moduleList" label="name"
										value="id" />
								</nested:select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>สิทธิอัตโนมัติ</label>
								<nested:select styleClass="form-control"
									property="searchCondition.isAuto">
									<option value="">ทั้งหมด</option>
									<nested:optionsCollection property="isActiveList" />
								</nested:select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>สถานะ</label>
								<nested:select styleClass="form-control"
									property="searchCondition.isActive">
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
							<input class="btn btn-primary btn-sm" type="button"
								value=" ค้นหา " onclick="doGoto(0)" /> <input
								class="btn btn-primary btn-sm" type="button"
								value=" แสดงทั้งหมด " onclick="doCmd('listAll')" /> <input
								class="btn btn-primary btn-sm" type="button"
								value=" เริ่มค้นหาใหม่ " onclick="doCmd('resetSearch')" /> <input
								class="btn btn-primary btn-sm" type="button"
								value=" ส่งออกไฟล์ Excel " onclick="doCmd('exportExcel')" />
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="row mb-2">
				<div class="col-lg-12 text-right">
					<button class="btn btn-success btn-sm" onclick="doCmd('goCreate')"  type="button" ><i class="ti-plus"></i>เพิ่มข้อมูล</button>					
				</div>
			</div>
			<div class="box box-primary">
				<div class="box-body table-responsive">
					<nested:notEmpty property="searchResult.data">
						<table
							class="table table-bordered table-striped table-sm table-hover">
							<tr class="info">
								<th width="2%">&nbsp;</th>
								<%
									String thOrderBy[][] = { { "รหัสกลุ่มผู้ใช้งาน", "o.code" }, { "ชื่อกลุ่มผู้ใช้งาน", "o.name" },
														{ "สิทธิอัตโนมัติ", "o.isAuto" }, { "สถานะ", "o.isActive" },
														{ "รายละเอียด", "o.description" } };
								%><%@ include file="/include/_thorderby.jsp"%>
								<th width="8%">&nbsp;</th>
							</tr>
							<nested:define id="searchCondition" property="searchCondition"
								type="com.depthfirst.framework.search.SearchCondition" />
							<nested:iterate property="searchResult.data" id="result"
								indexId="ind">
								<tr class="tr<%=ind.intValue() % 2%>">
									<td align="right" nowrap="nowrap">&nbsp;<%=ind.intValue() + searchCondition.getPosition() + 1%>&nbsp;
									</td>
									<td><nested:write name="result" property="code" /></td>
									<td><nested:write name="result" property="name" /></td>
									<td><nested:write name="result" property="isAutoLabel" /></td>
									<td><nested:write name="result" property="isActiveLabel" /></td>
									<td><nested:write name="result" property="description" /></td>
									<td align="center" nowrap="nowrap">&nbsp;
										<a class="btn btn-icon btn-outline-info btn-info" title="ดูข้อมูล" href="javascript:doCmd('goView', <%= ind %>)"><i class="ti-search"></i></a>
										<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">
										<a title="แก้ไข" class="btn btn-warning btn-outline-warning btn-icon" href="javascript:doCmd('goUpdate', <%= ind %>)"><i class="ti-pencil-alt"></i></a></nested:equal>
										<nested:equal name="<%= pageCode %>" property="canDelete" value="true">
										<a title="ลบข้อมูล" class="btn btn-danger btn-outline-danger btn-icon" href="javascript:doCmd('doDelete', <%= ind %>)"><i class="ti-trash"></i></a></nested:equal>
										 <nested:equal name="<%=pageCode%>" property="canPrint" value="true">
										 <a title="ส่งออกสิทธิเป็นไฟล์ Excel" class="btn btn-success btn-outline-success btn-icon"
												href="javascript:doCmd('exportRightExcel', <%=ind%>)"><i class="ti-export"></i>
										</nested:equal>
									</td>
								</tr>
							</nested:iterate>
						</table>
						<br />
						<%@ include file="/include/_cursor.jsp"%>
					</nested:notEmpty>
					<nested:empty property="searchResult.data">
						<nested:equal property="searchResult.processed" value="true">
							<center class="error">ไม่พบข้อมูลตามเงื่อนไข</center>
						</nested:equal>
					</nested:empty>
				</div>

			</div>
		</div>
	</div>

</nested:form>

<%@ include file="/include/_footermenu_mdb.jsp"%>
