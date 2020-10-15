<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/main_header.css" />
<link rel="shortcut icon" href="../resources2/images/Netflix_favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>

<style>
body {
	position: static;
}

#clear {
	clear: both;
}

/* #main_back_image{
	position:absolute;
	top:0px;
	left:0px;
	width: 100%;
	z-index: -1;
} */
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, a, button,
	form, fieldset, p, blockquote {
	margin: 0;
	padding: 0;
	font-size: 23px
}

img, fieldset {
	border: none
}

body, dl, dt, dd, th, td, div, p, a, button, table, li, form, fieldset,
	legend, input, button, textarea, select {
	
}

body, dl, dt, dd, th, td, div, p, a, button, table, li {
	font-size: 12px;
}

form, fieldset, legend, input, button, textarea, select {
	font-size: 13px
}

ul, ol {
	list-style: none
}

table {
	border-collapse: collapse
}

input, textarea {
	display: inline-block;
	font-size: 13px;
	vertical-align: middle
}

textarea {
	resize: none
}

address, em {
	font-style: normal
}

th, td {
	padding: 0;
	vertical-align: top;
	text-align: left;
	font-weight: normal
}


#main_back_image_info {
	position: relative;
	width: 35%;
	left: 5%;
	top: 40%;
	color: white;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, .45);
	font-size: 3vmin;
	display: block;
}

#main_back_image_logo {
	margin-bottom: 0.5em;
}

#vid {
	position: absolute;
	left: 50%;
	top: 0;
	margin-left: -50%;
	width: 100%;
	height: auto;
	z-index: 1;
}
#slide_main_wrap{
	padding: 0 2%;
}
.bigrow{
margin: 3vw 0;
padding: 0;
float:left;
margin-right: 2%;
}
.bigrow #big_row_img{
height: auto;
width: 58vw;
z-index: 3;
padding-right: 1vw;
}
.bigrow_info{

top: 3.125vw;
left: 60.9375vw;
}

#bigrow_button :hover button{
background-color: grey;
}
#bigrow_button a{
font-size: 1.6rem;
font-weight: bold;
line-height: 2.4rem;
color: black;
text-decoration: none;
}

#bigrow_button button{
    font-size: 1.4vw;
    height: 3.5vw;
    width: 10vw;
    font-weight: 700;
    border-radius: 5px;
}
#bigrow_info_img{
	width: 28vw;
    height: auto;
    padding-bottom: 2vw;
}
#bigrow_text{
padding-top: 2vw;
font-size: 1.6vw;
}
#bigrow_button2{

}
#poster{
border-radius:10px;
}

