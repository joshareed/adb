<%@ page import="org.andrill.adb.pubs.Citation" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'citation.label', default: 'Citation')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="citation" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
		</div>
		<div class="body">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${citationInstance}">
			<div class="errors">
				<g:renderErrors bean="${citationInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form action="save" >
				<div class="dialog">
					<table>
						<tbody>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="authors"><g:message code="citation.authors.label" default="Authors" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'authors', 'errors')}">
									<g:textField name="authors" value="${citationInstance?.authors}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="title"><g:message code="citation.title.label" default="Title" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'title', 'errors')}">
									<g:textField name="title" value="${citationInstance?.title}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="year"><g:message code="citation.year.label" default="Year" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'year', 'errors')}">
									<g:textField name="year" value="${citationInstance?.year}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="publication"><g:message code="citation.publication.label" default="Publication" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'publication', 'errors')}">
									<g:textField name="publication" value="${citationInstance?.publication}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="volume"><g:message code="citation.volume.label" default="Volume" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'volume', 'errors')}">
									<g:textField name="volume" value="${citationInstance?.volume}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="issue"><g:message code="citation.issue.label" default="Issue" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'issue', 'errors')}">
									<g:textField name="issue" value="${citationInstance?.issue}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="pages"><g:message code="citation.pages.label" default="Pages" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'pages', 'errors')}">
									<g:textField name="pages" value="${citationInstance?.pages}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="publisher"><g:message code="citation.publisher.label" default="Publisher" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'publisher', 'errors')}">
									<g:textField name="publisher" value="${citationInstance?.publisher}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="link"><g:message code="citation.link.label" default="Link" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'link', 'errors')}">
									<g:textField name="link" value="${citationInstance?.link}" />
								</td>
							</tr>
							<sec:access expression="hasRole('ROLE_ADMIN')">
								<tr class="prop">
									<td valign="top" class="name">
										<label for="owner"><g:message code="citation.owner.label" default="Owner" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: citationInstance, field: 'owner', 'errors')}">
										<select name="owner.id" id="owner.id">
											<g:each in="${org.andrill.adb.User.list()}">
												<option value="${it.id}">${it.firstName} ${it.lastName}</option>
											</g:each>
										</select>
									</td>
								</tr>
							</sec:access>
						</tbody>
					</table>
				</div>
				<div class="buttons">
					<span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
				</div>
			</g:form>
		</div>
	</body>
</html>
