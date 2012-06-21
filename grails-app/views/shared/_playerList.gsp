<%@ page contentType="text/html;charset=UTF-8" %>
<p>
	<g:if test="${unlockedPlayerCount == 0}">
		Du hast noch keine Spieler gesammelt :(
	</g:if>
	<g:else>
		<span class="unlockedsCount">${unlockedPlayerCount}</span> von ${playerCount} haste schon gesammelt:
	</g:else>
</p>
<ul class="players">
	<g:render template="/shared/playerTemplate" collection="${unlockedPlayers}" var="player" />
</ul>