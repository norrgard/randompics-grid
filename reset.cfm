<cfinclude template="_header.cfm">
<cfdirectory directory="#expandPath('dump/')#" name="getFolders" action="list">
<cfoutput>
<script type="text/javascript">
function updateProgress(p,msg) {
	$('.progress-bar').attr('aria-valuenow', p);
	$('.progress-bar').css('width', p + '%');
	$('.sr-only').html(p + '% complete');
	$('.rollingMessage').html(msg);
}
</script>
	

<cfif isDefined("form.folderName")>
	<cfset keepGoing = true />
	<cfset dspMessage = "" />

	<!--- create main directory --->
	<cfset newDir = expandPath('dump/' & form.folderName) />
	<cfif not directoryExists(newDir)>
		<cfdirectory action="create" directory="#newDir#">
		<div class="alert alert-success" role="alert">
			Created directory #newDir#
		</div>
	<cfelse>
		<div class="alert alert-danger" role="alert">
			Directory #newDir# already exists, are you sure you want to move files to this directory?</p>
		</div>
		<cfset keepGoing = false />
	</cfif>
	
	<!--- if directory check ok --->
	<cfif keepGoing>

		<cfdirectory directory = "#expandPath('dump/default')#" action = "list" name = "getAllFiles">
		<cfloop query = "getAllFiles">
			<cffile action = "move" source = "#expandPath('dump/default')#/#getAllFiles.name#" destination = "#newDir#">
			<img src="/img/spacer.gif" onLoad="updateProgress(#round((getAllFiles.currentRow/getAllFiles.recordCount)*100)#,'Moving file #getAllFiles.name#');">
			<cfflush />
		</cfloop>
		
		<div class="progress">
			<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				<span class="sr-only">0%</span>
			</div>
		</div>
		
		<div class="alert alert-info rollingMessage" role="alert">
			Starting...
		</div>
				
		<div class="alert alert-success" role="alert">
			Complete
		</div>
		<cfflush />
		<script type="text/javascript">
			$('.progress').hide();
			$('.rollingMessage').hide();
		</script>
		
	</cfif> <!--- keepGoing --->
	
</cfif><!--- if folder name defined --->

</cfoutput>
<cfinclude template="_footer.cfm">