<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-nested.tld" prefix="nested"%>
<%@ include file="/include/_headermenu_mdb.jsp"%>


<nested:form action="/top/project">
	<nested:define id="pageCode" property="pageCode" type="String" />
	<input type="hidden" name="cmd" value="" />
	<input type="hidden" name="data_index" value="" />
	<div class="row">
		<div class="col-md-12">		
			<div class="card shadow">
			<div class="card-header"><b>Search</b></div>
				<div class="card-body">				
					<div class="form-group row justify-content-center">						
						<div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3">
							<nested:text styleClass="form-control" property="searchCondition.name" placeholder="Project Name" />							
						</div>						
						<div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3">
							<nested:text styleClass="form-control" property="searchCondition.budgetStr" placeholder="Budget"  />							
						</div>
					</div>
<!-- 					<div class="form-group row"> -->
<!-- 						<div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3"> -->
<!-- 							<label> Create Date: </label> -->
<!-- 						</div> -->
<!-- 						<div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3"> -->
<%-- 							<nested:text styleClass="form-control" property="searchCondition.createdDate" /> --%>
<!-- 						</div>						 -->
<!-- 					</div> -->
					<div class="form-group row justify-content-center mt-5">
						<button type="button" class="btn btn-info shadow" onclick="doGoto(0)"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;ค้นหา</button>&nbsp;
						<button type="button" class="btn btn-info shadow" onclick="doCmd('listAll')"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;แสดงทั้งหมด</button>&nbsp;
						<button type="button" class="btn btn-secondary shadow" onclick="doCmd('resetSearch')" ><i class="fa fa-repeat" aria-hidden="true"></i>&nbsp;เริ่มค้นหาใหม่</button>&nbsp;
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col-md-12">		
			<div class="card shadow">
			<div class="card-header">
				<div class="row">
					<div class="col-sm-6 align-self-center"><b>Result</b></div>
					<div class="col-sm-6 text-right">
						<nested:equal property="canCreate" value="true">						
							<button  class="btn btn-success btn-sm" type="button" onclick="doCmd('goCreate')"><i class="fa fa-plus-circle"></i>&nbsp; เพิ่มข้อมูล</button>
						</nested:equal>
					</div>
				</div>
			
			</div>
				<div class="card-body">				
					<table class="table table-striped table-sm table-hover">
						<thead>
							<tr>
								<th class="text-center">#</th>
								<th class="text-center">Code</th>
								<th>Name</th>
								<th>Budget</th>
								<th>Customer</th>
								<th class="text-center">Create Date</th>
								<th class="text-right"></th>
							</tr>
						</thead>
						<tbody>
							<nested:iterate property="searchResult.data" id="result" indexId="ind">
								<tr class="tr<%= ind.intValue()%2 %>">
									
									<td class="text-center"><%= ind.intValue()+1 %></td>
									<td class="text-center"><nested:write name="result" property="code" /></td>
									<td><nested:write name="result" property="name" /></td>
									<td><nested:write name="result" property="budget" /></td>
									<td><button type="button" class="btn btn-sm btn-primary">Customer</button></td>
									<td class="text-center"><nested:write name="result" property="createdDateStr" /></td>
									<td class="text-right">
										<a class="btn btn-info btn-sm" title="ดูข้อมูล" href="javascript:doCmd('goView', <%= ind %>)"><i class="fa fa-eye"></i></a>
										<nested:equal name="<%= pageCode %>" property="canUpdate" value="true">&nbsp;<a title="แก้ไข" class="btn btn-warning btn-sm" href="javascript:doCmd('goUpdate', <%= ind %>)"><i class="fa fa-edit"></i></a></nested:equal>
										<nested:equal name="<%= pageCode %>" property="canDelete" value="true">&nbsp;<a title="ลบข้อมูล" class="btn btn-danger btn-sm" href="javascript:doCmd('doDelete', <%= ind %>)"><i class="fa fa-trash"></i></a></nested:equal>
									</td>
								</tr>
							</nested:iterate>							
						</tbody>
					</table>
					<%@ include file="/include/_cursor.jsp"%>
				</div>
			</div>
		</div>
	</div>
</nested:form>
<%@ include file="/include/_footermenu_mdb.jsp"%>