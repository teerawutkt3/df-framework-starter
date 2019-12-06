<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp"%>
<nested:form action="/ums/module">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />
<div class="row">
	<div class="col-md-12 text-right mb-3">
	<button class="btn btn-success btn-sm" onclick="doCmd('goCreate')"  type="button" ><i class="ti-plus"></i>&nbsp;เพิ่มข้อมูลระบบงาน</button>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
<!-- 			<div class="box-header with-border"><h3 class="box-title">ค้นหาข้อมูล</h3> </div> -->
			<div class="box-body table-responsive">
				<nested:notEmpty property="searchResult.data">
					<table class="table table-bordered table-striped table-sm table-hover" border="0" width="95%" align="center">
						<tr>
							<th width="2%">#</th>
							<th width="10%">ลำดับเมนู</th>
							<th width="15%">ไอคอน</th>
							<th width="70%">ชื่อระบบงาน</th>
							<th width="8%">&nbsp;</th>
						</tr>
						<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
						<nested:iterate property="searchResult.data" id="result" indexId="ind">
						<tr class="tr<%= ind.intValue()%2 %>">
							<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
							<td align="right">&nbsp;<nested:write name="result" property="order" />&nbsp;</td>
							<td><nested:write name="result" property="code" /></td>
							<td><nested:write name="result" property="name" /></td>
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
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12">
						<nested:equal property="canCreate" value="true">
							<center>
							
						</nested:equal>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:form>

<%@ include file="/include/_footermenu_mdb.jsp" %>
