<%@ page contentType="text/html;charset=UTF-8" %>
<p>
	<g:if test="${unlockedPlayerCount == 0}">
		Du hast noch keine Spieler gesammelt :(
	</g:if>
	<g:else>
		<span class="unlockedsCount">${unlockedPlayerCount}</span> von ${playerCount} haste schon gesammelt:
	</g:else>
</p>
<div class="playerlist">	
	<ul class="players" style="width:${unlockedPlayerCount * 100}%;left:-${unlockedPlayerCount *50}%;">
		<g:each var="unlockedPlayer" in="${unlockedPlayers}" status="playerIndex">
			<g:render template="/shared/playerTemplate" model="['unlockedPlayer': unlockedPlayer, 'unlockedPlayerCount': unlockedPlayerCount, 'playerIndex': playerIndex]" />
		</g:each>
	</ul>
</div>