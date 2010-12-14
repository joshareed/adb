<%@ page import="org.andrill.adb.pubs.Citation" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'citation.label', default: 'Citation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div class="body">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.title.label" default="Title" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "title")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.authors.label" default="Authors" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "authors")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.year.label" default="Year" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "year")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.publication.label" default="Publication" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "publication")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.volume.label" default="Volume" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "volume")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.issue.label" default="Issue" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "issue")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.pages.label" default="Pages" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "pages")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.publisher.label" default="Publisher" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "publisher")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.link.label" default="Link" /></td>
							<td valign="top" class="value">${fieldValue(bean: citationInstance, field: "link")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="citation.owner.label" default="Owner" /></td>
							<td valign="top" class="value">${citationInstance?.owner?.firstName} ${citationInstance?.owner?.lastName}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<g:if test="${canEdit}">
				<div class="buttons">
					<g:form>
						<g:hiddenField name="id" value="${citationInstance?.id}" />
						<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
						<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					</g:form>
				</div>
			</g:if>
		</div>
	</body>
</html>
