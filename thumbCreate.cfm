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
				<li><a href="/">Home</a></li>
				<li class="active"><a href="/thumbCreate.cfm">Thmbnail Create</a></li>
			</ul>
		</div><!--/.nav-collapse -->
	</div>
</div>

<div class="container theme-showcase" role="main">


<div class="container">
	<!--- folders --->
	<h2>Folders</h2>
	<p>
		<cfloop query="getFolders">
			<cfif type eq "dir">
				<a type="button" class="btn btn-default <cfif name eq f> active</cfif>" href="/thumbCreate.cfm?f=#name#">#uCase(name)#</a>
			</cfif>
		</cfloop>
	</p>

	<!--- email --->
	<cfif isDefined("url.sendto")>
	<div class="alert alert-success">
		<cfinclude template="email.cfm">
		</div>
	</cfif>


	<!--- show files --->
	<cfdirectory directory="#expandPath('dump/#f#')#" name="getFiles" action="list" sort="name">

	<p>Images on files count: #getFiles.recordCount#</p>
	<cfset fileCount = 0 />
	<cfloop query="getFiles">
		<cftry>
			<cfif right(name, 3) eq "jpg">
				<cfset imglo = expandPath('dump/' & f & '/' & name) />
				<cfset thumb = expandPath('dump/' & f & '/thumbs/' & name) />
				<cfif not fileExists(thumb)>
					<cfimage action = "resize" width="95" height="76" source="#imglo#" destination="#thumb#" overwrite="yes">
						Created: #thumb#<br />
						<cfset fileCount = fileCount + 1 />
						<cfflush />
					</cfif>
				</cfif>
				<cfif fileCount gte 11>
					<cfbreak>
				</cfif>
				<cfcatch type="any">#thumb# - #cfcatch.message#</cfcatch>
			</cftry>
		</cfloop>
	</div>



</div> <!-- /container -->


<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<!--- <script src="../../assets/js/docs.min.js"></script> --->
</body>
</html>
</cfoutput>