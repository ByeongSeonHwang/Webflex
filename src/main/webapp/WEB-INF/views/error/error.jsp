<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/error.css" />
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
	position: fixed;
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
</head>
<body>
<header>
		<img src="../resources2/images/logo_red.png" width=10%; height=5%; />
</header>
<div id="main">
	<h1></h1>
	<br>
	<h2>
		요청하신 페이지를 찾을 수 없습니다
	</h2>
	<br>
	<br>
	<div id="button">
		<input type="button" id="main_btn" value="뒤로가기" onclick="history.back();" />
		<input type="button" id="logout_btn" value="메인 페이지로 이동" onclick="location.href='/main'" />
	</div>
	<br>
	<br>
	<div id="error">
	<h3> 오류 코드 : AAAAAA </h3>
	</div>
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