$(document).ready(function(){
	
	/* 메뉴 active */
	var path = window.location.pathname;
	$(".gnb .menu a").each(function(){
		var $this = $(this);
		var href = $this.attr('data-href');

		if (path.indexOf(href) > -1) {
			$this.addClass('active');
		}
	});

	/* 셀렉트 이벤트 */
	$(document).on('change', '.select-change', function(){ 
		selectChange(this);
	});

});

function validationError(input, submitBtn, alertMsg){
	alert(alertMsg);
	input.focus();
	submitBtn.prop("disabled", false);
}

function resizeDialogPosition(){
	$(window).resize(function(){
		$(".ui-dialog-content:visible").each(function(){
			var $this = $(this);
			$this.dialog("option","position", $this.dialog("option","position"));
		});
	});
}

/* datepicker, 시작일, 종료일 */
function startEndDate(start, end){
	/* 시작일 */
	$(start).datepicker({
		onClose: function( selectedDate ){
			$(end).datepicker("option", "minDate", selectedDate);
		}
	});
	
	/* 종료일 */
	$(end).datepicker({
		onClose: function( selectedDate ){
			$(start).datepicker("option", "maxDate", selectedDate);
		}
	});
}

/* Select Change */
function selectChange(t){
	var selectName = $(t).children('option:selected').text();
	$(t).siblings(".select-arrow").text(selectName);
}

/* loading - 시작 */
function loadingStart(){ 
	$('.data-process').show();
}

/* loading - 중지 */
function loadingStop(){
	$('.data-process').hide();
}