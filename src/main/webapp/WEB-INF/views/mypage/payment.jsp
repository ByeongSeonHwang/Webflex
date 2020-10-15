<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::이용권 결제::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/delete1.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/delete2.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css"/>
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
#mem_info{
   font-weight : bolder;
   font-size : 18px;
   width : auto;
   height : auto;
   margin : 10% 25%;
   padding : 2% 5%;
   background-color: white;
   box-sizing: border-box;
   border: 1px solid black;
   text-decoration: bold;
   margin-top: 260px;
   margin-bottom: 240px;
}
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
   position: relative;
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
<script type="text/javascript">
	var id = "${sessionScope.id}";
	var payment = "${sessionScope.payment}"
	if($.trim(id) == ""){
		alert('로그인 후 이용해 주세요!');
		location.href='/login';
	} 
	if(payment == 1){
		alert('이미 결제되었습니다!');
		location.href='/main';
	}
</script>
<!-- header -->

<jsp:include page="../header/subpage_header.jsp"></jsp:include>
<!-- main -->
   <div id="mem_info">
   <br>
   <h2> 멤버십 이용권 결제 </h2>
   <br>
   <form action="/payment_check" method="post">
         <h4>웹플렉스의 멤버십을 선택하고 결제를 하세요
         <br> 스탠다드 & 프리미엄 </h4>
         <hr>
         <div id="chk">    
       	 <c:forEach var="p" items="${pass}">
            <br><input type="radio" id="checkbox" value="${p.pass_no }" name="pass_no"/> ${p.pass_name }: &nbsp; ${p.pass_price }원 
         </c:forEach>
         </div>
            <br> 감사합니다.
            <br><button id="submit">완료</button> 
         </div>
	</form>
         
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