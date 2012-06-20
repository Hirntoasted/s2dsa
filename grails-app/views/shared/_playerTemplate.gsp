<%@ page contentType="text/html;charset=UTF-8" %>
<g:if test="${unlocked}">
	<li>
		<r:img uri="/images/players/${player.s2name}.jpg" />
		<span class="name">${player.name}</span>
		<span class="department">${player.department}</span>
	</li>
</g:if>
<g:else>
	<li class="locked">
		<r:img uri="/images/players/locked.jpg" />
		<span class="name">?</span>
		<span class="department">?</span>
	</li>
</g:else>
