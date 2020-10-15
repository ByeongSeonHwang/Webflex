<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX LOGIN::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css"/>
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
#footer .footerbox {
	float : center;
	color:white;
	margin-left: auto;
	margin-right: auto;
}
#footer {
	padding-top : 10px;
	text-align : center;
	background-color: black;
	background-repeat: no-repeat;
	opacity:100%;
	color: white;
	position: absolute;
	bottom: 0;
	left:0;
	right:0;
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

	color : white;
	border-style : none;
	top : 0;
	font-size: 0.7em;
}
#footer .icons {
	text-align : center;
	font-size : inherit;
	top : 10;
	list-style: none;
	text-decoration: none;
}
#footer .icons:hover{
	text-align : center;
	font-size : inherit;
	top:10;
	text-decoration: none;
}
#footer ul{
	text-align: center;
}
#footer ul li{
	display: inline-block;
}
</style>
<script type="text/javascript">
	
	function id_check() {
		$('#id_check').hide();
		$('#pw_check').hide();
		if($.trim($('#id').val()) == ""){
			$newText = "<font color='red' size='3'>아이디를 입력하세요!</font>";
			$('#id_check').text('');
			$('#id_check').show();
			$('#id_check').append($newText);
			$('#id').val('').focus();
			return false;
		}
		if($.trim($('#pw').val()) == ""){
			$newText = "<font color='red' size='3'>비밀번호를 입력하세요!</font>";
			$('#pw_check').text('');
			$('#pw_check').show();
			$('#pw_check').append($newText);
			$('#pw').val('').focus();
			return false;
		}
	}
</script>
</head>
<body>
<script type="text/javascript">
	var msg = "${msg}";
	if($.trim(msg) == "Inconsistent_pw"){
		alert("비밀번호가 틀렸습니다.");
	}
	if($.trim(msg) == "login_failed"){
		alert("WEBFLEX 계정을 찾을 수 없습니다.");
	}
	if($.trim(msg) == "logout"){
		alert("로그아웃 되었습니다.");
	}
	if($.trim(msg) == "naver_pw"){
		alert('소셜 계정으로 가입된 회원입니다.');
	}
	if($.trim(msg) == "nick_over"){
		alert('중복된 닉네임 입니다!');
	}
	if($.trim(msg) == "overlap"){
		alert('중복된 이메일 입니다!');
	}
	if($.trim(msg) == "FAIL"){
		alert('처음부터 진행해주세요.');
	}
	var id = "${sessionScope.id}";
	if($.trim(id) != ""){
		alert("로그인 되어 있습니다.");
		location.href="/main";
	}	
</script>
<header>
	<div id="right_head">
<a href="/"><img src="../resources2/images/logo_red.png" width=10% height=5% id="logo"/></a>
</div>
</header>
	<div class="login_main">
		<form action="/login_check" method="post" onsubmit="return id_check();">

			<!-- fieldset : 하나의 그룹으로 묶은 요소들 주변으로 박스 모양의 선을 그려줌 -->
			<fieldset class="fieldset">

				<legend> </legend>
				<!-- legend :  fieldset태그의 이름 지정 가능 -->
				<p id="title_login">LOGIN</p>
				<br>
				<div id="login">
					<p>ID</p>
					<input id="id" type="text" class="type01" name="email"
						textarea="required" placeholder="Enter your ID(Email)">
					<br>
					<span id="id_check"></span>
				</div>
				<br>
				<br>
				<div id="password">
					<p>Password</p>
					<br>
					<input type="password" id="pw" class="type01" textarea="required"
						placeholder="Enter your Password" name="password"/>
						<br>
					<span id="pw_check"></span>
				</div>
				<br>
				<br>
				
				<div class="naver">
               		<a href="${url }" class="link_login" data-clk="log_off.login">
               			<i class="ico_naver">
               				<span class="blind">N</span>
               			</i>네이버 아이디 로그인
               		</a>
            	</div>
            
				
				<br>
				<div>
					<input type="submit" value="로그인" class="login_btn" />
				</div>
			
				<br>
				<div>
					<input type="button" value="비밀번호 찾기" class="find" onclick="location.href='/email_find';" />
				</div>
				<br>
			
				<br>
				<div>
					<p id="warning">
						WEBFLEX 회원이 아니세요? &nbsp; &nbsp; &nbsp; 지금 &nbsp; 가입하세요 ---> &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; <a href="/ex_join" class="join">회원가입</a>
					</p>
				</div>

			</fieldset>
		</form>
	</div>
<%--footer --%>
<footer id="footer">
		<ul class="icons">
			<li><a href="https://ko-kr.facebook.com/NetflixKR/">
				<i class="fab fa-facebook-f">&nbsp;Facebook&nbsp;</i></a></li>
			<li><a href="">
				<i class="fab fa-twitter-square">&nbsp;Twitter&nbsp;</i></a></li>
			<li><a href="https://www.instagram.com/netflixkr/?hl=ko">
				<i class="fab fa-instagram">&nbsp;Instagram&nbsp;</i></a></li>
		</ul>
		<div class="footerbox">
			<p class="copyright">
				<a href="#">고객 센터 </a><br><br>
				&copy; 웹플렉스서비시스코리아 &nbsp; 유한회사 &nbsp; 통신판매업신고번호: 제xxxx-서울종로-xxxx호<br><br>
				대표: 이용준<br> 이메일 주소: korea@webflex.com<br>
				주소: 서울 동작구 장승배기로 171 2층, 3층<br>
				클라우드 호스팅: Amazon Web Services Inc.: <a href="http://html5up.net">&nbsp;HTML5 UP</a>
			</p>
		</div>
	</footer>

</body>
</html>