<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX 게시판 수정::</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- <script src="resources/js/jquery-3.5.1.min.js"></script> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<link rel="stylesheet" type="text/css" href="../resources/css/help.css">
<style type="text/css">
#board_pw, #board_title{
	margin-top: 25px;
}
th{
	width: 100px;
}
.w_btn{
	float: right;
}
</style>
</head>
<body>
<script type="text/javascript">
	var id = "${sessionScope.id}";
	if($.trim(id) == ""){
		alert('로그인 후 이용해주세요!');
		location.href='/login';
	}
</script>
<header>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>
</header>  
<div id="sub" style="width:1060px; padding:50px 0; margin:0 auto;">
<input type="hidden" value="${board.board_no }" id="board_no"/>
<!-- News Start -->
<div id="sub">
	<table class="boardview_head">
		<tbody>
			<tr>
				<th>제목</th>
				<td><textarea cols="22" rows="1" maxlength="10" id="board_title">${board.board_title }</textarea></td>
			</tr>
		</tbody>
	</table>
    <table class="boardview_text">
        <tbody>
			<tr>
				<td>
					<div style="margin-bottom:20px">
					<textarea id="summernote" class="summernote">${board.board_cont }</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td height="20"></td>
			</tr>
		</tbody>
    </table>
	<div style="width:1060px; margin:0 auto;">
		<div class="w_btn">
			<a href="./board_list?page=${param.page }">
				<div class="btn">목록</div>
			</a>
		</div>
		<div class="w_btn">
			<button onclick="edit_check();">
				<div class="btn">확인</div>
			</button>
		</div>
		<div class="w_btn">
			<button type="reset">
				<div class="btn">취소</div>
			</button>
		</div>
	</div>
</div>
</div>
<script>
var url;
$(document).ready(function(){
	$('#summernote').summernote({
		width:1030,
		height:500,
		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			}
		}
	});

	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
				console.log(data);
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
				 url = data.url;
			}
		});
	}
});


function edit_check() {
	if($.trim($('#board_title').val()) == ""){
		alert('제목을 입력하세요!');
		$('#board_title').val('').focus();
		return false;
	}
	if($.trim($('#summernote').val()) == ""){
		alert('내용을 입력하세요!');
		$('#summernote').focus();
	}else{
		const boardInfo={
				board_no:$.trim($("#board_no").val()), //게시물 번호
				board_title:$.trim($("#board_title").val()),//db에 저장할 게시판 제목
			    board_cont:$("#summernote").val(),// " 내용
			    board_path:url// " 이미지 파일 경로
			       };
			       console.log(boardInfo);
			       //여기서부터 데이터베이스에 글 등록하기윙해 board_insert매핑주소에 JSON타입으로 전달
			        $.ajax({
			          type:"post",
			          url:"/board_edit_ok?page=${param.page}",
			          headers:{"Content-Type":"application/json"},//json형식으로 보내기
			          data:JSON.stringify(boardInfo),//보낼 정보
			          success:function(){
			            window.location.replace("/board_cont?board_no=${board.board_no}&page=${param.page}");//성공시 페이지 이동
			         	}
			       });
	}
}
</script>
</body>
</html>