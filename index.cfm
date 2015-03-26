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
				
				<!--- email --->
				<cfif isDefined("url.sendto")>
					<div class="alert alert-success">
						<cfinclude template="email.cfm">
					</div>
				</cfif>
				

				<!--- show files --->
				<cfdirectory directory="#expandPath('dump/#f#')#" name="getFiles" action="list" sort="name" filter="*.jpg">
				
				<cfif isDefined("url.name")>
					<cfset thisCurrentRow = 0 />
					<cfloop query = "getFiles">
						<cfif url.name eq getFiles.name>
							<cfset thisCurrentRow = getFiles.currentRow />
						</cfif>
					</cfloop>
					
					<div class="row">
						<div class="col-12 col-lg-8"> <img src="/dump/#f#/#name#" style="width:800px" class="img-responsive"> </div>
						<div class="col-12 col-lg-4">
							
							<div class="btn-group  btn-group-justified" role="group">
								<!--- PREVIOUS IMAGE --->
								<cfif thisCurrentRow gt 1>
									<a href="/?f=#f#&name=#getFiles.name[thisCurrentRow-1]#" class="btn btn-primary">Previous</a>
								<cfelse>
									<a href="" class="btn btn-default btn-block" disabled="disabled">First Image</a>
								</cfif>
							
								<!--- PREVIOUS IMAGE --->
								<cfif thisCurrentRow neq getFiles.recordCount>
									<a href="/?f=#f#&name=#getFiles.name[thisCurrentRow+1]#" class="btn btn-primary">Next</a>
								<cfelse>
									<a href="" class="btn btn-default btn-block" disabled="disabled">Last Image</a>
								</cfif>
							</div>
							
							<h3>Options</h3>
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=craill">Richard Craill</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=ptrevaskis">FPR / Trevaskis</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=winterbottom">Winterbottom</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=rbr">Red Bull Racing Aust</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=csracing">Ben Nightingale</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=mark">Mark</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=vern">Vern</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=ford">Ford Brown</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=default">Vern Test</a><br />
						</div>					
					</div>
				</cfif>
				
				
				<p>Count: #getFiles.recordCount#</p>
				<cfloop query="getFiles">
					<cfif right(name, 3) eq "jpg">
						<cfset imglo = expandPath('dump/' & f & '/' & name) />
						<cfset thumb = expandPath('dump/' & f & '/thumbs/' & name) />
						<cfif not fileExists(thumb)>
							<a href="/?f=#f#&name=#name#" style="float:left; margin:5px;"><button type="button" class="btn btn-default btn-lg glyphicon glyphicon-time" style="width:100px; height:80px"></button></a>
						<cfelse>
							<a href="/?f=#f#&name=#name#" style="float:left; margin:5px;"><img src="/dump/#f#/thumbs/#name#" style="width:100px" class="thumbnail img-thumbnail"></a>
						</cfif>
					</cfif>
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