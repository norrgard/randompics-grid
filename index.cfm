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
            <li class="active"><a href="/">Home</a></li>
            <li><a href="/thumbCreate.cfm">Thmbnail Create</a></li>
            <!--- <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li> --->
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
						<a type="button" class="btn btn-default <cfif name eq f> active</cfif>" href="/?f=#name#">#uCase(name)#</a>
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
				<cfif isDefined("url.name")>
					<div class="row">
						<div class="col-12 col-lg-4">
							<h3>Options</h3>
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=ptrevaskis">FPR / Trevaskis</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=winterbottom">Winterbottom</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=rbr">Red Bull Racing Aust</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=csracing">Ben Nightingale</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=mark">Mark</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=vern">Vern</a><br />
							<a type="button" class="btn btn-default btn-block" href="/?f=#f#&name=#url.name#&sendto=default">Vern Test</a><br />
						</div>
						
						<div class="col-12 col-lg-8"> <img src="/dump/#f#/#name#" style="width:800px" class="img-responsive"> </div>
					</div>
				</cfif>
				
				
				<h2>Images on files</h2>
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