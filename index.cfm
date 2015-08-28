<cfinclude template="_header.cfm">
<cfoutput>
				<!--- email --->
				<cfif isDefined("url.sendto")>
					<div class="alert alert-success">
						<cfinclude template="_email.cfm">
					</div>
				</cfif>
				

				<!--- get files --->
				<cfdirectory directory="#expandPath('dump/#f#')#" name="getFiles" action="list" sort="name" filter="*.jpg">
				
				<!--- display file details --->
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
						</div>					
					</div>
				</cfif>
				<p>Count: #getFiles.recordCount#</p>
				
				<!--- reset folder --->
				<cfif f eq "default" and getFiles.recordCount gt 0>
					<div class="row">
						<div class="col-xs-12">
							<button type="button" class="btn btn-primary btn-sm resetButton">Reset Folder</button>
							<div class="resetForm" style="margin:10px 0; display:none;">
								<form action="reset.cfm" method="post" class="form-inline">
									<div class="form-group">
										<input type="text" name="folderName" class="form-control" id="folderName" placeholder="New Folder Name">
									</div>
									<button type="submit" class="btn btn-default">Reset Folder</button>
								</form>
							</div>
						</div>
					</div><!--- row --->
				</cfif>
				
				<!--- show thumbnails --->
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
<script type="text/javascript">
$(document).ready(function() {	
	$('.resetButton').click(function() {
		$('.resetForm').slideToggle('slow');
	});
});
</script>

</cfoutput>
<cfinclude template="_footer.cfm">