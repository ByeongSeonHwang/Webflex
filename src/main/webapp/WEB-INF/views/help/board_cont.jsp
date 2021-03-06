<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX 게시판 내용::</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/help.css">
<link rel="stylesheey" type="text/css" href="../resources/css/wf_reply.css" >
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<style type="text/css">
.w_btn{
float: right}

/* Article Reply */
.article-reply h1 {padding:10px 20px; font-weight:normal; font-size:1.5em; background:white; color:#E50914; margin-left: auto; margin-right: auto; width: 1030px; border:1px solid #ddd }
.reply-wrap {padding:20px; border:1px solid #ddd; background:#fff; margin-left: auto; margin-right: auto; width: 1030px;}
/* Reply Form */
.reply-form {width: 1050px; margin-left: auto; margin-right: auto;}
.reply-form dl.reply-guest {}
.reply-form dl.reply-guest dt {position: absolute; width:1px; height:1px; padding:0; margin:-1px; overflow:hidden; clip:rect(0,0,0,0); border:0;}
.reply-form dl.reply-guest dd {margin-bottom:10px}
.reply-form dl.reply-guest dd input {width:100%; padding:10px 0; border:1px solid #ddd; background:#f9f9f9; color:#999; text-indent:10px;}
.reply-form dl.reply-guest dd input:focus, .reply-form dl.reply-guest dd input:active {background:#fff; color:#111; outline-color: #2D77F4;}
.reply-form dl.reply-write {margin-top:10px;}
.reply-form dl.reply-write dt {position: absolute; width:1px; height:1px; padding:0; margin:-1px; overflow:hidden; clip:rect(0,0,0,0); border:0;}
.reply-form dl.reply-write dd {}
.reply-form dl.reply-write dd textarea {width:100%; margin-bottom:10px; padding:10px 0; height: 80px; border:1px solid #ddd; background:#f9f9f9; color:#999; text-indent:10px;}
.reply-form dl.reply-write dd textarea:focus, .reply-form dl.reply-write dd textarea:active {background:#fff; color:#111; outline-color: #E50914;}
.reply-form button {cursor:pointer; display:block; width:100%; margin:10px 0 0 0; padding:10px 0; border:1px solid #E50914; background:#E50914; color:#fff; text-align:center; font-size: 15px; transition : all 0.5s ease-out;}
.reply-form button:hover {
	background: #fff;
	color: #E50914;
	transition: background 0.5s ease-out;
}
.replyLi{
	margin-left: 420px;
	font-size: 15px;
}
.form{
	width: 100%;
	height: 200px;
}
.reply_btn{
	font-size: 15px;
}
.reply_btn:hover{
	color: #2D77F4;
	transition: color 0.5s ease-out;
}
.reply{
	border-top:1px solid black;
	width: 1050px;
	margin: 0 auto ;
	padding: 5px 5px 5px 10px;
	display: flex;
}
.r_span{
	margin-left: auto;
	text-align: end;
}
.r_edit,.r_del{
	color: black;
	margin-top: 20px;
	background: #fff;
	padding: 5px;
	border: 1px solid black;
	transition: all 0.5s ease-out;
}
.r_edit:hover{
	color: white;
	background: black;
	transition: all 0.5s ease-out;
}
.r_del:hover{
	color: white;
	background: black;
	transition: all 0.5s ease-out;
}
font{
	display: contents;
}
.btn:hover{
	background: black;
	color: white;
	border: 1px solid white;
	transition: backgroud 0.5s ease-out;
	transition: color 0.5s ease-out;
}
</style>
</head>
<body>
<header>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>

</header>
<!-- Notice -->
<div id="sub">

<div id="sub" style="width:1060px; padding:50px 0; margin:0 auto;">

<!-- News Start -->
<div id="sub">
	<table class="boardview_head">
		<tbody><tr>
            <th>${board.board_title }</th>
            <td style="text-align:right;"><span class="name">by ${board.board_writer }</span> <span class="line">|</span> <span class="name">Date</span> <span class="date">${board.board_date }</span></td>
        </tr>
        <tr>
            <td height="10" colspan="2"></td>
        </tr>
    </tbody></table>

    <table class="boardview_text">
        <tbody><tr>
            <td>
                <div style="margin-bottom:20px">
				${board.board_cont }
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
			<button class="list_btn" onclick="location.href='/board_list?page=${param.page}';">
				<div class="btn">목록</div>
			</button>
		</div>
		<c:if test="${!empty sessionScope.id }">
		<c:if test="${sessionScope.nick eq board.board_writer}">
		<div class="w_btn">
			<button class="list_btn" onclick="board_del();">
				<div class="btn">삭제</div>
			</button>
		</div>
		
		<div class="w_btn">
			<button class="list_btn" onclick="location.href='/board_edit?board_no=${board.board_no}&page=${param.page }';">
				<div class="btn">수정</div>
			</button>
		</div>
		</c:if>
		<div class="w_btn">
			<button class="list_btn" onclick="location.href='/board_write?page=${param.page}';">
				<div class="btn">글쓰기</div>
			</button>
		</div>
		</c:if>
		
	</div>
	</div>
	</div>
	</div>
	</table>
	<c:if test="${!empty sessionScope.id }">
	<div class="article-reply">
    <s_rp>
        <h1><s_rp_count><strong>${reply_cnt}</strong></s_rp_count> Comments</h1>
        <div class="reply-wrap">
            <s_rp_input_form>
                <div class="reply-form">
                    <fieldset>
                        <legend class="sr-only">댓글쓰기</legend>
                        <br>
                        <dl class="reply-write">
                            <dt><label for="[##_rp_input_comment_##]" class="lab_write screen_out">내용</label></dt>
                            <dd><textarea name="reply_cont" id="reply_cont" placeholder="여러분의 소중한 댓글을 입력해주세요" title="댓글 내용 입력"></textarea></dd>
                        </dl>
                        <button type="submit" class="reply-btn" onclick="reply_check();"><i class="fa fa-send"></i> 댓글 입력</button>
                    </fieldset>
                </div>
            </s_rp_input_form>
        </div>
    </s_rp>
	</div>
	</c:if>
<!-- //article reply -->
	<br>
	<br>
<script type="text/javascript">
//댓글 입력
function reply_check() {
	var cont = $.trim($('#reply_cont').val());
	var bno = ${board.board_no};
	var email = "${sessionScope.id}";
	if(cont == ""){
		alert('내용을 입력하세요.');
		$("#reply_cont").val('').focus();
		return false;
	}else{
		$.ajax({
			url : "/board/replies",
			type : "post",
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			}, 
			dataType : 'text', 
			data: JSON.stringify({
				board_no:bno,
				reply_cont:cont,
				email : email
			}),
			success : function(result) {
				if(result == 'SUCCESS'){
					alert("댓글이 등록되었습니다!");
					location.reload();
				}
			},
			error: function() {
				alert("오류 발생!");
			}
		});
	}
}
</script>		
	
	
	<%-- 댓글 목록 --%>
	<div id="replyList">
	<c:if test="${!empty reply }">
		<c:forEach var="r" items="${reply }">
			<div class="reply" id="rc${r.reply_no }" style="margin-top: 20px;">
				<input type='hidden' value="${r.reply_no }" id="reply_no${r.reply_no}">
				<font size='4' color='black'>${r.reply_writer }</font><br><br>
		        <font size='3.5' color='black' id="rp_cont${r.reply_no}">${r.reply_cont }</font>
		        <span class='r_span'>DATE : ${r.reply_date }<br>
		        <c:if test="${r.reply_writer == sessionScope.nick}">
		        	<button class='r_edit' onclick='edit_check(${r.reply_no},"${r.reply_cont }","${r.reply_writer }");'>댓글 수정</button>&nbsp;&nbsp;&nbsp;
		        	<button class='r_del' onclick='del_check(${r.reply_no});'>댓글 삭제</button>
		        </c:if>
		        </span>
			</div>
			<script>
			//댓글 삭제
			function del_check(reply_no){
				$.ajax({
					type: "delete",
					url: "/board/replies/del/"+reply_no,
					headers: {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType: "text",
					success: function(data) {
						if($.trim(data) == "SUCCESS"){
							alert('댓글이 삭제되었습니다.');
							location.reload();
						}
					},
					error : function() {
						alert('오류발생!');
					}
				});
			}
		
			
			function edit_check(no,cont,writer) {
				var htmls = "";
				htmls += "<div class='reply-form'><fieldset><legend class='sr-only'>"+writer+"</legend><br>";
				htmls += "<dl class='reply-write'><dt><label for='[##_rp_input_comment_##]' class='lab_write screen_out'>내용</label></dt>";
				htmls += "<dd><textarea name='reply_cont' id='reply_cont"+no+"' placeholder='수정하실 댓글을 입력해주세요'>"+cont+"</textarea></dd></dl>";
				htmls += "<button style='float: left; width:50%;' class='reply-btn' onclick='reply_edit("+no+");'><i class='fa fa-send'></i>수정하기</button><button style='float: left; width:50%;' onclick='location.reload();'>취소</button>";
				htmls += "</fieldset></div>";
				$('#rc'+no).replaceWith(htmls);
			}
			
			</script>
			<script type="text/javascript">
			function reply_edit(no) {
				var reply_no = "${r.reply_no}";
				var reply_cont = $('#reply_cont'+no).val();
				$.ajax({
					type : "POST",
					url: "/board/replies/edit",
					headers: {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					data: JSON.stringify({
						reply_no : no,
						reply_cont : reply_cont
					}),
					dataType: "text",
					success: function(data) {
						if($.trim(data) == "SUCCESS"){
							alert('댓글이 수정되었습니다!');
							location.reload();
						}
					},
					error: function() {
						alert('오류 발생');	
					}
				});
			}
			</script>
		</c:forEach>
	</c:if>
	<c:if test="${empty reply }">
		<div class="reply">
		<font size="4" color="black" style="margin-left: auto; margin-right: auto; display: flex;" >댓글이 존재하지 않습니다.</font>
		</div>
	</c:if>
	</div>
	
	<div class="form"></div>
	
	

<script type="text/javascript">
function board_del() {
	var boardNo = "${board.board_no}";
	location.href='${pageContext.request.contextPath}/board_del?board_no='+boardNo;
	alert('게시물이 삭제되었습니다!');
}
</script>
</body>
</html>