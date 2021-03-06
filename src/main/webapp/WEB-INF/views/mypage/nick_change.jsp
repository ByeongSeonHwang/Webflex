<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::닉네임 변경::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/nickname_edit.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css"/>
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
#nick_check, #pw_check{
	float: right;
}
</style>
</head>
<body>
<script type="text/javascript">
$('document').ready(function() {
	var id = "${sessionScope.id}";
	var msg = "${msg}";
	if($.trim(id) == ""){
		alert('로그인 후 이용해 주세요!');
		location.href='/login';
	} 
});
</script>
<script type="text/javascript">
$('#nick_check').hide();
function nick_check() {
	var nick = $.trim($('#nick').val());
	var regExp = /^.{2,15}$/;
	if(nick == ""){
		var text = "<font color='red' size='2'>변경하실 닉네임을 입력해주세요.</font>";
		$('#nick_check').text('');
		$('#nick_check').show();
		$('#nick_check').append(text);
		$('#nick').val('').focus();
	}else{
		$.ajax({
			url : "/nick_check",
			type : "post",
			data : {
				nick : nick
			},
			success: function(data) {
				if($.trim(data) == 1){
					var text = "<font color='red' size='2'>중복되는 닉네임 입니다.</font>";
					$('#nick_check').text('');
					$('#nick_check').show();
					$('#nick_check').append(text);
					$('#nick').val().focus();
				}else{
					var text = "<font color='green' size='2'>사용할 수 있는 닉네임</font>";
					$('#nick_check').text('');
					$('#nick_check').show();
					$('#nick_check').append(text);
				}
			}
		});
	}
}

</script>
<header>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>
</header>
   <div class="p1">
      <div class="p1_1">
           <div class="p1_2">
         <div class="pwd">
               <h1>닉네임 변경</h1>
               <br>
               <br>
               

               <div class="pwd1">
                  <label for="id_currentPassword" class="Label"></label>
                  <input type="text" value="${nick }" class="pw1" placeholder="현재 닉네임" readonly="readonly">
               </div>
               <br>
               <br>
               

               <div class="pwd1">
                  <label for="id_currentPassword" class="Label"></label>
                  <input type="text" value="" class="pw1" placeholder="새로운 닉네임 입력" id="nick" >
                  <br>
                  <button id="nick_btn" onclick="nick_check();">닉네임 중복검사</button>
                  <span id="nick_check"></span>
               </div>
               <br>
               <br>
               
               
               <div class="pwd1">
                  <label for="id_currentPassword" class="Label"></label>
                     <input type="password" class="pw1" placeholder="비밀번호를 입력하세요" id="pw"><br>
               </div>
               <br>
                  <a class="pp" href="/email_find">비밀번호를 잊으셨나요?<br><br><br></a>
         </div>

         <div class="btn">
            <div id="sb1">
               <button type="button" onclick="nick_change();">변경</button>
            </div>
            <div id="sb2">
               <button type="submit">취소</button>
            </div>
         </div>
      </div>
     </div>
   </div>
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
<script type="text/javascript">
$('#nick').on("keyup", function() {
	var nick = $.trim($('#nick').val());
	var regExp = /^.{2,15}$/;
	if(nick.match(regExp) == null){
		var text = "<font color='red' size='2'>닉네임은 2~15자 이내로 입력해주세요</font>";
		$('#nick_check').text('');
		$('#nick_check').show();
		$('#nick_check').append(text);
	}else{
		$('#nick_check').hide();
	}
});

function nick_change() {
	var nick = $.trim($('#nick').val());
	var password = $.trim($('#pw').val());
	if(nick == ""){
		var text = "<font color='red' size='2'>변경하실 닉네임을 입력해주세요.</font>";
		$('#nick_check').text('');
		$('#nick_check').show();
		$('#nick_check').append(text);
		$('#nick').val('').focus();
		return false;
	}
	if(password == ""){
		alert('비밀번호를 입력하세요!');
		$('#pw').val('').focus();
		return false;
	}else{
		$.ajax({
			url : "/nick_change_ok",
			type: "post",
			data: {
				nick : nick,
				password : password
			},
			success: function(data) {
				if($.trim(data) == "OK"){
					alert('닉네임이 변경되었습니다.');
					location.href="/mypage";
				}else if($.trim(data) == "FAIL"){
					alert('비밀번호가 틀립니다!');
					$('#pw').val('').focus();
				} else{
					alert('중복된 닉네임 입니다!');
					$('#nick').val('').focus();
				}
			}
		});
	}
}

</script>
</body>
</html>









