<%@ page contentType="text/html; charset=UTF-8"%>\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX소셜 회원가입::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/join.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/join2.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
@charset "UTF-8";

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
	position: absolute;
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
</style>
<script type="text/javascript">
	var msg = "${msg}"
	if($.trim(msg) == "new_user"){
		alert('신규회원 입니다. 추가 정보를 입력해주세요!');
	}
</script>
</head>
<body>
	<!-- header -->
	<header>
		<a href="/login"><img src="../resources2/images/logo_red.png" width=10% height=5%; /></a>
	</header>
	<!-- main -->
	<div class="join_main">
		<form action="/join_ok" method="post" onsubmit="return join2_check();">
		<input type="hidden" value="${email }" name="email">
		<input type="hidden" value="${password }" name="password">
			<fieldset class="fieldset">
				<p id="title_join">회 원 가 입</p>
				<legend> </legend>
				<br>
				<h3>간단한 정보를 입력해주세요</h3>
				<br>
				<div id="join_name">
					<input id="name" type="text" class="type01" name="name"
						textarea="required" placeholder="이름" value=${name }>
					<div class="red"></div>
					<br>
					<span id="name_check"></span>
				</div>
				<br>
				<div id="join_nick">
					<input id="nick" type="text" class="type01" name="nick"
						textarea="required" placeholder="닉네임" maxlength="10"> <br>
						<span id="nick_check"></span>
				</div>
				<br>
				<div id="join_birth">
					<p id="birth">생 년 월 일</p>
					<br> <input type="text" name="year" id="birthyy"
						maxlength="4" size="6">&nbsp;년 &nbsp;&nbsp; <input
						type="text" name="month" id="birthmm" maxlength="2" size="4" value="${month }">&nbsp;월&nbsp;&nbsp;
					<input type="text" name="day" id="birthdd" maxlength="2" size="4" value="${day }">&nbsp;일&nbsp;<br>
					<span id="birth_check"></span>
				</div>
				<br>
				<div id="join_phone">
					<br> <input type="tel" class="type01" name="phone" id="phone"
						maxlength="11" placeholder="전화번호('-'를 빼고 기입해 주세요.)"><br>
					<span id="tel_check"></span>
				</div>
				<br>
				<p>
					<input type="submit" class="next" value="확인"> <br> <input
						type="reset" class="next" value="취소"
						onclick="$('.type01').val('').focus();">
				</p>
			</fieldset>
		</form>
	</div>
	<br>
	<!-- Footer -->

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
		$("#name_check").hide();
		$("#nick_check").hide();
		$("#tel_check").hide();
		$("#birth_check").html("<font size='2' color='green'>형식: yyyy년 mm월 dd일</font>");
		function join2_check() {
			$("#name_check").hide();
			$("#nick_check").hide();
			$("#birth_check").hide();
			$("#tel_check").hide();
			if ($.trim($('#name').val()) == "") {
				$newText = "<font size='2' color='red'>이름을 입력하세요.</font>";
				$("#name_check").text('');
				$('#name_check').show();
				$('#name_check').append($newText);
				$("#name").focus();
				return false;
			}
			if ($.trim($('#nick').val()) == "") {
				$newText = "<font size='2' color='red'>별명을 입력하세요.</font>";
				$("#nick_check").text('');
				$('#nick_check').show();
				$('#nick_check').append($newText);
				$("#nick").focus();
				return false;
			}
			if ($.trim($('#birthyy').val()) == "") {
				$newText = "<font size='2' color='red'>년도를 입력하세요.</font>";
				$("#birth_check").text('');
				$('#birth_check').show();
				$('#birth_check').append($newText);
				$("#birthyy").focus();
				return false;
			}
			if ($.trim($('#birthmm').val()) == "") {
				$newText = "<font size='2' color='red'>월을 입력하세요.</font>";
				$("#birth_check").text('');
				$('#birth_check').show();
				$('#birth_check').append($newText);
				$("#birthmm").focus();
				return false;
			}
			if ($.trim($('#birthdd').val()) == "") {
				$newText = "<font size='2' color='red'>일을 입력하세요.</font>";
				$("#birth_check").text('');
				$('#birth_check').show();
				$('#birth_check').append($newText);
				$("#birthdd").focus();
				return false;
			}
			if ($.trim($('#phone').val()) == "") {
				$newText = "<font size='2' color='red'>전화번호를 입력하세요.</font>";
				$("#tel_check").text('');
				$('#tel_check').show();
				$('#tel_check').append($newText);
				$("#phone").focus();
				return false;
			}
		};
		$('#phone').on("keyup",function() {
			var phoneVal = $.trim($("#phone").val());
			var regExp = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
			if (phoneVal.match(regExp) == null) {
				$newText = "<font size='2' color='red'>존재하지 않는 형식의 전화번호 입니다..</font>";
				$("#tel_check").text('');
				$('#tel_check').show();
				$('#tel_check').append($newText);
			} else {
				$newText = "<font size='2' color='green'>전화번호 형식이 정확합니다.</font>";
				$("#tel_check").text('');
				$('#tel_check').show();
				$('#tel_check').append($newText);
			}
		});
		
		$('#name').on("keyup", function() {
			var nameVal = $.trim($('#name').val());
			var regExp = /^[가-힣]{2,4}$/;
			if(nameVal.match(regExp) == null){
				$newText = "<font size='2' color='red'>올바른 이름을 입력해주세요.</font>";
				$('#name_check').text('');
				$('#name_check').show();
				$('#name_check').append($newText);
			}else{
				$('#name_check').hide();
			}
		});
		
		$('#nick').on("keyup", function() {
			var nickVal = $.trim($('#nick').val());
			var regExp = /^.{2,15}$/;
			if(nickVal.match(regExp) == null){
				$newText = "<font size='2' color='red'>닉네임은 2~15자 이내로 입력해주세요</font>";
				$('#nick_check').text('');
				$('#nick_check').show();
				$('#nick_check').append($newText);
			}else{
				$.ajax({
					type: "POST",
					url: "nick_check",
					data: {
						"nick" : nickVal
					},
					datatype: "int",
					success: function(data) {
						if($.trim(data) == 0){
							$newText = "<font size='2' color='green'>사용 가능한 닉네임 입니다.</font>";
							$('#nick_check').text('');
							$('#nick_check').show();
							$('#nick_check').append($newText);
						}else{
							$newText = "<font size='2' color='red'>중복되는 닉네임</font>";
							$('#nick_check').text('');
							$('#nick_check').show();
							$('#nick_check').append($newText);
						}
					},
					error: function() {
						alert("error!");
					}
				});
			}
		});
		
		$('#birthyy').on("keyup", function() {
			var birthVal = $.trim($('#birthyy').val());
			var regExp =  /^[0-9]*$/
			if(birthVal.match(regExp) == null){
				$newText = "<font size='2' color='red'>숫자만 입력하세요!</font>";
				$('#birth_check').text('');
				$('#birth_check').show();
				$('#birth_check').append($newText);
			}else{
				$('#birth_check').hide();
			}
		});
		
		$('#birthmm').on("keyup", function() {
			var birthVal = $.trim($('#birthmm').val());
			var regExp =  /^[0-9]*$/
			if(birthVal.match(regExp) == null){
				$newText = "<font size='2' color='red'>숫자만 입력하세요!</font>";
				$('#birth_check').text('');
				$('#birth_check').show();
				$('#birth_check').append($newText);
			}else{
				$('#birth_check').hide();
			}
		});
		
		$('#birthdd').on("keyup", function() {
			var birthVal = $.trim($('#birthdd').val());
			var regExp =  /^[0-9]*$/
			if(birthVal.match(regExp) == null){
				$newText = "<font size='2' color='red'>숫자만 입력하세요!</font>";
				$('#birth_check').text('');
				$('#birth_check').show();
				$('#birth_check').append($newText);
			}else{
				$('#birth_check').hide();
			}
		});
	</script>
</body>
</html>