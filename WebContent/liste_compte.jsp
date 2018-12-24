<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>listes Comptes</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>code:</td>
			<td>solde:</td>
			<td>date de creation:</td>
			<td>Type:</td>
			<td>client:</td>
		</tr>
		<c:forEach items="${comptes}" var="compte">
		<tr>
			<td>${compte.code}</td>
			<td>${compte.solde}:</td>
			<td>${compte.dateCreation}</td>
			<td>${compte.type}</td>
			<td>hh</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>