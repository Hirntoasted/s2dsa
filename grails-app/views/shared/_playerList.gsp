<%@ page contentType="text/html;charset=UTF-8" %>
<g:if test="${unlockedPlayerCount == 0}">
	<p>
		Du hast noch keine Spieler gesammelt :(
	</p>
</g:if>
<g:else>
	<p>
		<span class="unlockedPlayerCount">${unlockedPlayerCount}</span> von ${playerCount} haste schon gesammelt:
	</p>
	<div class="playerlist js_gallery">
		<div>
			<ul class="players js_list" style="width:${unlockedPlayers.size * 100}%;left:-${unlockedPlayers.size *50}%;">
				<g:each var="unlockedPlayer" in="${unlockedPlayers}" status="playerIndex">
					<g:render template="/shared/playerTemplate" model="['player': unlockedPlayer.player, 'playerCount': unlockedPlayers.size, 'playerIndex': playerIndex]" />
				</g:each>
			</ul>
		</div>
		<span class="pager prev">◄</span>
		<span class="pager next">►</span>
	</div>
</g:else>