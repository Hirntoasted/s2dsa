<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta name="layout" content="main" />
<r:require module="application" />
</head>
<body>
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
			<g:render template="/shared/playerList" model="['unlockedPlayers': participant.unlockedPlayers, 'unlockedPlayerCount': unlockedPlayerCount, 'playerCount': playerCount]" />
		</div>
		<div class="topList${activeTab == 'topList' ? ' active' : ''}">
			<g:render template="/shared/topList" model="['topList': topList]" />
		</div>
	</div>
	<div class="footer">
		<div class="button${activeTab == 'transfer' ? ' active' : ''}" data-tab="transfer"><span>Transfer</span></div>
		<div class="button${activeTab == 'players' ? ' active' : ''}" data-tab="players"><span><span class="unlockedPlayersCount">${unlockedPlayerCount}</span>&nbsp;/&nbsp;${playerCount} haste</span></div>
		<div class="button${activeTab == 'topList' ? ' active' : ''}" data-tab="topList"><span>Top 3</span></div>
	</div>
</body>
</html>