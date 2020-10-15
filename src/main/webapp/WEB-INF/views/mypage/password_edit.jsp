<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::비밀번호 변경::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/pwd_edit.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
#footer .footerbox {
	float: center;
	color: white;
	margin-left: auto;
	margin-right: auto;
}

#footer {
	padding-top: 10px;
	text-align: center;
	background-color: black;
	background-repeat: no-repeat;
	opacity: 100%;
	color: white;
	position: relative;
	bottom: 0;
	left: 0;
	right: 0;
	width: 100%;
}

#footer a {
	text-decoration: none;
	color: inherit;
}

#footer a:hover {
	text-decoration: none;
	color: red;
}

#footer .copyright {
	color: white;
	border-style: none;
	top: 0;
	font-size: 0.7em;
}

#footer .icons {
	text-align: center;
	font-size: inherit;
	top: 10;
	list-style: none;
	text-decoration: none;
}

#footer .icons:hover {
	text-align: center;
	font-size: inherit;
	top: 10;
	text-decoration: none;
}

#footer ul {
	text-align: center;
}

#footer ul li {
	display: inline-block;
}
span{
	float: right;
}
</style>
</head>
<body>
<script type="text/javascript">
	var id = "${sessionScope.id}";
	var msg = "${msg}";
	if($.trim(id) == ""){
		alert('로그인 후 이용해 주세요!');
		location.href='/login';
	} 
	if($.trim(msg) == "overlap"){
		alert('비밀번호가 다릅니다!');
	}
</script>
	<header>
		<jsp:include page="../header/subpage_header.jsp"></jsp:include>
	</header>
	
	
	<div class="p1">
		<div class="p1_1">
			<div class="pwd">
					<form action="/password_edit_check" method="post" onsubmit="return password_check();">
					<h1>비밀번호 변경</h1>
					<a class="pp" href="/email_find"><Br>비밀번호를 잊으셨나요?<br>
					<br></a>
					<div class="pwd1">
						<label for="id_currentPassword" class="Label"></label> 
						<input type="password" id="password" class="pw1" placeholder="기존 비밀번호" name="password">
							<br>
							<button id="password_btn" onclick="change_check();" type="button">비밀번호 확인</button>
							<span id="pw_check"></span>
					</div>
					<div class="pwd1">
						<label for="id_currentPassword" class="Label"></label> 
						<input type="password" id="new_password1" class="pw1" placeholder="새비밀번호(8-16자)" name="new_password">
						<br>
						<span id="pw2_check"></span>
					</div>
					<div class="pwd1">
						<label for="id_currentPassword" class="Label"></label> 
						<input type="password"  id="new_password2" class="pw1" placeholder="새 비밀번호 재입력">
						<br>
						<span id="pw3_check"></span>
					</div>
					<div class="remember">
					<label for="remember">모든 디바이스에서 새로운 비밀번호로 다시 로그인하셔야 합니다.</label>
					</div>		
			</div>
			<div class="btn">
				<div id="sb1">
					<button type="submit">저장</button>
				</div>

				<div id="sb2">
					<button type="reset">취소</button>
				</div>
			</div>
		</div>
	</div>
	</form>
	<footer id="footer">
		<ul class="icons">
			<li><a href="https://ko-kr.facebook.com/NetflixKR/"> <i
					class="fab fa-facebook-f">&nbsp;Facebook&nbsp;</i></a></li>
			<li><a href=""> <i class="fab fa-twitter-square">&nbsp;Twitter&nbsp;</i></a></li>
			<li><a href="https://www.instagram.com/netflixkr/?hl=ko"> <i
					class="fab fa-instagram">&nbsp;Instagram&nbsp;</i></a></li>
		</ul>
		<div class="footerbox">
			<p class="copyright">
				<a href="#">고객 센터 </a><br>
				<br> &copy; 웹플렉스서비시스코리아 &nbsp; 유한회사 &nbsp; 통신판매업신고번호:
				제xxxx-서울종로-xxxx호<br>
				<br> 대표: 이용준<br> 이메일 주소: korea@webflex.com<br> 주소: 서울
				동작구 장승배기로 171 2층, 3층<br> 클라우드 호스팅: Amazon Web Services Inc.: <a
					href="http://html5up.net">&nbsp;HTML5 UP</a>
			</p>
		</div>
	</footer>
