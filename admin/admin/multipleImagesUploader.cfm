<cfsetting enablecfoutputonly="yes">
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin">
<cfprocessingDirective pageencoding="utf-8">

<!--- check permissions --->
<cfif NOT request.dmSec.oAuthorisation.checkPermission(reference="policyGroup",permissionName="AdminCOAPITab")>	
	<admin:permissionError>
	<cfabort>
</cfif>

<admin:header title="Multiple image uploader" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#">
<cfif len(application.url.webroot)>
	<cfset appRoot = right(application.url.webroot,len(application.url.webroot)-1)>
	<cfset appRoot = replace(appRoot,"/",".")>
	<skin:flexWrapper SWFSource="#application.url.farcry#/admin/ui/swf/multipleUploader.swf" id="multiple" flashVars="#lcase(session.urltoken)#&appRoot=#appRoot#">
<cfelse>
	<skin:flexWrapper SWFSource="#application.url.farcry#/admin/ui/swf/multipleUploader.swf" id="multiple" flashVars="#lcase(session.urltoken)#">
</cfif>


<admin:footer>

<cfsetting enablecfoutputonly="no">