<%@ page import="org.andrill.adb.pubs.Citation" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'citation.label', default: 'Citation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div class="body">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<div class="list">
				<table>
					<thead>
						<tr>
							<g:sortableColumn property="title" title="${message(code: 'citation.title.label', default: 'Title')}" />
							<g:sortableColumn property="authors" title="${message(code: 'citation.authors.label', default: 'Authors')}" />
							<g:sortableColumn property="year" title="${message(code: 'citation.year.label', default: 'Year')}" />
							<g:sortableColumn property="publication" title="${message(code: 'citation.publication.label', default: 'Publication')}" />
							<g:sortableColumn property="owner" title="${message(code: 'citation.publication.label', default: 'Owner')}" />
						</tr>
					</thead>
					<tbody>
					<g:each in="${citationInstanceList}" status="i" var="citationInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td><g:link action="show" id="${citationInstance.id}">${fieldValue(bean: citationInstance, field: "title")}</g:link></td>
							<td>${fieldValue(bean: citationInstance, field: "authors")}</td>
							<td>${fieldValue(bean: citationInstance, field: "year")}</td>
							<td>${fieldValue(bean: citationInstance, field: "publication")}</td>
							<td>${citationInstance.owner.firstName} ${citationInstance.owner.lastName}</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
			<div class="paginateButtons">
				<g:paginate total="${citationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
