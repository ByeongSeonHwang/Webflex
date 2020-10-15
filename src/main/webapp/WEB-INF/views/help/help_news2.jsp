<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX NEWS-2::</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/help.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<style type="text/css">
.w_btn .btn {
  transition : all 0.5s ease-out;
}
.w_btn .btn:hover{
	background: black;
	color: white;
	transition : all 0.5s ease-out;
}
</style>
</head>
<body>
<header>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../resources/css/subpage_header.css" />
</header>  
<!-- Notice -->

<div id="sub" style="width:1060px; padding:50px 0; margin:0 auto;">

<!-- News Start -->
<div id="sub">

	<table class="boardview_head">
		<tbody><tr>
            <th>WEBFLEX, 프레임워크 기반 자바 웹개발자 양성 프로젝트 기획</th>
            <td style="text-align:right;"><span class="name">by 이동열</span> <span class="line">|</span> <span class="name">Date</span> <span class="date">2020-06-10</span></td>
        </tr>
        <tr>
            <td height="10" colspan="2"></td>
        </tr>
    </tbody></table>

    <table class="boardview_text">
        <tbody><tr>
            <td>
            
            <br>
            2020-06-10<br>
            4조<br>
           	팀명 : WEBFLEX<br>
           	팀장 : 이용준 <br>
           	팀원 : 신나은 오진석 이동열 황병선<br>
           	<br>
           	
                <div style="margin-bottom:20px">
				 <video style="width: 100%; height: 50%;"
				 src="../resources2/images/Intro.mp4"
                     id="vid" autoplay="autoplay" controls="controls"></video>
            <br>
           	 <p style="font-size: 14px;">다양한 영화와 드라마 및 애니메이션을 감상할 수 있는 OTT서비스<br>
			<b style="color:red;">WATCHA PLAY</b>와 <b style="color:red;">NETFLEX</b>를 벤치마킹하여 프로젝트 제작<br></p>
			<br>
				</div>
            </td>
        </tr>

        <tr>
            <td height="20"></td>
        </tr>
    </tbody>
    </table>

	<div style="width:1060px; margin:0 auto;">
		<div class="w_btn">
			<a href="${pageContext.request.contextPath}/help_news ">
				<div class="btn">목록</div>
			</a>
		</div>
	</div>
	  

	
</div>


</div>

<!-- Notice END -->

</body>
</html>