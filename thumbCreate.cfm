<cfinclude template="_header.cfm">
<cfoutput>

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


</cfoutput>
<cfinclude template="_header.cfm">