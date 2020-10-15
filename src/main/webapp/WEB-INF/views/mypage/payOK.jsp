<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::결제완료::</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/payOK.css" />
<link rel="stylesheet" href="../resources/assets/css/index_timeline.css"/>
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
</head>
<body>
<section id="banner">
	<div class="inner" style="margin-top: -100px;">
		<header>
			<h1>결제가 정상적으로 완료되었습니다 </h1>
				<p>결제 내용<br>
				<div style="margin-left: auto; margin-right: auto; text-align: left; width: 100%; font-size: 25px; color: #fff; padding-left: 25%;" >
				결제일시:  [<fmt:formatDate value="${info.approved_at}" pattern="yyyy.MM.dd"/>]<br>
				결제하신 상품명: [${info.item_name}]<br>
				결제금액: [${info.amount.total}]<br>
				결제방법: [${info.payment_method_type}]<br>
				</div>
				</p>
		</header>
		<br>
		<a href="/main" class="button big scrolly">메인으로가기</a>
	</div>
</section>
</body>
</html>