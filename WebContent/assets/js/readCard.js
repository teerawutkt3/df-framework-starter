 
var appJsonUrl = 'http://localhost:12345/';

function getAppJson(queryStr, app) {
	var ret;
	var requestUrl = appJsonUrl+(app!=null?app:'app')+'?'+queryStr+'&ms='+(new Date()).getTime()+'&';
	_block_screen();
	console.log('getAppJson['+requestUrl+']');
	var aj = jQuery.noConflict();
	aj(document).ready(function(){
		if(aj.browser && aj.browser.msie && window.XDomainRequest) {
			alert('browser not support');
			/*// Use Microsoft XDR
			var xdr = new XDomainRequest();
			var json;
			xdr.onload = function() { // only async: true
				json = $.parseJSON(xdr.responseText);
	        };
	        xdr.open("get", requestUrl);
	        xdr.send();*/
	    }else {
	    	
	    	aj.ajax({
				url: requestUrl,
				async: false,
				dataType: 'json',
				success: function (data) {
					
					if(data!=null && data.status==true) ret = data;
					else { if(data.message != null) alert(data.message); ret = null; }
				}
			});
		}
		_unblock_screen();
	});
	return ret;
}

function _block_screen() {
	var bs = jQuery.noConflict();
	bs(document).ready(function(){
		bs('<div id="screenBlock"></div>').appendTo('body');
		bs('#screenBlock').css( { opacity: 0, width: bs(document).width(), height: bs(document).height() } );
		bs('#screenBlock').addClass('blockDiv');
		bs('#screenBlock').animate({opacity: 0.7}, 200);
	});
	
}
function _unblock_screen() {
	var us = jQuery.noConflict();
	us(document).ready(function(){
		us('#screenBlock').animate({opacity: 0}, 200, function() {
			us('#screenBlock').remove();
		});
	});
}

function getContextRootUrl(ctxPath) {
	return window.location.origin+ctxPath;
}