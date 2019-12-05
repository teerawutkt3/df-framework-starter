function getForm() {
	return document.forms[0];
}
function doCmd(cmd, index) {
	if(cmd=='doSave' && !validateForm(getForm())) return;
	if(cmd=='doDelete'){
		$('#deleteModal').modal('show');
		$('#idDeleteModal').val(index);
		 return;
	}
	if(cmd=='doDeleteContinue') {
		cmd='doDelete';
		index = $('#idDeleteModal').val();
		$('#deleteModal').modal('hide');
	}
	var form = getForm();
	form.elements['cmd'].value = cmd;
	if(index != null) form.elements['data_index'].value = index;
	form.submit();
//	headerJs.blockUi();
}
function doCmdA(cmd, aname, index) {	
	if(cmd=='doDelete'){
		$('#deleteModal').modal('show');
		$('#idDeleteModal').val(index);
		 return;
	}
	if(cmd=='doDeleteContinue') {
		cmd='doDelete';
		index = $('#idDeleteModal').val();
		$('#deleteModal').modal('hide');
	}
	
	var form = getForm();
	form.elements['cmd'].value = cmd;
	if(aname == null) aname = cmd;
	form.action += "#"+aname;
	if(index != null) form.elements['data_index'].value = index;
	form.submit();
//	headerJs.blockUi();
}
function popupCmd(cmd, width, height, fixsize, noscrolls) {
	var form = getForm();
	form.elements['cmd'].value = cmd;
	submitPopup(form, form.action, width, height, fixsize, noscrolls);
}
function doGoto(pos) {
	var form = getForm();
	if(form.elements['searchCondition.position'] != null)
		form.elements['searchCondition.position'].value = pos;
	form.elements['cmd'].value = 'list';
	form.submit();
//	headerJs.blockUi();
}
function doSort(orderBy, orderDesc) {
	var form = getForm();
	form.elements['searchCondition.orderBy'].value = orderBy;
	form.elements['searchCondition.orderDesc'].value = orderDesc;
	form.elements['searchCondition.position'].value = 0;
	form.elements['cmd'].value = 'list';
	form.submit();
//	headerJs.blockUi();
}

function getNameIndex(name) {
	if(name == null) return null;
	var ret = new Array();
	while(name.indexOf('[') > 0) {
		ret[ret.length] = parseInt( name.substring(name.indexOf('[')+1, name.indexOf(']')) );
		name = name.substring(name.indexOf(']')+1);
	}
	return ret.length==0?null:ret;
}
