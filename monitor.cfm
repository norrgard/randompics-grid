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
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

		<div class="row">
			<div class="col-xs-6">
				<iframe id="mainServer" src="http://54.252.97.65:8088/fusionreactor/findex.htm" width="100%" height="500"></iframe>
			</div>
			<div class="col-xs-6">
				<iframe id="adminServer" src="http://ec2-54-253-59-246.ap-southeast-2.compute.amazonaws.com:8088/fusionreactor/findex.htm?p=webMetrics&__toc=metrics" width="100%" height="500"></iframe>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-6">
				<iframe id="analytics" src="http://54.252.97.65:8088/fusionreactor/findex.htm?p=running&__toc=transit&flavor=HTTPClient" width="100%" height="500"></iframe>
			</div>
			<div class="col-xs-6">
				<iframe id="streamCheck" src="http://ec2-54-253-59-246.ap-southeast-2.compute.amazonaws.com:8088/fusionreactor/findex.htm?p=running&__toc=transit&flavor=HTTPClient" width="100%" height="500"></iframe>
			</div>
		</div>

		

    <div class="container" role="main">





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