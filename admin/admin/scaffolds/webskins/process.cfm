<cfif structkeyexists(form,"generateWebskinPage") and form.generateWebskinPage>
		
	<cfif not directoryexists("#application.path.project#/webskin/#form.typename#")>
		<cfdirectory action="create" directory="#application.path.project#/webskin/#form.typename#" />
	</cfif>
	
	<!--- Generate webskin --->
	<cffile action="read" file="#application.path.core#/admin/admin/scaffolds/webskins/displayPageStandard.txt" variable="content" />
	<cfset values = structnew() />
	<cfset values.projectname = application.ApplicationName />
	<cfset values.typename = form.typename />
	<cfset content = substitute(content,values) />
	<cffile action="write" file="#application.path.project#/webskin/#form.typename#/displayPageStandard.cfm" output="#content#" />
	
	<cfoutput>
		<p class="success">Standard page created</p>
	</cfoutput>

</cfif>

<cfif structkeyexists(form,"generateWebskinTeaser") and form.generateWebskinTeaser>
		
	<cfif not directoryexists("#application.path.project#/webskin/#form.typename#")>
		<cfdirectory action="create" directory="#application.path.project#/webskin/#form.typename#" />
	</cfif>
	
	<!--- Generate webskin --->
	<cffile action="read" file="#application.path.core#/admin/admin/scaffolds/webskins/displayTeaserStandard.txt" variable="content" />
	<cfset values = structnew() />
	<cfset values.projectname = application.ApplicationName />
	<cfset values.typename = form.typename />
	<cfset content = substitute(content,values) />
	<cffile action="write" file="#application.path.project#/webskin/#form.typename#/displayTeaserStandard.cfm" output="#content#" />
	
	<cfoutput>
		<p class="success">Standard teaser created</p>
	</cfoutput>

</cfif>