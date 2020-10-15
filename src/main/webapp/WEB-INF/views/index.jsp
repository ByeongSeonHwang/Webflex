<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>WEBFLEX</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="./resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="./resources/assets/css/noscript.css" /></noscript>
		<link rel="stylesheet" type="text/css" href="./resources/bootstrap/css/bootstrap.min.css" />
    	<link rel="stylesheet" type="text/css" href="./resources/font-awesome/css/font-awesome.min.css" />
    	<script type="text/javascript" src="./resources/bootstrap/js/bootstrap.min.js"></script>
    	<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
	</head>
	<script type="text/javascript">
	$('document').ready(function() {
	
		var id = "${sessionScope.id}";
		if($.trim(id) != ""){
			alert("로그인 되어 있습니다.");
			location.href="/main";
		}		
	});
</script>
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<div class="content">
					<h1>WEBFLEX</h1>
					<p>다양한 컨텐츠를 시청하세요.<br />
					 언제든 해지하실 수 있습니다. <a href="login">지금 로그인</a></p>
					<ul class="actions">
						<li><a href="/ex_join" class="button">지금 시작하기</a></li>
						<li><a href="#one" class="button icon solid fa-chevron-down scrolly">더 보기</a></li>
					</ul>
				</div>
				<div class="image phone"><div class="inner"><img src="./resources2/images/Pscreen.jpg" alt="mobileUI" /></div></div>
			</header>
			<div id="line"></div>
		<!-- One -->
			<section id="one" class="wrapper style2 special">
				<header class="major">
					<h1>여럿이 함께, 하나의 이용권으로</h1>
					<h2>동시 4개 기기에서 재생이 가능한 프리미엄 이용권을 이용해보세요.</h2>
				</header>
				<ul class="icons major">
					<li><span class="icon solid fa-camera-retro"><span class="label">Shoot</span></span></li>
					<li><span class="icon solid fa-sync"><span class="label">Process</span></span></li>
					<li><span class="icon solid fa-cloud"><span class="label">Upload</span></span></li>
				</ul>
			</section>
			<div id="line"></div>
		<!-- Two -->
			<section id="two" class="wrapper">
				<div class="inner alt">
					<section class="spotlight">
						<div class="image"><img src="./resources2/images/p1.jpg" alt="기묘한이야기" /></div>
						<div class="content">
							<h3><b>TV로 즐기세요.</b></h3>
							<p>스마트 TV, PlayStation, Xbox, Chromecast, Apple TV, 블루레이 플레이어 등 다양한 디바이스에서 시청하세요.</p>
						</div>
					</section>
					<section class="spotlight">
						<div class="image"><img src="./resources2/images/p2.jpg" alt="킹덤" /></div>
						<div class="content">
							<h3><b>간편하게 저장하고 빈틈없이 즐겨보세요.</b></h3>
							<p>즐겨 보는 콘텐츠를 저장해 오프라인으로 시청하세요.</p>
						</div>
					</section>
					<section class="spotlight">
						<div class="image"><img src="./resources2/images/p3.jpg" alt="위쳐" /></div>
						<div class="content">
							<h3><b>다양한 디바이스에서 시청하세요.</b></h3>
							<p>각종 영화와 TV 프로그램을 스마트폰, 태블릿, 노트북, TV에서 무제한으로 스트리밍하세요. 추가 요금이 전혀 없습니다.</p>
						</div>
					</section>
					<section class="special">
						<ul class="icons labeled">
							<li><span class="icon solid fa-sync"><span class="label">매일매일 올라오는 새로운 컨텐츠</span></span></li>
							<li><span class="icon solid fa-cloud"><span class="label">최대 4명이서 동시 접속할 수 있는 공유시스템</span></span></li>
							<li><span class="icon solid fa-desktop"><span class="label">다양한 기기에서 접속할 수 있는 호환성</span></span></li>
						</ul>
					</section>
				</div>
			</section>
			<div id="line"></div>
		
		<!-- Three -->
			<section id="three" class="wrapper style3 special">
				<header class="major">
					<h2><b>자주 묻는 질문</b></h2>
					<br>
					<div class="container">
					    <div class="panel-group" id="accordion">
					        <div class="panel panel-default">
					            <div class="panel-heading">
					                <h4 class="panel-title">
					                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><b>웹플렉스란 무엇인가요?</b></a>
					                </h4>
					            </div>
					            <div id="collapseTwo" class="panel-collapse collapse">
					                <div class="panel-body">
					                	<b>웹플렉스는 각종 수상 경력에 빛나는 TV 프로그램, 영화,<br>
					                	애니메이션, 다큐멘터리 등 다양한 콘텐츠를 인터넷 연결이 가능한<br>
					                	수천 종의 디바이스에서 시청할 수 있는 스트리밍 서비스입니다.<br><br>
										저렴한 월 요금으로 일체의 광고 없이 원하는 시간에 원하는 만큼<br>
										즐길 수 있습니다. 무궁무진한 콘텐츠가 준비되어 있으며 매주<br>
										새로운 TV 프로그램과 영화가 제공됩니다.</b>
					                </div>
					            </div>
					        </div>
					        <div class="panel panel-default">
					            <div class="panel-heading">
					                <h4 class="panel-title">
					                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><b>웹플렉스 요금은 얼마인가요?</b></a>
					                </h4>
					            </div>
					            <div id="collapseThree" class="panel-collapse collapse">
					                <div class="panel-body">
					                	<b>스마트폰, 태블릿, 스마트 TV, 노트북, 스트리밍 디바이스 등<br>
					                	다양한 디바이스에서 월정액 요금 하나로 웹플렉스를 시청하세요.<br>
					                	멤버십 요금은 월 9,500원부터 14,500원까지 다양합니다. 추가<br>
					                	비용이나 약정이 없습니다.</b>
					                </div>
					            </div>
					        </div>
					        <div class="panel panel-default">
					            <div class="panel-heading">
					                <h4 class="panel-title">
					                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive"><b>어디에서 시청할 수 있나요?</b></a>
					                </h4>
					            </div>
					            <div id="collapseFive" class="panel-collapse collapse">
					                <div class="panel-body">
					                   	<b>다양한 디바이스에서 언제 어디서나 시청할 수 있습니다. 넷플릭스<br>
					                   	계정으로 로그인하면 PC에서 webflex.com을 통해 바로 시청할 수<br>
					                   	있으며, 인터넷이 연결되어 있고 웹플렉스 앱을 지원하는 디바이스<br>
					                   	(스마트 TV, 스마트폰, 태블릿, 스트리밍 미디어 플레이어, 게임<br>
					                   	콘솔 등)에서도 언제든지 시청할 수 있습니다.<br><br>
										iOS, Android, Windows 10용 앱에서는 좋아하는 프로그램을<br>
										저장할 수도 있습니다. 저장 기능을 이용해 이동 중이나 인터넷에<br>
										연결할 수 없는 곳에서도 시청하세요. 넷플릭스는 어디서든<br>
										함께니까요.</b>
					                </div>
					            </div>
					        </div>
					        <div class="panel panel-default">
					            <div class="panel-heading">
					                <h4 class="panel-title">
					                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix"><b>멤버십을 해지하려면 어떻게 하나요?</b></a>
					                </h4>
					            </div>
					            <div id="collapseSix" class="panel-collapse collapse">
					                <div class="panel-body">
					                    	<b>웹플렉스는 부담 없이 간편합니다. 성가신 계약도, 약정도<br>
					                    	없으니까요. 멤버십 해지도 온라인에서 클릭 두 번이면 완료할 수<br>
					                    	있습니다. 해지 수수료도 없으니 원할 때 언제든 계정을<br>
					                    	시작하거나 종료하세요.</b>
					                </div>
					            </div>
					        </div>
					        <div class="panel panel-default">
					            <div class="panel-heading">
					                <h4 class="panel-title">
					                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight"><b>웹플렉스에서 어떤 콘텐츠를 시청할 수 있나요?</b></a>
					                </h4>
					            </div>
					            <div id="collapseEight" class="panel-collapse collapse">
					                <div class="panel-body">
					                    	<b>웹플렉스는 장편 영화, 다큐멘터리, TV 프로그램, 애니메이션,<br>
					                    	각종 상을 수상한 넷플릭스 오리지널 등 수많은 콘텐츠를 확보하고<br>
					                    	있습니다. 마음에 드는 콘텐츠를 원하는 시간에 원하는 만큼<br>
					                    	시청하세요. 30일 무료 이용으로 넷플릭스의 무한한 콘텐츠<br>
					                    	세상을 만나보세요.</b>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					
					<style>
					    .faqHeader {
					        font-size: 27px;
					        margin: 20px;
					    }
					
					    .panel-heading [data-toggle="collapse"]:after {
					        font-family: 'Glyphicons Halflings';
					        content: "\e072"; /* "play" icon */
					        float: right;
					        color: #fff;
					        font-size: 18px;
					        line-height: 22px;
					        /* rotate "play" icon from > (right arrow) to down arrow */
					        -webkit-transform: rotate(-90deg);
					        -moz-transform: rotate(-90deg);
					        -ms-transform: rotate(-90deg);
					        -o-transform: rotate(-90deg);
					        transform: rotate(-90deg);
					    }
					
					    .panel-heading [data-toggle="collapse"].collapsed:after {
					        /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
					        -webkit-transform: rotate(90deg);
					        -moz-transform: rotate(90deg);
					        -ms-transform: rotate(90deg);
					        -o-transform: rotate(90deg);
					        transform: rotate(90deg);
					        color: #fff;
					    }
					</style>
					
					<!-- Bootstrap FAQ - END -->
					
				</header>
				
				<ul class="actions special">
					<li><a href="/board_list" class="button">게시판으로 이동</a></li>
					<li><a href="#" class="button">위로 이동</a></li>
				</ul>
			</section>

			<div id="line"></div>
			
		<!-- Footer -->
			<footer id="footer">
				<ul class="icons">
					<li><a href="https://ko-kr.facebook.com/NetflixKR/" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
					<li><a href="https://twitter.com/NetflixKR?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="https://www.instagram.com/netflixkr/?hl=ko" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				</ul>
				<div class="footerbox">
				<p class="copyright">&copy; 웹플렉스서비시스코리아 유한회사 통신판매업신고번호: 제xxxx-서울종로-xxxx호 전화번호:<br>
					대표: 이용준<br>
					이메일 주소: korea@webflex.com<br>
					주소: 서울 동작구 장승배기로 171 2층, 3층<br>
					클라우드 호스팅: Amazon Web Services Inc.: <a href="http://html5up.net">HTML5 UP</a></p>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="./resources/assets/js/jquery.min.js"></script>
			<script src="./resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="./resources/assets/js/browser.min.js"></script>
			<script src="./resources/assets/js/breakpoints.min.js"></script>
			<script src="./resources/assets/js/util.js"></script>
			<script src="./resources/assets/js/main.js"></script>
	</body>
</html>