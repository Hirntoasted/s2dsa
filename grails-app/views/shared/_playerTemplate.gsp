<%@ page contentType="text/html;charset=UTF-8" %>
<g:set var="playerWidth" value="${100 / playerCount}" />
<g:set var="playerLeft" value="${(playerIndex < (playerCount / 2)) ? ((playerIndex - 0.5) * playerWidth) + 50 : ((playerIndex - 0.5 - playerCount) * playerWidth) + 50}" />
<li class="${playerIndex == 0 ? 'active' : ''}" style="width:${playerWidth}%;left:<g:formatNumber number="${playerLeft}" type="number" locale="en_EN" type="number" maxFractionDigits="6" roundingMode="HALF_DOWN" />%;">
	<r:img uri="/images/players/${player.s2name}.jpg" />
	<div class="info">
		<span class="name">${player.name}</span>
		<span class="department">${player.department}</span>
		<span class="about">${player.about}</span>
	</div>
</li>
