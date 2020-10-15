<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX FAQ::</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/help.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
</head>

<body>
<script type="text/javascript">
	var id = "${sessionScope.id}";
	if($.trim(id) == ""){
		alert('로그인 후 이용해주세요!');
		location.href='/login';
	}
</script>
<header>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>
</header>
<!-- Notice -->
<div id="sub">

<div class="title" style="margin-bottom:0px;">FAQ</div>

<div class="sub_tab" width="1060px;" style="overflow:hidden; margin:0 auto; text-align:center;">
	<div class="sub_tab_menu"><a href="/help_notice">공지사항</a></div>
	<div class="sub_tab_menu"><a href="/board_list">자유게시판</a></div>
	<div class="sub_tab_menu on"><a href="/help_FAQ">FAQ</a></div>
	<div class="sub_tab_menu"><a href="/help_news">WEBFELX NEWS</a></div>
</div>
 <img style="width:100%;" src="../resources/images/FAQ.jpg">
<div id="sub" style="width:1060px; padding:50px 0; margin:0 auto;">
<!-- Notice END -->

<div class="faq">
	<button class="q on">
	<i class="num">01</i> 웹플렉스란?</button>
	<p class="a on">
	웹플렉스는 각종 수상 경력에 빛나는 TV 프로그램, 영화, 애니메이션, 다큐멘터리 등 <br>
	다양한 콘텐츠를 인터넷 연결이 가능한 수천 종의 디바이스에서 시청할 수 있는 스트리밍 서비스입니다.<br>
	<br>
	저렴한 월 요금으로 일체의 광고 없이 원하는 시간에 원하는 만큼 즐길 수 있습니다.<br>
	무궁무진한 콘텐츠가 준비되어 있으며 매주 새로운 TV 프로그램과 영화가 제공됩니다.<br>
	</p>
	
	<button class="q">
	<i class="num">02</i> 웹플렉스 요금은 얼마인가요 ?</button>
	<p class="a">
	스마트폰, 태블릿, 스마트 TV, 노트북, 스트리밍 디바이스 등 다양한 디바이스에서 월정액 요금 하나로 웹플렉스를 시청하세요.<br>
	단돈 멤버십 요금 월 9,900원으로<br>
	추가 비용이나 약정이 없습니다.<br>
	</p>
	
	<button class="q">
	<i class="num">03</i> 어디에서 시청할 수 있나요?</button>
	<p class="a">
	다양한 디바이스에서 언제 어디서나 시청할 수 있습니다.<br>
	웹플렉스계정으로 로그인하면 PC에서 webflex.com을 통해 바로 시청할 수 있으며,<br>
	인터넷이 연결되어 있고 웹플렉스 앱을 지원하는 디바이스(스마트 TV, 스마트폰, 태블릿, 스트리밍 미디어 플레이어, 게임콘솔 등)<br>
	언제든지 시청할 수 있습니다.<br>
	<br>
	iOS, Android, Windows 10용 앱에서는 좋아하는 프로그램을 저장할 수도 있습니다.<br>
	저장 기능을 이용해 이동 중이나 인터넷에 연결할 수 없는 곳에서도 시청하세요.<br>
	웹플렉스는 어디서든 함께니까요.<br>
	</p>
	
	<button class="q">
	<i class="num">04</i> 멤버십을 해지하려면 어떻게 하나요?</button> 
	<p class="a">
	웹플렉스는 부담 없이 간편합니다.<br>
	성가신 계약도, 약정도 없으니까요.<br> 
	멤버십 해지도 온라인에서 클릭 두 번이면 완료할 수 있습니다.<br>
	해지 수수료도 없으니 원할 때 언제든 계정을 시작하거나 종료하세요. <br>
	</p>
	
	<button class="q">
	<i class="num">05</i> 웹플렉스에서 어떤 콘텐츠를 시청할 수 있나요?</button>
	<p class="a">
	웹플렉스는 장편 영화, 다큐멘터리, TV 프로그램, 애니메이션,<br>
	각종 상을 수상한 넷플릭스 오리지널 등 수많은 콘텐츠를 확보하고 있습니다.<br> 
	마음에 드는 콘텐츠를 원하는 시간에 원하는 만큼 시청하세요.<br> 
	30일 무료 이용으로 넷플릭스의 무한한 콘텐츠 세상을 만나보세요.<br>
	</p>

</div>

</body>
<script>
//FAQ 메뉴
$("button.q").click(function(){
	if( !$(this).hasClass("on") )
	{
		$(this).siblings(".q").removeClass("on");
		$(this).siblings(".a").slideUp();
		$(this).addClass("on");
		$(this).next().slideToggle();
	}
});

</script>
</html>