<script type="text/javascript">
$('#pw_check').hide();
$('#pw2_check').hide();
$('#pw3_check').hide();

function change_check() {
	var password = $.trim($('#password').val());
	if(password == ""){
		var newText = "<font size='2' color='red'>기존 비밀번호를 입력하세요.</font>"
		$('#pw_check').text('');
		$('#pw_check').show();
		$('#pw_check').append(newText);
		$('#password').val('').focus();
		return false;
	}else{
		$.ajax({
			url: "/password_check",
			type: "post",
			data: {
				"password" : password
			},
			success: function(data) {
				console.log(data);
				if($.trim(data) == "1"){
					var newText = "<font size='2' color='green'>패스워드가 인증되었습니다.</font>"
					$('#pw_check').text('');
					$('#pw_check').show();
					$('#pw_check').append(newText);
					$('#new_password1').val('').focus();
				}else if($.trim(data) == "-1"){
					var newText = "<font size='2' color='green'>데이터베이스 오류가 발생되었습니다.</font>"
					$('#pw_check').text('');
					$('#pw_check').show();
					$('#pw_check').append(newText);
					$('#password').val('').focus();
				}else{
					var newText = "<font size='2' color='red'>기존 비밀번호가 다릅니다.</font>"
					$('#pw_check').text('');
					$('#pw_check').show();
					$('#pw_check').append(newText);
					$('#password').val('').focus();
				}
			},
			error: function() {
					var newText = "<font size='2' color='red'>에러발생</font>"
					$('#pw_check').text('');
					$('#pw_check').show();
					$('#pw_check').append(newText);
					$('#password').val('').focus();
			}
		});
	}
}
	
function password_check() {
	var pwVal = $.trim($("#password").val());
	var id = "${sessionScope.id}";
	var new_pw1 = $.trim($("#new_password1").val());
	var new_pw2 = $.trim($("#new_password2").val());
	
	if(new_pw1 == ""){
		alert('비밀번호를 입력하세요!');
		$('#new_password1').val('').focus();
		return false;
	}
	if(new_pw2 == ""){
		alert('비밀번호를 재입력하세요!');
		$('#new_password2').val('').focus();
		return false;
	}

	if(new_pw1 != new_pw2){
		var newText = "<font size='2' color='red'>재입력한 비밀번호가 다릅니다.</font>"
		console.log(newText);
		$('#pw2_check').text('');
		$('#pw2_check').show();
		$('#pw2_check').append(newText);
		$('#new_password1').val('').focus();
		return false;
	}
}




$('#new_password1').on('keyup', function() {
	var pwVal = $.trim($("#new_password1").val());
	var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
	
	if(pwVal.match(regex) == null){
		$newText = "<font size='2' color='red'>비밀번호는 문자, 숫자를 조합하여 8~16자 이내이여야 합니다.(특수문자 x)</font>"
		$('#pw2_check').text('');
		$('#pw2_check').show();
		$('#pw2_check').append($newText);
	}else {
		$newText = "<font size='2' color='green'>사용 가능한 비밀번호.</font>"
		$('#pw2_check').text('');
		$('#pw2_check').show();
		$('#pw2_check').append($newText);
	}
});

$('#new_password2').on('keyup', function() {
	var pwVal = $.trim($("#new_password2").val());
	var pwVal2 = $.trim($('#new_password1').val());
	
	if(pwVal == pwVal2){
		$newText = "<font size='2' color='green'>비밀번호가 일치합니다.</font>"
		$('#pw3_check').text('');
		$('#pw3_check').show();
		$('#pw3_check').append($newText);
	}else {
		$newText = "<font size='2' color='red'>비밀번호가 일치하지 않습니다.</font>"
		$('#pw3_check').text('');
		$('#pw3_check').show();
		$('#pw3_check').append($newText);
	}
});

</script>
</body>
</html>