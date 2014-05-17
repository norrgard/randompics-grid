<cfscript>
e = structNew();
e.name		= "";
e.email		= "";
e.html		= "";
</cfscript>

<cfswitch expression="#url.sendto#">

	<cfcase value="mark">
		<cfset e.name = "Mark">
		<cfset e.email = "mark.h@edgephoto.com.au">
	</cfcase>

	<cfcase value="ptrevaskis">
		<cfset e.name = "Peter Trevaskis">
		<cfset e.email = "ptrevaskis@fpr.com.au">
	</cfcase>

	<cfcase value="vern">
		<cfset e.name = "Vern">
		<cfset e.email = "vn@v8supercars.com.au">
	</cfcase>
	
	<cfdefaultcase>
		<cfset e.name = "Vern">
		<cfset e.email = "vern@nmd.com.au">
	</cfdefaultcase>

</cfswitch>

<cfoutput>
<cfmail to="#e.email#" from="vn@v8supercars.com.au" subject="Photo from Edge" type="html">
	<cfmailparam file="#expandPath('dump/' & url.f & '/' & url.name)#" type="image/jpg">
	<p>#e.name#,</p>
	<p>An image for you is attached.</p>
	<p>Thanks</p>
</cfmail>
Email sent to #e.name# (#e.email#)
</cfoutput>