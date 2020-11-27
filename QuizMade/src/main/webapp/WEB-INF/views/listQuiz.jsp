<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>クイズリスト</title>
</head>
<link href="<c:url value="css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="css/style.css"/>" rel="stylesheet">
<script src="<c:url value="js/jquery-2.2.4.min.js" />"></script>
<script src="<c:url value="js/bootstrap.bundle.min.js" />"></script>
<body>
	<div class="balloon5">
		<div class="faceicon">
			<img src="images/セクシー笑顔.png" alt="ご案内" width=200 height=250>
		</div>
		<div class="chatting">
			<div class="says">
				<p>作成したクイズのリストです♡</p>
			</div>
		</div>
	</div>
	<div class="list">
		<table>
			<tr>
				<th bgcolor="yellow">問題</th>
				<th bgcolor="red"><font color="yellow">解答</font></th>
				<th bgcolor="orange">選択肢１</th>
				<th bgcolor="orange">選択肢２</th>
				<th bgcolor="orange">選択肢３</th>

			</tr>
			<c:forEach items="${quizList}" var="quiz">
				<tr>
					<td><c:out value="${quiz.question}" /></td>
					<td align="center"><c:out value="${quiz.answer}" /></td>
					<td align="center"><c:out value="${quiz.choices1}" /></td>
					<td align="center"><c:out value="${quiz.choices2}" /></td>
					<td align="center"><c:out value="${quiz.choices3}" /></td>
					<td><a href="editQuiz/<c:out value="${quiz.id}" />"><input
							type="submit" class="btn-primary" value="編集" /></a></td>
					<td><a href="delQuiz/<c:out value="${quiz.id}" />"><input
							type="submit" class="btn-danger" value="削除" /></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<div class="page">
		<p>
			<c:if test="${totalPages > 1}">
				<c:choose>
					<c:when test="${currentPage == 1}">
 前のページ
 </c:when>
					<c:otherwise>
						<a href="?p=<c:out value="${currentPage - 1}" />">前のページ</a>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="1" end="${totalPages}" var="p">
 |
<c:choose>
						<c:when test="${currentPage == p}">
							<c:out value="${p}" />
						</c:when>
						<c:otherwise>
							<a href="?p=<c:out value="${p}" />"><c:out value="${p}" /></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
 |
<c:choose>
					<c:when test="${currentPage == totalPages}">
 次のページ
 </c:when>

					<c:otherwise>
						<a href="?p=<c:out value="${currentPage + 1}" />">次のページ</a>
					</c:otherwise>
				</c:choose>
			</c:if>

		</p>
	</div>
	<p>
		<a href="<spring:url value="/addQuiz" />"><input type="submit"
			class="btn-warning btn-lg" value="クイズ作成" /></a>
	</p>
	<p>
		<a href="<spring:url value="/menu" />"><input type="submit"
			class="btn-success btn-lg" value="戻る" /></a>
	</p>

</body>
</html>