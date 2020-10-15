<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::회원 탈퇴::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/payend.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
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
<body>
	<jsp:include page="../header/subpage_header.jsp"></jsp:include>

	<div id="ask" style="margin-top: 200px;">
		<h1>웹플렉스에서 탈퇴하실거에요? &nbsp;:(</h1>
		<br>
		<h3>회원정보를 삭제하시려면 아래를 확인해 주세요</h3>
		<br>
		<br>
		
		<div id="ask_box" style="height: 350px;">
		<c:set var="now" value="<%=new java.util.Date()%>" />
			<div style="margin-top: 50px;">
				<br>
				<p style=" font-size: 20px;">서비스는 탈퇴 당일날인&nbsp; <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일" />이후로는 사용하실 수 없습니다.</p>
				<br>
				<p style=" font-size: 20px; margin-bottom: 15px;">
					탈퇴하시면 WEBFLEX의 서비스를 이용하기 위해서는 재가입 후 결제를 다시 진행해야 합니다.
					<br> 
					정말 회원탈퇴 하시겠습니까?<br>
				</p>
			</div>
			<br>
			<p>
			</p>
			<br>
			<div class="buttons">
				<button id="delete_clk"
					class="delete" onclick="del_btn_show();" style="font-size: 15px; height: 35px;">
					회원 탈퇴하기
				</button>
				<button onclick="location.href='/mypage';" style="font-size: 15px; height: 35px;">뒤로 가기</button>
				<!-- action : 메인 화면으로 돌아가는 링크 쓰기 -->
			</div>
			<br>
			<input type="password" name="password" id="password" style="width: 245px; margin-left: 27%; height: 34px;" placeholder="탈퇴하시려면 비밀번호를 입력해주세요.">
			<button id="pw_check" style="padding: 10px 10px 10px 10px; width: 60px; height: 40px;" onclick="del_check();">확인</button>
		</div>
	</div>
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
$('#password').hide();
$('#pw_check').hide();

function del_btn_show() {
	$('#password').show('');
	$('#pw_check').show('');
}

function del_check() {
	var password = $.trim($('#password').val());
	if(password == ""){
		alert('비밀번호를 입력하세요!');
		$('#password').val('').focus();
	}else{
		var flag = confirm('정말 탈퇴하실건가요?');
		if(flag == true){
			$.ajax({
				url : "/sign_out_ok",
				type: "post",
				data : {
					password : password
				},
				success: function(data) {
					if($.trim(data) == "OK"){
						alert('그동안 감사했습니다. 다음에도 WEBFLEX를 이용해주세요');
						sessionStorage.clear();
						location.href='/logout';
					}else{
						alert('비밀번호가 틀렸습니다!');
						$('#password').val('').focus();
					}
				}
			});
		}else{
			alert('마음을 돌리셨군요 !!');
			location.href='/mypage';
		}
	}
}

</script>

</body>
</html>