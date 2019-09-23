$(document).ready(function(){
			
	/* 데이터 테이블 초기화 -- 페이지에 있는 전체 테이블 속성이 같게 설정됩니다. */
	$.extend( true, $.fn.dataTable.defaults, {
		"sDom": "<'length-wrap clearfix'l><'table-wrap'tr><'pn-wrap'p>",
		"autoWidth": false,
		"paging": true,
		"bInfo": false,
		"bFilter": false,
		"bSort": false, // 오름,내림 정렬
		"bProcessing":false,
		"bServerSide": true, // 서버용...
		"pagingType": "simple_numbers_no_ellipses",
		"iDisplayLength" : 10,
		"aLengthMenu": [
			[10, 20, 30, -1],
			[10, 20, 30, "All"]
		],
		"oLanguage": {
			"sLengthMenu": "표시개수 _MENU_ ",
			"sProcessing": "",
			"sInfo" : "검색어가 정확한지 확인하시고 다시 시도해 주세요..",
			"sZeroRecords": "검색어가 정확한지 확인하시고 다시 시도해 주세요..",
			"sEmptyTable": "검색어가 정확한지 확인하시고 다시 시도해 주세요..",
			"sInfoEmpty" : "",
			"oPaginate": {
				"sFirst":"First",
				"sPrevious":"Prev",
				"sNext":"Next",
				"sLast":"Last"
			}
		},
		"fnDrawCallback": function(settings){
			var $tableWrapper = $(settings.nTableWrapper);
			var $paging = $tableWrapper.find('.pn-wrap');

			if($tableWrapper.find('table tbody td').hasClass('dataTables_empty')){
				$paging.hide();
			}else{
				$paging.show();
			}
		}
	});
});