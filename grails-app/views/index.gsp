<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
</head>
<body>
	<p>
		So geht's:
	</p>
	<ol>
		<li>Einloggen mit S2-Kürzel.</li>
		<li>Spielercode erfragen und eingeben.</li>
		<li>Als erster alle 22 neuen Spieler im Sammelalbum haben – und gewinnen!</li>
	</ol>
	<g:form name="loginForm" class="loginForm" controller="login" action="login">
		<h1>Dein S2-Kürzel</h1>
		<g:field type="text" name="username" required="true" />
		<g:submitButton name="login" value="Anpfiff." />
	</g:form>
</body>
</html>