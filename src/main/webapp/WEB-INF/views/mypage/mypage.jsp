<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX MY PAGE::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/mypage.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style type="text/css">
.my_hr{
	width: 100%;
}
.mypage{
	margin-bottom: 150px;
	margin-top: 150px;
}
</style>
</head>
<body>
<script type="text/javascript">
	var id = "${sessionScope.id}";
	var msg = "${msg}";
	if($.trim(id) == ""){
		alert('로그인 후 이용해 주세요!');
		location.href='/login';
	} 
	if($.trim(msg) == "password_edit"){
		alert("비밀번호가 변경되었습니다!");
		history.replaceState({}, null, location.pathname);
	}
	if($.trim(msg) == "category"){
		alert("카테고리가 반영되었습니다!");
		history.replaceState({}, null, location.pathname);
	}
</script>
	<jsp:include page="../header/subpage_header.jsp"></jsp:include>
	<%--main--%>
	<div class="mypage">
		<h1>내 계정</h1>
		<br>
		<hr class="my_hr">
		<%--div 박스 영역 --%>
		<div class="main">
		<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
			<%--첫번째 영역 --%>
			<section id="first">
				<div id="first-left">
					<c:if test="${user.payment eq 0}">
					<p>멤버십 & 결제 정보</p>
						<button id="delete_btn">
							<a href="/payment" id="button">이용권 구입</a>
						</button>
					</c:if>
					<c:if test="${user.payment eq 1 }">
					<c:if test="${sessionScope.authority == 'admin' }">
					<h3>관리자 계정입니다.</h3>
					</c:if>
					<c:if test="${sessionScope.authority != 'admin' }">
					<h3>이용기간</h3><br>
					<p>결제일 : <fmt:formatDate value="${user.paydate }" pattern="yyyy년 MM월 dd일"/> </p>
					<p>종료일 : <fmt:formatDate value="${paydate }" pattern="yyyy년 MM월 dd일"/> </p>
					<fmt:parseNumber value="${now.time / (1000*60*60*24) }" integerOnly="true" var="payday" scope="request"></fmt:parseNumber>
					<fmt:parseNumber value="${paydate.time / (1000*60*60*24) }" integerOnly="true" var="endday" scope="request"></fmt:parseNumber>
					<p>남은기간 : ${endday - payday }</p>
					</c:if>
					</c:if>
				</div>
				<%--first-left --%>

				<div id="first-center">
					<div id="mem">
						<div id="email">
							<p>이메일 주소 : ${user.email }</p>
							<br>
						</div>
						<div id="pwd">
							<p>
								비밀번호: ******** <a href="/password_edit" id="change_pwd"> 비밀 번호 변경 </a>
							</p>
							<br>
						</div>
						<div id="phone">
							<p>
								닉네임: ${user.nick } <a href="/nick_change" id="change_phone"> 닉네임 변경
								</a>
							</p>
						</div>
					</div>
					<%--mem --%>
					<hr class="my_hr">
					<div id="account">
						<div id="credit">
							<p>
								<br> 결제 상세 정보
							</p>
							<hr class="my_hr">
							<c:if test="${user.payment eq 1}">
								<p>
									결제여부: ${user.mop }
								</p>
						</div>
					</div>
					<%--account --%>
				</div>

			</section>

			<hr class="my_hr">

			<%--두번째 영역 --%>
			<section id="second">
				<div id="second-left">
					<p>멤버십 상세 정보</p>
				</div>
				<%--second-left --%>

				<div id="second-center">
					<p>
						${pass.pass_name } <a id="money"> ${pass.pass_price }</a>
					</p>
					<br>
				</div>
				</c:if>
				<c:if test="${user.payment eq 0 }">
					<b>결제가 완료되지 않았습니다.</b>
				</c:if>


				<%--second-center --%>
			</section>
			<hr class="my_hr">
			<%--세번째 영역 --%>
			<section id="third">
				<div id="third-left">
					<p>컨텐츠 정보</p>
				</div>
				<div id="third-center">
					<p>
					<c:if test="${!empty user.category }">
						관심 컨텐츠 <a href="/category_add" id="change_ctn_click"> 컨텐츠 수정하기 </a>
					</c:if>
					<c:if test="${empty user.category }">
						관심 컨텐츠 <a href="/category_add" id="change_ctn_click"> 컨텐츠 추가하기 </a>
					</c:if>
					</p>
					<hr class="my_hr">
					<div id="list">
						<p>
						<c:if test="${!empty user.category }">
							<c:forTokens items="${user.category }" delims="," var="category">
								<a href="/searchView?search=${category }" id="change_ctn">#${category }</a>					
							</c:forTokens>
							<a style="color : #0073E6; float:right;" href="/category_del">카테고리 삭제</a>
						</c:if>
						<c:if test="${empty user.category }">
							관심있는 카테고리가 존재하지 않습니다.
						</c:if>
						</p>
					</div>
				</div>
				<%--third-center --%>
				<br>
			</section>
			<hr class="my_hr">
			<%--네번째 영역 --%>
			<section id="fourth">
				<div id="fourth-center">
					<button>
						<a href="/logout" id="button">로그아웃</a>
					</button>
					<button>
						<a href="/help_notice" id="button">공지 사항</a>
					</button>
					
					<button>
						<a href="/sign_out" id="button">회원탈퇴</a>
					</button>
					
				</div>
			</section>

		</div>
		<%--main --%>
	</div>
	<jsp:include page="../footer/footer.jsp"></jsp:include>
</body>
</html>