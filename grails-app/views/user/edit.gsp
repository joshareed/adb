<%@ page import="org.andrill.adb.User" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="user" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="user-add" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div class="body">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<div class="errors">
				<g:renderErrors bean="${userInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<div class="dialog">
					<table>
						<tbody>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="username"><g:message code="user.username.label" default="Username" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
									<g:textField name="username" value="${userInstance?.username}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="newPassword"><g:message code="user.password.label" default="Password" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
									<g:textField name="newPassword" value="" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="firstName"><g:message code="user.firstName.label" default="First Name" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'firstName', 'errors')}">
									<g:textField name="firstName" value="${userInstance?.firstName}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="lastName"><g:message code="user.lastName.label" default="Last Name" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'lastName', 'errors')}">
									<g:textField name="lastName" value="${userInstance?.lastName}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="email"><g:message code="user.email.label" default="Email" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
									<g:textField name="email" value="${userInstance?.email}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="department"><g:message code="user.department.label" default="Department" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'department', 'errors')}">
									<g:textField name="department" value="${userInstance?.department}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="institution"><g:message code="user.institution.label" default="Institution" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'institution', 'errors')}">
									<g:textField name="institution" value="${userInstance?.institution}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="address1"><g:message code="user.address1.label" default="Address1" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'address1', 'errors')}">
									<g:textField name="address1" value="${userInstance?.address1}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="address2"><g:message code="user.address2.label" default="Address2" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'address2', 'errors')}">
									<g:textField name="address2" value="${userInstance?.address2}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="city"><g:message code="user.city.label" default="City" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'city', 'errors')}">
									<g:textField name="city" value="${userInstance?.city}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="state"><g:message code="user.state.label" default="State" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'state', 'errors')}">
									<g:textField name="state" value="${userInstance?.state}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="postalCode"><g:message code="user.postalCode.label" default="Postal Code" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'postalCode', 'errors')}">
									<g:textField name="postalCode" value="${userInstance?.postalCode}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="country"><g:message code="user.country.label" default="Country" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'country', 'errors')}">
									<g:textField name="country" value="${userInstance?.country}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="enabled"><g:message code="user.enabled.label" default="Enabled" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'enabled', 'errors')}">
									<g:checkBox name="enabled" value="${userInstance?.enabled}" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="buttons">
					<span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
					<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
				</div>
			</g:form>
		</div>
	</body>
</html>
