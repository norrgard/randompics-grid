<cfscript>
e = structNew();
e.name		= "";
e.email		= "";
e.html		= "";
</cfscript>

<cfswitch expression="#url.sendto#">

	<cfcase value="mark">
		<cfset e.email = "mark.h@edgephoto.com.au">
	</cfcase>

	<cfcase value="ptrevaskis">
		<cfset e.email = "ptrevaskis@fpr.com.au">
	</cfcase>

	<cfcase value="rbr">
		<cfset e.email = "jessica@tripleeight.com.au,samantha.bonner@au.redbull.com">
	</cfcase>

	<cfcase value="csracing">
		<cfset e.email = "ben@csracing.net.au">
	</cfcase>

	<cfcase value="winterbottom">
		<cfset e.email = "ptrevaskis@fpr.com.au,management@markwinterbottom.com">
	</cfcase>

	<cfcase value="craill">
		<cfset e.email = "richard@race-torque.com">
	</cfcase>

	<cfcase value="vern">
		<cfset e.email = "vn@v8supercars.com.au,vern@nmd.com.au">
	</cfcase>

	<cfcase value="ford">
		<cfset e.email = "fb@v8supercars.com.au">
	</cfcase>

	<cfdefaultcase>
		<cfset e.email = "vern@nmd.com.au">
	</cfdefaultcase>

</cfswitch>

<cfoutput>
<cfmail to="#e.email#" from="mark.h@edgephoto.com.au" bcc="vn@v8supercars.com.au" subject="Photo from Edge Photographics" type="html">
	<cfmailparam file="#expandPath('dump/' & url.f & '/' & url.name)#" type="image/jpg">
	<p>An image for you is attached.</p>
	<p>Thanks,<br>Mark.</p>
</cfmail>
Email sent to #e.name# (#e.email#)
</cfoutput>