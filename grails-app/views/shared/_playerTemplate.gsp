<%@ page contentType="text/html;charset=UTF-8" %>
<li class="${playerIndex == 0 ? 'active' : ''}" style="width:${100 / unlockedPlayerCount}%;left:${(playerIndex < (unlockedPlayerCount / 2)) ? ((playerIndex - 0.5) * (100/unlockedPlayerCount)) + 50 : ((playerIndex - 0.5 - unlockedPlayerCount) * (100/unlockedPlayerCount)) + 50}%;">
	<r:img uri="/images/players/${unlockedPlayer.player.s2name}.jpg" />
	<span class="name">${unlockedPlayer.player.name}</span>
	<span class="about">${unlockedPlayer.player.about}</span>
	<span class="department">${unlockedPlayer.player.department}</span>
</li>
