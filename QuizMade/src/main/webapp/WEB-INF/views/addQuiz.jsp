<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>クイズの作成</title>
</head>
<link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="css/style.css"/>" rel="stylesheet">
<script src="<c:url value="js/jquery-2.2.4.min.js" />"></script>
<script src="<c:url value="js/bootstrap.bundle.min.js" />"></script>
<body>
	<form:form modelAttribute="quiz">
		<table>
			<tr>
				<th align="center" bgcolor="yellow">問題</th>
				<td>
					<p>
						<form:errors path="question" />
					</p> <form:textarea class="form-control"
						id="exampleFormControlTextarea1" rows="6" path="question" />
				</td>
			</tr>
			<tr>
				<th align="center" bgcolor="red"><font color="yellow">解答</font></th>
				<td>
					<p>
						<form:errors path="answer" />
					</p> <form:input path="answer" />
				</td>
			</tr>
			<tr>
				<th align="center" bgcolor="orange">選択肢１</th>
				<td>
					<p>
						<form:errors path="choices1" />
					</p> <form:input path="choices1" />
				</td>
			</tr>
			<tr>
				<th align="center" bgcolor="orange">選択肢２</th>
				<td>
					<p>
						<form:errors path="choices2" />
					</p> <form:input path="choices2" />
				</td>
			</tr>
			<tr>
				<th align="center" bgcolor="orange">選択肢３</th>
				<td>
					<p>
						<form:errors path="choices3" />
					</p> <form:input path="choices3" />
				</td>
			</tr>
		</table>
		<br>
		<p>
			<input type="submit" class="btn-primary btn-lg" value="保　存" /><input
				type="reset" class="btn-danger btn-lg" value="クリア" />
		</p>

	</form:form>
	<p>
		<a href="<spring:url value="/menu" />"><input type="submit"
			class="btn-success btn-lg" value="戻る　" /></a>
	</p>
	<div class="addballoon5">
		<div class="add">
			<img src="images/クラシカルメイドご案内.png" alt="ご案内" width="400" height="500">
		</div>
		<div class="chatting">
			<div class="addsays">
				こちらでクイズを作成しましょう♡
			</div>
		</div>
	</div>




</body>
</html>