<%@ page contentType="text/html;charset=UTF-8" %>
<div class="logincontrol">
	<g:if test="${participant}">
		<span>Angemeldet als </span><span class="participant">${participant.username}</span>
		<a href="${createLink(controller: 'login', action: 'logout')}">Abmelden</a>
	</g:if>
	<g:else>
		<g:form name="loginForm" controller="login" action="login">
			<table>
				<tbody>
					<tr>
						<td>Username</td>
					</tr>
					<tr>
						<td><g:field type="text" name="username" required="true" /></td>
						<td><g:submitButton name="login" value="Anmelden" /></td>
					</tr>
				</tbody>
			</table>
		</g:form>
	</g:else>
</div>