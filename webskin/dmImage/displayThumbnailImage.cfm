<cfsetting enablecfoutputonly="true">
<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Display Thumbnail Image --->
<!--- @@description:   --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au) --->



<cfoutput>
<img src="#application.url.imageroot##stobj.thumbnailImage#" alt="#stobj.alt#" title="#stobj.title#" />
</cfoutput>

<cfsetting enablecfoutputonly="false">