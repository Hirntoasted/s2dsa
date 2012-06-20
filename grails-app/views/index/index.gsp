<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
<title>Digital Sticker Album</title>
</head>
<body>
	<div id="content">
		<div class="header">
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<g:loginControl />
			<div class="clear"></div>
		</div>
		<g:if test="${!session.participant}">
			<div class="new">
				<h1>Lorem ipsum dolizzle...</h1>
				<p>
					we gonna chung volutpizzle, fo shizzle quis, gravida vizzle, check
					out this. I saw beyonces tizzles and my pizzle went crizzle stuff,
					crunk adipiscing elit. Pellentesque eget tortor. Fo shizzle my
					nizzle erizzle. Cool izzle dolor dapibizzle cool tempizzle boofron.
					Maurizzle check it out nibh et shizzle my nizzle crocodizzle. cool
					tortizzle. Mofo eleifend rhoncizzle shiz. Gangster hizzle habitasse
					platea dictumst. Da bomb dapibizzle. Fo shizzle tellizzle urna,
					pretizzle eu, mattizzle we gonna chung, eleifend stuff, nunc. Go to
					hizzle suscipit. Fo shizzle my nizzle my shizz velit sizzle bling
					bling.
				</p>
				<g:form name="registerForm" action="register" autocomplete="off">
					<table>
						<tbody>
							<tr>
								<td>Username</td>
								<td><g:field type="text" name="username" required="true" /></td>
							</tr>
							<tr>
								<td>Passwort</td>
								<td><g:passwordField name="password" /></td>
							</tr>
							<tr>
								<td></td>
								<td> <g:passwordField name="passwordcheck" /></td>
							</tr>
							<tr>
								<td colspan="2" class="buttons"><g:submitButton name="login"
										value="Anmelden" /></td>
							</tr>
						</tbody>
					</table>
				</g:form>
			</div>
		</g:if>
		<div class="unlock hidden">
			<g:form name="unlockForm" action="unlock">
				<table>
					<tbody>
						<tr>
							<td>Einen Spieler freischalten</td>
							<td><g:field type="text" name="secret" required="true" /></td>
						</tr>
						<tr>
							<td colspan="2" class="buttons">
								<g:submitButton name="login" value="Ok" />
								<span class="button reset">Doch nicht...</span>
							</td>
						</tr>
					</tbody>
				</table>
			</g:form>
		</div>
		<ul class="players">
			<g:each var="player" in="${players}">
				<g:set var="unlocked" value="${participant && participant.hasUnlockedPlayer(player)}" />
				<g:render template="/shared/playerTemplate" var="player" model="['player': player, 'unlocked': unlocked]" />
			</g:each>
		</ul>
	</div>
</body>
</html>