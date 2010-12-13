<html>
	<head>
		<title><g:layoutTitle default="Grails" /></title>
		<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<g:layoutHead />
		<g:javascript library="application" />
	</head>
	<body>
		<div id="spinner" class="spinner" style="display:none;">
			<img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
		</div>
		<div id="logo">
			<a href="${createLink(uri:'/')}">
				<img src="${resource(dir:'images',file:'logo.jpeg')}" alt="Grails" border="0" />
			</a>
			<sec:ifLoggedIn>
				<div style="float: right; margin-top: 5px;">
					<span class="menuButton">
						<a class="home" href="${createLink(uri:'/')}">Home</a>
					</span>
					<span class="menuButton">
						<a class="edit" href="${createLink(uri:'/home/profile')}">Settings</a>
					</span>
					<span class="menuButton">
						<a class="logout" href="${createLink(uri:'/logout')}">Logout</a>
					</span>
				</div>
			</sec:ifLoggedIn>
		</div>
		<g:layoutBody />
	</body>
</html>