<cfparam name="f" default="default">
<cfdirectory directory="#expandPath('dump/')#" name="getFolders" action="list">
<cfset thumbDir = expandPath('dump/' & f & '/thumbs/') />
<cfif not directoryExists(thumbDir)>
	<cfdirectory action="create" directory="#thumbDir#"> 
</cfif>

<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Edge V8 Supercars Photos</title>
	<!-- Bootstrap core CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<!-- Bootstrap theme -->
	<link href="/css/bootstrap-theme.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="/css/style.css" rel="stylesheet">
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
</head>

<body role="document">

	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">Home</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="##" class="dropdown-toggle" data-toggle="dropdown">Directories <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<cfloop query="getFolders">
								<cfif type eq "dir">
									<li><a href="/?f=#name#">#uCase(name)#</a></li>
								</cfif>
							</cfloop>
						</ul>
					</li>
					<li><a href="/thumbCreate.cfm">Thmbnail Create</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>

	<div class="container theme-showcase" role="main">
		<div class="container">

</cfoutput>