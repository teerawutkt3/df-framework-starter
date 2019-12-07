/**
 * 
 */
var datepickerTh = {};
$(function(){
	var d = new Date();
	var toDay = d.getDate() + '/' + (d.getMonth() + 1) + '/'
			+ (d.getFullYear() + 543);

	$.fn.datepickerTh = function(options){
		var opt = {
				changeMonth : true,			
				changeYear : true,
				dateFormat : 'dd/mm/yy',
				isBuddhist : true,
				defaultDate : toDay,
				dayNames : [ 'อาทิตย์', 'จันทร์', 'อังคาร', 'พุธ', 'พฤหัสบดี', 'ศุกร์', 'เสาร์' ],
				dayNamesMin : [ 'อา.', 'จ.', 'อ.', 'พ.', 'พฤ.','ศ.', 'ส.' ],
				monthNames : [ 'มกราคม', 'กุมภาพันธ์', 'มีนาคม','เมษายน', 'พฤษภาคม', 'มิถุนายน', 'กรกฎาคม', 'สิงหาคม', 'กันยายน', 'ตุลาคม', 'พฤศจิกายน', 'ธันวาคม' ],
				monthNamesShort : ['ม.ค.', 'ก.พ.', 'มี.ค.','เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.','ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.']						
			};
		var settings = $.extend(opt, options);

		return $(this).datepicker(settings);
	}
});