<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX 공지사항 내용::</title>
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
</header>  
<!-- Notice -->

<div id="sub" style="width:1060px; padding:50px 0; margin:0 auto;">

<!-- News Start -->
<div id="sub">

	<table class="boardview_head">
		<tbody><tr>
            <th>${notice.notice_title }</th>
            <td style="text-align:right;"><span class="name">by ${notice.notice_writer }</span> <span class="line">|</span> <span class="name">Date</span> <span class="date">${notice.notice_date }</span></td>
        </tr>
        <tr>
            <td height="10" colspan="2"></td>
        </tr>
    </tbody></table>

    <table class="boardview_text">
        <tbody><tr>
            <td>
                <div style="margin-bottom:20px; font-size: 15px;">
				${notice.notice_cont }
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
			<a href="./help_notice?page=${param.page} ">
				<div class="btn">목록</div>
			</a>
		</div>
	</div>
	  

	
</div>


</div>

<!-- Notice END -->

</body>
</html>