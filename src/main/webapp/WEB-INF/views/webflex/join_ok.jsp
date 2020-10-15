<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::회원가입 완료::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/join.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
@charset "UTF-8";

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
h2{
text-align: center;
}
.fieldset{
opacity: 90%;
}
</style>
</head>
<body>
<script type="text/javascript">
$('document').ready(function() {
	var message = "${msg}";
	if(message != "SUCCESS"){
		alert('회원가입을 진행하세요!');
		location.href='/join';
	}
});
	
</script>
<!-- header -->
	<header>
		<img src="../resources2/images/logo_red.png" width=10% height=5%; />
	</header>
	<!-- main -->
	<div class="join_main">
			<fieldset class="fieldset">
				<p id="title_join">회 원 가 입</p>
				<br>
				<h2>webflex에 가입하신 것을 축하합니다.</h2>
				<br>
				<h2>저희 webflex에서 다양한 컨텐츠와 영상을 즐겨보세요.</h2>
				<br> <br>
				<p>가입하신 이메일과 비밀번호로 로그인해주시길 바랍니다</p>
				<br> <br><input type="button" class="next" value="로그인창으로 이동"
					onClick="location.href='login';">
			</fieldset>
	</div>

	<!-- Footer -->
	
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