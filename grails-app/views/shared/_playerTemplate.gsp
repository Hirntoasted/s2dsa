<%@ page contentType="text/html;charset=UTF-8" %>
<li class="${playerIndex == 0 ? 'active' : ''}" style="width:${100 / playerCount}%;left:${(playerIndex < (playerCount / 2)) ? ((playerIndex - 0.5) * (100/playerCount)) + 50 : ((playerIndex - 0.5 - playerCount) * (100/playerCount)) + 50}%;">
	<r:img uri="/images/players/${player.s2name}.jpg" />
	<div class="info">
		<span class="name">${player.name}</span>
		<span class="department">${player.department}</span>
		<span class="about">${player.about}</span>
	</div>
</li>
