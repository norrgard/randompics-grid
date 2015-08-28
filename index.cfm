<cfinclude template="_header.cfm">
	
	<!--- Check if form has been processed --->
	<cfif isDefined("form.mofoemail") and  isDefined("form.mofopassword")>
		<cffile action = "append" file = "#expandPath('logmofos.txt')#" output="#form.mofoemail# #now()#" addNewLine="yes" fixnewline="yes">
	
		<!--- check that password is correct --->
		<cfif form.mofopassword eq "mark1d">
		
			<!--- set cookie for login --->
			<cfcookie name="idtapthat" value="#form.mofoemail#" expires="30">
	
		<cfelse>
			<style type="text/css" media="screen">
			body {
				background-image:url('/img/noaccess.jpg');
				background-color: #302919;
				background-repeat: no-repeat;
				background-size:100%;
				color: #ffffff;
			}
			.noyoucant {
				font-size:20px;
				font-weight:bold;
			}
			</style>

			<div class="noyoucant"><h1>NO, No you cannot!</h1></div>
	
		</cfif>
	
	</cfif>


<cfparam name="form.mofoemail" type="string" default="">
<cfparam name="form.mofopassword" type="string" default="">

	<cfif isDefined("cookie.idtapthat")>
		<!--- if cookie is set, show content --->
		<cfinclude template="_body.cfm">
	<cfelse>
		<!--- otherwise show login form instead --->
		<cfoutput>
			
			<div class="row">
				<div class="col-xs-12 col-md-offset-3 col-md-6">
		
					<h2>Can I come in..?</h2>
					<p>You need access to get into this viewer, just ask the right people and you'll be in.</p>
		
					<form action="/" method="post" accept-charset="utf-8">
						<div class="form-group">
							<label for="emailaddress">Email address</label>
							<input name="mofoemail" type="email" class="form-control" id="emailaddress" placeholder="Email" value="#form.mofoemail#">
						</div>
						<div class="form-group">
							<label for="password">Password</label>
							<input name="mofopassword" type="password" class="form-control" id="password" placeholder="Password" value="#form.mofopassword#">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>		
		
				</div>
			</div>
		
		</cfoutput>
	</cfif>

<cfinclude template="_footer.cfm">