<%@ page contentType="text/html;charset=UTF-8" %>
<p>
	Klar. Hier geht's um die Besten mit den
	meisten Transfers. (Sei besser!)
</p>
<ul class="toplist">
	<g:each in="${topList}" var="participant" status="idx">
		<li><span>${idx}</span>${participant}</li>
	</g:each>
</ul>