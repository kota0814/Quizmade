<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<meta charset="utf-8">
<title>メニュー</title>
</head>
<link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="css/style.css"/>" rel="stylesheet">
<script src="<c:url value="js/jquery-2.2.4.min.js" />"></script>
<script src="<c:url value="js/bootstrap.bundle.min.js" />"></script>

<body>

	<p class="top">
		<img src="images/清楚系メイドご案内反転.png" alt="ご案内" width=200 height=250>Welcome
		to<img src="images/セクシーご案内.png" alt="ご案内" width=200 height=250>
	</p>
	<script type="text/javascript">

		// 自ウインドウを警告（確認ダイアログ）なしで閉じる
		function winClose() {
			open(location, '_self').close();
		}
	</script>

	<div class="menuContainer">
		<div class="menu">
			<a href="listQuiz"><input type="submit" class="button"
				value="クイズリスト" /> </a>
		</div>

		<div class="menu">
			<a href="addQuiz"><input type="submit" class="button"
				value="クイズ作成" /> </a>
		</div>
		<div class="menu">
			<a href="game"><input type="submit" class="button"
				value="ゲームスタート" /> </a>
		</div>
		<div class="menu">
			<input type="submit" class="button" value="ゲーム終了"
				onclick="winClose()" />
		</div>
	</div>
	<p class="bottom">
		<img src="images/アキバ系メイドご案内反転.png" alt="ご案内" width=200 height=250>♡QuizMade♡<img
			src="images/クラシカルメイドご案内.png" alt="ご案内" width=200 height=250>
	</p>

</body>


</html>