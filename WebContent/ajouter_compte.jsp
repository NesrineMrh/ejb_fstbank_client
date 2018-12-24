<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajouter un compte</title>
</head>
<body>
 <form action="./GestionComptes" method="POST">
 
	<table>
		<tr>
			<td>Solde de compte:</td>
			<td><input type="text" name="solde"></input></td>
						<td><input type="submit" name="submit" value="envoyer"></input></td>
			
		</tr>
	</table>
	</form>
</body>
</html>