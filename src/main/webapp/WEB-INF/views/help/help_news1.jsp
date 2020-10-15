<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX NEWS-1::</title>
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
            <th>(주)KG에듀원 아이디뱅크 노량진학원, 개발자 양성 진행</th>
            <td style="text-align:right;"><span class="name">by 이동열</span> <span class="line">|</span> <span class="name">Date</span> <span class="date">2020-04-21</span></td>
        </tr>
        <tr>
            <td height="10" colspan="2"></td>
        </tr>
    </tbody></table>

    <table class="boardview_text">
        <tbody><tr>
            <td>
                <div style="margin-bottom:20px">
				 훈련과정 : 프레임워크 기반 자바 웹 개발자 양성<br>
				 훈련기간 : 2020-04-21 ~ 2020-10-14<br>
				 <img src="../resources2/images/개발자양성.JPG">
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