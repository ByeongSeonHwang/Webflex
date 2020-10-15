<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::이메일 인증::</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<link rel="stylesheet" type="text/css" href="../resources/css/email.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
</head>
<body>
<script type="text/javascript">
$('#document').ready(function() {
	$('.type02').hide();
});
</script>
   <header>
      <img src="../resources/images/logo_red.png" width=10% height=5%
         id="logo" />
   </header>
   <div class="email">
         <fieldset>
            <h1>이메일 인증하기</h1>
            <br> <br>
            <div id="email_check">
               <p>비밀번호를 찾을 이메일을 입력하세요</p>
               <br> <br> <input id="email" type="text" class="type01"
                  name="email" textarea="required" placeholder="이메일을 입력하세요">
               <input type="button" value="이메일 전송" class="send" onclick="email_check();"/>
            </div>
            <br>
            <div>
               <input id="number" type="password" class="type01" name="number"
                  textarea="required" placeholder="인증 번호를 입력하세요" maxlength="8"> <input
                  type="button" value="인증번호 확인하기" class="check" onclick="certification_check();" />
            </div>
            <br>
            <div>
               <br>
               <p class="type02"></p>
            </div>
            <br>
            <div id="clk">
			<c:if test="${empty sessionScope.id}">
               	<input type="button" value="로그인" class="login_btn" onClick="location.href='/login';" /> 
               	<input type="button" value="처음 화면으로 이동" class="main_btn" onClick="location.href='/';" />
			</c:if>
			<c:if test="${!empty sessionScope.id }">
				<input type="button" value="이전 페이지로" class="login_btn" onClick="history.back();" /> 
               	<input type="button" value="마이페이지" class="main_btn" onClick="location.href='/mypage';" />
			</c:if>
            </div>
   </div>
   </fieldset>
   </div>   
<script type="text/javascript">
function email_check() {
	var email = $.trim($('#email').val());
	if(email == ""){
		alert('이메일을 입력하세요.');
		$("#email").val('').focus();
	}else{
		$.ajax({
			url: "/email_sender",
			type: "post",
			data: {
				"email" : email
			},
			success: function(data) {
				if($.trim(data) == "fail"){
					alert('WEBFLEX계정이 존재하지 않습니다!');
					$('#email').val('').focus();
				}else{
					alert("인증번호가 '"+email+"'로 발송되었습니다.");
					$('#number').val('').focus();
				}
			},
			error: function() {
				alert('오류')
			}
		});
	}
}

function certification_check() {
	var key = $.trim($('#number').val());
	var id = $.trim($('#email').val());
	if(key != ""){
		$.ajax({
			url : "/key_check",
			type: "post",
			data: {
				"key" : key,
				"id" : id
			},
			success : function(data) {
				if($.trim(data)  != "FAIL"){
					var text = "<font size='4' color='green'>"+id+"로 가입하신 비밀번호는 '"+data+"' 입니다.</font>";
					$('.type02').text('');
					$('.type02').show('slow');
					$('.type02').append(text);
				}else{
					var text = "<font size='4' color='red'>인증에 실패하였습니다.</font>";
					$('.type02').text('');
					$('.type02').show('slow');
					$('.type02').append(text);
				}
			}
		});
	}else{
		alert('인증번호를 입력하세요!');
		$('#number').val('').focus();
	}
}
</script>
</body>
</html>