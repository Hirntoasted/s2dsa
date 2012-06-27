<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
</head>
<body>
	<p>
		Hier steht ein Text, wie's geht.
		Einloggen mit E-Mail-Adresse,
		Spielercode erfragen und eingeben.
		Dann gewinnen! Lorem ipsum dolor sit
		amet.
	</p>
	<g:form name="loginForm" class="loginForm" controller="login" action="login">
		<h1>Dein S2-Kürzel</h1>
		<g:field type="text" name="username" required="true" />
		<g:submitButton name="login" value="Anpfiff." />
	</g:form>
</body>
</html>