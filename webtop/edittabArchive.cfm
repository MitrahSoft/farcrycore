<cfsetting enablecfoutputonly="true" />
<cfprocessingDirective pageencoding="utf-8">
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry.

    FarCry is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FarCry.  If not, see <http://www.gnu.org/licenses/>.
--->
<!---
|| VERSION CONTROL ||
$Header: $
$Author: $
$Date: $
$Name: $
$Revision: $

|| DESCRIPTION || 
$Description: shows archived objects $

|| DEVELOPER ||
$Developer: Brendan Sisson (brendan@daemon.com.au)$
--->
<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin">
<cfimport taglib="/farcry/core/tags/security/" prefix="sec" />

<!--- environment variables --->
<cfparam name="url.archiveid" type="uuid" />
<cfparam name="url.objectid" type="uuid" />

<!--- set up page header --->
<admin:header writingDir="#session.writingDir#" userLanguage="#session.userLanguage#">

<sec:CheckPermission error="true" permission="ObjectArchiveTab">
	<cfoutput>
	<h3>#application.rb.getResource("archive")#</h3>
	</cfoutput>
	
	<!--- check if rollback is required --->
	<cfif isdefined("url.archiveid")>
		
		<!--- get type --->
		<cfset oFourq = createObject("component","farcry.core.packages.fourq.fourq")>
		<cfset typename = oFourq.findType(url.objectid)>
		<cfset oType = createObject("component",application.types[typename].typepath)>
		
		<!--- rollback arvhice --->
		<cfset stRollback = oType.archiveRollback(objectID="#url.objectid#",archiveId="#url.archiveid#",typename=typename)>
	</cfif>
	
	<!--- get archives --->
	<cfinvoke 
	 component="#application.packagepath#.farcry.versioning"
	 method="getArchives"
	 returnvariable="getArchivesRet">
		<cfinvokeargument name="objectID" value="#url.objectid#"/>
	</cfinvoke>
	
	<cfoutput><table cellspacing="0"></cfoutput>
	<cfif getArchivesRet.recordcount gt 0>
		<!--- setup table --->
		<cfoutput>
		<tr>
			<th>#application.rb.getResource("Date")#</th>
			<th>#application.rb.getResource("Label")#</th>
			<th>#application.rb.getResource("User")#</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
		</cfoutput>
		<!--- loop over archives --->
		<cfoutput query="getArchivesRet">
		<tr>
			<td>
			#application.thisCalendar.i18nDateFormat(DATETIMELASTUPDATED,session.dmProfile.locale,application.longF)# 
			#application.thisCalendar.i18nTimeFormat(DATETIMELASTUPDATED,session.dmProfile.locale,application.shortF)#
			</td>
			<td>#label#</td>
			<td>#lastupdatedby#</td>
			<td><a href="edittabArchiveDetail.cfm?archiveid=#objectid#">#application.rb.getResource("moreDetail")#</a></td>
			<td><a href="#application.url.conjurer#?archiveid=#objectid#" target="_blank">#application.rb.getResource("archivePreview")#</a></td>
			<td>
				<a href="edittabArchive.cfm?objectid=#url.objectid#&archiveid=#objectid#">Rollback</a>
				<!--- check if archive has been rolled back successfully --->
				<cfif isdefined("url.archiveid") and stRollback.result and url.archiveId eq objectid>
					<span style="color:Red">#application.rb.getResource("rolledBackOK")#</span>
				</cfif>
			</td>
		</tr>
		</cfoutput>
	<cfelse>
	<cfoutput>
		<tr>
			<td colspan="6">#application.rb.getResource("noArchiveRecorded")#</td>
		</tr>
	</cfoutput>
	</cfif>
	<cfoutput></table></cfoutput>
</sec:CheckPermission>

<!--- setup footer --->
<admin:footer>

<cfsetting enablecfoutputonly="false" />