</style>
</head>
<script type="text/javascript">
var id = "${sessionScope.id}";
var authority = "${sessionScope.authority}";
var payment = "${sessionScope.payment}";
if($.trim(id) == ""){
	alert('로그인 후 이용해주세요!');
	location.href='/login';
}else{
	if($.trim(payment) != 1){
		alert('결제 후 이용해주세요!');
		location.href='/mypage';
	}
}
if($.trim(authority) == "admin"){
	var flag = confirm('관리자님 환영합니다. 관리자 페이지로 이동하시겠습니까?');
	if(flag == true){
		location.href='/admin';
	}else{
		alert('메인 페이지로 이동합니다.');
	}
}
</script>
<body>
<!-- 랜덤값 발생 코드 -->
	<c:set var="ran"><%=java.lang.Math.round(java.lang.Math.random() * 2) + 1%></c:set>
	
	
	<header>
		<jsp:include page="../header/main_header.jsp"></jsp:include>
	</header>

	<div id="clear"></div>
	<!-- 헤더 부분 종료 -->



		<!-- 메인화면 맨위 div시작 -->
	
	
		<!-- 메인화면 랜덤 변환 1-->
	<c:if test="${ran eq 1}">

		<div class="keyvisual">
			<div class="keyvisual_inner">
				<div class="video_area">
					<div class="video_play">
						<!-- 메인페이지 백그라운드 
					동영상  -->
						<video
							src="${pageContext.request.contextPath}/resources2/images/위대한쇼맨.mp4"
							id="vid"></video>

					</div>
					
					

					<div class="key_icon">
						<div class="key_a">
							<img
								src="${pageContext.request.contextPath}/resources2/images/위대한쇼맨.png"
								alt="keytext_a">
						</div>
						<div class="key_b">뮤지컬의 감동을 Webflex에서</div>
						<div class="key_c">

							불가능한 꿈, 그 이상의 쇼!<br />
							쇼 비즈니스의 창시자이자, 꿈의 무대로 전세계를 매료<br />
							시킨 남자 ‘바넘’의 이야기로 탄생한 뮤지컬영화.
						</div>
						<div class="key_d">
							<a href="info?movieId=167"> VIEW MORE </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- 랜덤 메인화면 1 끝 -->
	
	<!-- 메인화면 랜덤 변환 2 -->
	<c:if test="${ran eq 2}">

		<div class="keyvisual">
			<div class="keyvisual_inner">
				<div class="video_area">
					<div class="video_play">
						<!-- 메인페이지 백그라운드 
					동영상  -->
						<video
							src="${pageContext.request.contextPath}/resources2/images/아이언맨.mp4"
							id="vid"></video>

					</div>
					<div class="scroll_arrow">
						<div class="arrow">
							<a href="#"> <!-- <span class="arrow_img">
	
								<img src="../resources2/images/scroll_arrow.png" alt="scroll_arrow">
							</span>
							<span class="arrow_img">
								<img src="../resources2/images/scroll_arrow.png" alt="scroll_arrow">
							</span> -->
							</a>
						</div>
					</div>
					

					<div class="key_icon">
						<div class="key_a">
							<img
								src="${pageContext.request.contextPath}/resources2/images/아이언맨.png"
								alt="keytext_a">
						</div>
						<div class="key_b">마블의 시작, 지금 시청하세요</div>
						<div class="key_c">

							세계적인 무기업체의 CEO. 출장차 방문한 아프가니스탄에서<br />
							게릴라 군에게 납치당한다. 하지만 천재적인 두뇌로 전투용 <br />
							슈트를 몰래 만든 그.슈퍼히어로의 탄생을 알리고 곧 악의 실체에 다가간다.
						</div>
						<div class="key_d">
							<a href="info?movieId=11"> VIEW MORE </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- 랜덤 메인화면 2 끝 -->
	
	<!-- 메인화면 랜덤 변환 3 -->
	<c:if test="${ran eq 3}">

		<div class="keyvisual">
			<div class="keyvisual_inner">
				<div class="video_area">
					<div class="video_play">
						<!-- 메인페이지 백그라운드 
					동영상  -->
						<video
							src="${pageContext.request.contextPath}/resources2/images/토르.mp4"
							id="vid"></video>

					</div>
					<div class="scroll_arrow">
						<div class="arrow">
							<a href="#"> <!-- <span class="arrow_img">
	
								<img src="../resources2/images/scroll_arrow.png" alt="scroll_arrow">
							</span>
							<span class="arrow_img">
								<img src="../resources2/images/scroll_arrow.png" alt="scroll_arrow">
							</span> -->
							</a>
						</div>
					</div>
					
					<div class="key_icon">
						<div class="key_a">
							<img
								src="${pageContext.request.contextPath}/resources2/images/토르.png"
								alt="keytext_a">
						</div>
						<div class="key_b">마블유니버스 최강의 히어로</div>
						<div class="key_c">

							천둥의신 토르가 추방당했다.인간세계에서 겸손을<br />
							배우게하려는 아버지의 뜻 모든 힘과 강력한 무기를 빼앗기고<br />
							순식간의 평범한 인간이 되어버린 토르 그의 앞날은 과연.
						</div>
						<div class="key_d">
							<a href="info?movieId=14"> VIEW MORE </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- 랜덤 메인화면 2 끝 -->
	
	
	<!-- 메인화면 맨위 div끝 -->


	<div id="clear"></div>
	<div id="slide_main_wrap">
	<!-- 슬라이드 시작 -->
		<div class="slide_start">
			<c:if test="${!empty category }">
			<jsp:include page="../slide/main_slide/content_userLike.jsp"></jsp:include>
			</c:if>
			<jsp:include page="../slide/main_slide/slide_action.jsp"></jsp:include>
			<jsp:include page="../slide/main_slide/slide_comedy.jsp"></jsp:include>
			<jsp:include page="../slide/main_slide/slide_drama.jsp"></jsp:include>
			<div class="bigrow_start">
				<div class="bigrow">
					<div id="bigrow_img_wrap">
						<img alt="row_img" id="big_row_img"
							src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/NYskjzLJzCNUfv50Bf8eKZdz4nA/AAAABQAflou1LyDqdc4UhrY4TFNwaUMoiv_B1XeGhHhGbS5cfQ20Eiqx1DF8hLVowsGTzCgKmK7ZC0N_L6rFGStA_V6p5wB2.webp?r=346">
					</div>
				</div>
				<div class="bigrow_info">
					<div class="bigrow_info_img_wrab">
						<img alt="row_info_img" id="bigrow_info_img" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/LmEnxtiAuzezXBjYXPuDgfZ4zZQ/AAAABZ4ZL1ukXLN28SqV8yezp6kVxjv9Jd0JPsd8uMNJi74hwuw36ILAk9JaXuky8pLBtzDo9Nt5QQ-PX2hKuZd9ZHoK6M6-cXgVL65U.webp?r=473">
					<div id="bigrow_button">
						<a href="http://localhost:8089/resources2/images/movie_trailer/%EB%B9%84%EB%B0%80%EC%9D%98%EC%88%B2.mp4" ><button><i class="fas fa-play"></i>&nbsp;&nbsp;재생</button></a>
												
						<a href="info?movieId=10" ><button><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;상세 정보</button></a>
						
					</div>
					<div id="bigrow_text">
						<span>
						감정을 느끼지 못하는 외톨이 검사 황시목이, 정의롭고 따뜻한 형사 한여진과 함께 검찰 스폰서 살인사건과 그 이면에 숨겨진 진실을 파헤치는 내부 비밀 추적극.
						</span>
					</div>
					</div>
				</div>
			</div>
			<jsp:include page="../slide/main_slide/slide_music.jsp"></jsp:include>
			<jsp:include page="../slide/main_slide/slide_animation.jsp"></jsp:include>
			<jsp:include page="../slide/main_slide/slide_fantasy.jsp"></jsp:include>
			<jsp:include page="../slide/main_slide/slide_romance.jsp"></jsp:include>
			<jsp:include page="../slide/main_slide/slide_SF.jsp"></jsp:include>
			<jsp:include page="../slide/main_slide/slide_thriller.jsp"></jsp:include>
			
			
			
		</div>
		<!-- 슬라이드 끝 -->
	</div>
	<div id="clear"></div>



	<!-- footer -->
	<jsp:include page="../footer/main_footer.jsp" />
</body>
<script type="text/javascript">
	$('document').ready(
			function() {

				var intro = document.getElementById("vid");
				var videoH;
				intro.muted = true;

				setTimeout(function() {

					$(".keyvisual .keyvisual_inner .video_area .key_icon")
							.addClass("active");
					videoH = $("#vid").height();
					$(".video_area").css({
						height : videoH
					});

					$(window).resize(function() {
						videoH = $("#vid").height();
						$(".video_area").css({
							height : videoH
						});
					});

					$("body,html").animate({
						scrollTop : 0
					}, 300, function() {
						intro.play();

						intro.addEventListener("ended", function() {
							intro.currentTime = 0;
							intro.play();
						});
					});
				}, 150);
			});
</script>
</html>