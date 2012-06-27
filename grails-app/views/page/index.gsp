<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
</head>
<body>
	<g:if test="${uwin}">
		<div class="message">
			<span>Wir gratulieren! Du bist der Erste, der sein Sammelalbum voll hat!</span>
			<span class="small">
				Gehe nun mit dieser Meldung zu einem von den Neuen – und wir
				überreichen dir deinen Spitzenüberraschungspreis!
			</span>
		</div>
	</g:if>
	<g:elseif test="${ulose}">
		<div class="message">
			<span>
				Wir gratulieren! Du kennst jetzt alle neuen Spieler. Leider war jemand
				anderes schneller als du.
			</span>
		</div>
	</g:elseif>
	<div class="tabs">
		<div class="transfer${activeTab == 'transfer' ? ' active' : ''}">
			<p>
				Hallo ${participant.username},<br />
				toll, dass du dein Sammelalbum
				aufgemacht hast. Jetzt kann's ja
				losgehen.
			</p>
			<g:form name="unlockForm" class="unlockForm" controller="page" action="unlock">
				<h1>Spielercode eingeben:</h1>
				<g:field type="text" name="secret" required="true" />
				<g:submitButton name="login" value="Ab in die Mannschaft!" />
			</g:form>
		</div>
		<div class="players${activeTab == 'players' ? ' active' : ''}">
			<g:render template="/shared/playerList" model="['unlockedPlayers': unlockedPlayerList, 'unlockedPlayerCount': unlockedPlayerCount, 'playerCount': playerCount]" />
		</div>
		<div class="topList${activeTab == 'topList' ? ' active' : ''}">
			<g:render template="/shared/topList" model="['topList': topList]" />
		</div>
	</div>
	<div class="footer">
		<table>
			<tr>
				<td class="button${activeTab == 'transfer' ? ' active' : ''}" data-tab="transfer">
					<span class="marker">▼</span>
					<span>Transfer</span>
				</td>
				<td class="button${activeTab == 'players' ? ' active' : ''}" data-tab="players">
					<span class="marker">▼</span>
					<span><span class="unlockedPlayersCount">${unlockedPlayerCount}</span>&nbsp;/&nbsp;${playerCount} haste</span>
				</td>
				<td class="button${activeTab == 'topList' ? ' active' : ''}" data-tab="topList">
					<span class="marker">▼</span>
					<span>Top 3</span>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>