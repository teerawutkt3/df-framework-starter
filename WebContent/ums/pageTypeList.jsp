<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp" %>

<nested:form action="/ums/pageType">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<div class="row mb-2">
	<div class="col-lg-12 col-md-12  text-right">
		<nested:equal property="canCreate" value="true">			
			<button class="btn btn-success btn-sm" onclick="doCmd('goCreate')" type="button" ><i class="ti-plus"></i>เพิ่มข้อมูลประเภทหน้าจอ</button>
		</nested:equal>
	</div>
</div>
<nested:notEmpty property="searchResult.data">
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-body table-responsive">
				<table class="table table-bordered table-striped table-hover table-sm">
					<tr>
						<th width="2%">#</th>
						<th width="10%">ลำดับเมนู</th>
						<th width="80%">ชื่อประเภทหน้าจอ</th>
						<th width="8%">&nbsp;</th>
					</tr>
					<nested:define id="searchCondition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition" />
					<nested:iterate property="searchResult.data" id="result" indexId="ind">
					<tr class="tr<%= ind.intValue()%2 %>">
						<td align="right" nowrap="nowrap">&nbsp;<%= ind.intValue()+searchCondition.getPosition()+1 %>&nbsp;</td>
						<td align="right">&nbsp;<nested:write name="result" property="order" />&nbsp;</td>
						<td><nested:write name="result" property="name" /></td>
						<td align="center" nowrap="nowrap">
							<a class="btn btn-info btn-outline-info btn-icon" title="ดูข้อมูล" href="javascript:doCmd('goView', <%= ind %>)"><i class="fa fa-search" aria-hidden="true"></i></a>
							<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">
							<a title="แก้ไข" class="btn btn-warning btn-outline-warning btn-icon" href="javascript:doCmd('goUpdate', <%= ind %>)"><i class="fa fa-edit" aria-hidden="true"></i></a></nested:equal>
							<nested:equal name="<%= pageCode %>" property="canDelete" value="true">
							<a title="ลบข้อมูล" class="btn btn-danger btn-outline-danger btn-icon" href="javascript:doCmd('doDelete', <%= ind %>)"><i class="fa fa-trash" aria-hidden="true"></i></a></nested:equal>
						</td>
					</tr>
					</nested:iterate>
				</table>
				<br>
				<%@ include file="/include/_cursor.jsp" %>
			</div>
			<div class="box-footer">
				<div class="row">
					<div class="col-md-12">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:notEmpty>
</nested:form>

<%@ include file="/include/_footermenu_mdb.jsp" %>
