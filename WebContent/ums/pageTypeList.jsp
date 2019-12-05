<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>

<%@ include file="/include/_headermenu_mdb.jsp" %>

<nested:form action="/ums/pageType">
<nested:define id="pageCode" property="pageCode" type="String" />
<input type="hidden" name="cmd" value="" />
<input type="hidden" name="data_index" value="" />

<nested:notEmpty property="searchResult.data">
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-body table-responsive">
				<table class="table table-bordered table-striped table-hover table-sm">
					<tr>
						<th width="2%">&nbsp;</th>
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
							&nbsp;<a class="btn btn-info btn-sm" title="ดูข้อมูล" href="javascript:doCmd('goView', <%= ind %>)"><i class="fa fa-search" aria-hidden="true"></i></a>&nbsp;
							<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">&nbsp;<a title="แก้ไข" class="btn btn-warning btn-sm" href="javascript:doCmd('goUpdate', <%= ind %>)"><i class="fa fa-edit" aria-hidden="true"></i></a>&nbsp;</nested:equal>
							<nested:equal name="<%= pageCode %>" property="canDelete" value="true">&nbsp;<a title="ลบข้อมูล" class="btn btn-danger btn-sm" href="javascript:doCmd('doDelete', <%= ind %>)"><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;</nested:equal>
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
						<nested:equal property="canCreate" value="true">
						<br/><center><input class="btn btn-success" type="button" value=" เพิ่มข้อมูลประเภทหน้าจอ " onclick="doCmd('goCreate')" /></center>
						</nested:equal>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nested:notEmpty>
</nested:form>

<%@ include file="/include/_footermenu_mdb.jsp" %>
