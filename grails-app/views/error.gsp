<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
<title>Grails Runtime Exception</title>
</head>
<body>
	<p>
		<g:renderException exception="${exception}" />
	</p>
</body>
</html>