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
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
--->
<!------------------------------------------------------------------------
contentObjectGet (fourQ COAPI)
Copyright Daemon Pty Limited 2002 (http://www.daemon.com.au/)

$Header: /cvs/farcry/fourq/tags/contentobjectget.cfm,v 1.15 2005/10/24 03:49:16 guy Exp $
$Author: guy $
$Date: 2005/10/24 03:49:16 $
$Name:  $
$Revision: 1.15 $

Contributors:
Geoff Bowers (modius@daemon.com.au)
Paul Harrison (harrisonp@cbc.curtin.edu.au)

Description:
A wrapper to get a content object instance and return its structure.
------------------------------------------------------------------------->
<!--- ContentObjectGet --->

<cfif thisTag.executionmode eq "start">

	<cfif not isDefined("attributes.objectid")>
		<cfabort showerror="objectid must be passed to contentobjectget" />
	</cfif>
	<cfparam name="attributes.typename" default="" />
	<cfparam name="attributes.r_stObject" default="stObject" />
	<cfparam name="attributes.dsn" default="#application.dsn#" /> 
	
	<cfif not len(attributes.typename)>
		<cfset variables.oFourQ = createObject("component", "farcry.core.packages.fourq.fourq") />
		<cfset attributes.typename = variables.oFourQ.findType(objectid=attributes.objectid,dsn=attributes.dsn) />
	</cfif>
	
	<cfif len(attributes.typename)>
		<!--- Just in case the whole package path has been passed in, we only need the actual typename --->
		<cfset attributes.typename = listLast(attributes.typename,".") />
	
		<cfset oType  = createObject("component", application.stcoapi[attributes.typename].packagePath) />
		<cfset caller[attributes.r_stObject] = oType.getData(objectid=attributes.objectid,dsn=attributes.dsn) />
	<cfelse>
		<cfset caller[attributes.r_stObject] = structNew() />
	</cfif>

</cfif>