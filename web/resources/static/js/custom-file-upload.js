// el = 대상 element
// 함수안 변수 & 함수들은 외부 참조 불가능하면 
// return으로 공개 메소드로 만든 getFileData, resetFileUpload만 사용가능 
// ex) var test = fileUpload();
//     test.getFileData(); => 현재 등록된 파일값을 return 등록된 파일이 없을경우 null
//     test.resetFileUpload(); => 함수안 파일정보를 가지고있는 변수 초기화 & 레이아웃 초기화, input file도 value값은 삭제시키긴 하나... 기본적으로 input의 value값을 사용하진 않음.
;function fileUpload(el, regexPattern){
	var fileData = null; // 해당 변수에 선택한 파일의 정보 넣음.
	var $fileDrop = $(el);
	var $inputFile = $fileDrop.find('input[type="file"]');
	var $fileIcon = $fileDrop.find('.file-info .file-icon');
	var $fileText = $fileDrop.find('.file-info .text');
	var regexPattern = regexPattern;

	function imgSrcChange(changeSrc){
		var imgDataSrc = $fileIcon.attr('data-src');
		$fileIcon.attr({
			'src': $fileIcon.attr('src').replace(imgDataSrc, changeSrc),
			'data-src': changeSrc
		}); 
	}

	function handleFileUpload(files){
		imgSrcChange('success');
		$fileDrop.removeClass('fail');
		$fileText.html('<strong>파일명 : </strong>' + files.name);

		fileData = files;
	}

	function resetFileUpload(){
		imgSrcChange('default');
		$fileDrop.removeClass('fail');
		$fileText.html('마우스로 드래그하여 파일을 끌어오세요.');
		
		$inputFile.val('');
		fileData = null;
	}
	
	function fileError(){
		fileData = null;
		imgSrcChange('fail');
		$fileDrop.addClass('fail');
		$fileText.html('잘못된 파일 형식입니다.');
	}

	function getFileData(){
		return fileData;
	}

	// 파일형식 체크
	function validation(fileName){
		var ext = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

		if(!regexPattern.test(ext)){
			return true;
		}else{
			return false;
		}
	}
	
	$fileIcon.attr('data-src', 'default');

	$fileDrop.on('dragover', function(e){
		stopDefaultEvent(e);
		$(this).addClass('dragover');
	}).on('dragleave', function(e){
		stopDefaultEvent(e);
		$(this).removeClass('dragover');
	}).on('drop', function(e){
		stopDefaultEvent(e);
		var files = e.originalEvent.dataTransfer.files;
		$(this).removeClass('dragover');

		if(files.length < 1){
			return false;
		}else if(files.length > 1){
			alert('1개의 파일만 선택해주세요.');
			return false;             
		}

		var file = files[0]; // 파일리스트중 첫번째 한개만 선택
		
		if(validation(file.name)){
			fileError();
			return false; 
		}	

		handleFileUpload(file);
	});

	$inputFile.on('change', function(){
		var file = this.files[0]; // 파일리스트중 첫번째 한개만 선택
		// 사용자가 파일찾기를 열었다가 취소버튼을 눌렀을경우 크롬 브라우저에선 파일값이 초기화, 그 경우 초기화시킵니다.
		if(!file){
			resetFileUpload();
			return false;
		}

		if(validation(file.name)){
			fileError();
			return false; 
		}	
		
		handleFileUpload(file);
	});

	return {
		getFileData: getFileData,
		resetFileUpload: resetFileUpload
	}
}

function stopDefaultEvent(e){
	e.stopPropagation();
	e.preventDefault();
}

// 페이지에 기본 드래그, 드롭 중지
$(document).on('dragover dragleave drop', function(e){
	stopDefaultEvent(e);
});