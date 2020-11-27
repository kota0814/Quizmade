<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8" />
<title>クイズ作成</title>
</head>
<body>

	<p>保存しました。</p>
	<p>
		<a href="<spring:url value="/listQuiz" />">戻る</a>
	</p>
</body>
</html>