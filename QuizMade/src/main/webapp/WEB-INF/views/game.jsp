<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Refresh" content="10;URL=incorrect">
<title>ゲーム</title>
</head>
<link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="css/style.css"/>" rel="stylesheet">
<script src="<c:url value="js/jquery-2.2.4.min.js" />"></script>
<script src="<c:url value="js/bootstrap.bundle.min.js" />"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<body>
	<script type="text/javascript">
		$(function() {
			var randomContent = [];
			$('.contentBox li').each(function() {
				randomContent.push($(this).html());
			});

			randomContent.sort(function() {
				return Math.random() - Math.random();
			});
			$('.contentBox li').empty();

			i = 0;
			$('.contentBox li').each(function() {
				$(this).append(randomContent[i]);
				i++;
			});
		})
	</script>
	<script>
		function timer() {
			var setTime = 10;
			var second = 0;
			$('.circle').addClass('pie');
			$('.circle').css({
				'animation' : 'pie ' + setTime * 2 + 's linear'
			})
			var timerId = setInterval(function() {
				second += 1;
				if (second >= setTime) {
					clearInterval(timerId);
				}
				countTime = setTime - second;
				$('.minute').text(countTime % 3600 / 60 | 0);
				$('.second').text(countTime % 60);
			}, 1000);
		}
		timer();
	</script>
	<div class="container" align="center">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="panel panel-primary">
						<div class="panel-heading">問題</div>
						<c:forEach items="${randomQuestion}" var="quiz">

							<div class="panel-body">
								<c:out value="${quiz.question}" />
							</div>

						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="balloon5">
		<div class="faceicon">
			<img src="images/セクシーはてな.png" alt="hatena">
		</div>
		<div class="chatting">
			<div class="says">
				<div class="progressBarInfo">
					<span class="minute"></span><span class="second"></span>
				</div>
			</div>
		</div>
	</div>
	<form method="post" action="">
		<c:forEach items="${randomQuestion}" var="quiz">
			<ol class="contentBox">
				<div class="container">
					<div class="row">
						<div class="col-md-offset-2 col-md-8">

							<li type="A"><div class="box">
									<input type="submit" name="answer"
										class="btn-lg btn-block btn-danger"
										value="<c:out value="${quiz.answer}" />" />
								</div></li><br>
							<li type="A"><div class="box">
									<input type="submit" name="choices1"
										class="btn-lg btn-block btn-danger"
										value="<c:out value="${quiz.choices1}" />" />
								</div></li><br>
							<li type="A"><div class="box">
									<input type="submit" name="choices2"
										class="btn-lg btn-block btn-danger"
										value="<c:out value="${quiz.choices2}" />" />
								</div></li><br>
							<li type="A"><div class="box">
									<input type="submit" name="choices3"
										class="btn-lg btn-block btn-danger"
										value="<c:out value="${quiz.choices3}" />" />
								</div></li>
						</div>
					</div>
				</div>
			</ol>
		</c:forEach>
	</form>
</body>
</html>