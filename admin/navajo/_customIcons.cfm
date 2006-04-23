<cfsetting enablecfoutputonly="Yes">



<cfscript>
nimages = "#application.url.farcry#/navajo/nimages";
cimages = "#nimages#/customIcons";
customIcons = StructNew();


customIcons.Type = StructNew();

customIcons.Type = StructNew();
customIcons.Type.default = StructNew();
customIcons.Type.default.draft ="defaultObjectDraft";
customIcons.Type.default.pending ="defaultObjectPending";
customIcons.Type.default.approved ="defaultObjectApproved";

customIcons.Type.imageRoot = StructNew();
customIcons.Type.imageRoot.draft = "images";
customIcons.Type.imageRoot.pending = "images";
customIcons.Type.imageRoot.approved = "images";

customIcons.Type.home = StructNew();
customIcons.Type.home.draft = "home";
customIcons.Type.home.pending = "home";
customIcons.Type.home.approved = "home";

customIcons.Type.Rubbish = StructNew();
customIcons.Type.Rubbish.draft = "rubbish";
customIcons.Type.Rubbish.pending = "rubbish";
customIcons.Type.Rubbish.approved = "rubbish";

customIcons.Type.root = StructNew();
customIcons.Type.root.draft = "webserver";
customIcons.Type.root.pending = "webserver";
customIcons.Type.root.approved = "webserver";

customIcons.Type.FileRoot = StructNew();
customIcons.Type.FileRoot.draft = "floppyDisk";
customIcons.Type.FileRoot.pending = "floppyDisk";
customIcons.Type.FileRoot.approved = "floppyDisk";

customIcons.Type.Test = StructNew();
customIcons.Type.Test.draft = "test";
customIcons.Type.Test.pending = "test";
customIcons.Type.Test.approved = "test";

if( StructKeyExists( application.types, "dmNavigation" ) )
{
	customIcons.Type.dmnavigation = StructNew();
	customIcons.Type.dmnavigation.draft ="navDraftImg";
	customIcons.Type.dmnavigation.pending ="navPending";
	customIcons.Type.dmnavigation.approved ="navApprovedImg";
}

if( StructKeyExists( application.types, "dmImage" ) )
{
	customIcons.Type.dmImage = StructNew();
	customIcons.Type.dmImage.draft ="pictureDraft";
	customIcons.Type.dmImage.pending ="picturePending";
	customIcons.Type.dmImage.approved ="pictureApproved";
}

if( StructKeyExists( application.types, "dmInclude" ) )
{
	customIcons.Type.dmInclude = StructNew();
	customIcons.Type.dmInclude.draft ="includeDraft";
	customIcons.Type.dmInclude.pending ="includePending";
	customIcons.Type.dmInclude.approved ="includeApproved";
}
/*
if( StructKeyExists( application, "daemon_mediaTypeId" ) )
{
	customIcons.Type[application.daemon_mediaTypeId] = StructNew();
	customIcons.Type[application.daemon_mediaTypeId].draft ="#cimages#/mediaRequest.gif";
	customIcons.Type[application.daemon_mediaTypeId].pending ="#cimages#/mediaPending.gif";
	customIcons.Type[application.daemon_mediaTypeId].approved ="#cimages#/mediaApproved.gif";
}
*/
if( StructKeyExists( application.types, "dmFile" ) )
{
	customIcons.Type.dmFile = StructNew();
	customIcons.Type.dmFile.draft ="fileDraft";
	customIcons.Type.dmFile.pending ="filePending";
	customIcons.Type.dmFile.approved ="fileApproved";
}

if( StructKeyExists( application.types, "dmCSS" ) )
{
	customIcons.Type.dmCSS = StructNew();
	customIcons.Type.dmCSS.draft ="cssDraft";
	customIcons.Type.dmCSS.pending ="cssDraft";
	customIcons.Type.dmCSS.approved ="cssDraft";
}

/* if( StructKeyExists( application, "dmnewsTypeId" ) )
{
	customIcons.Type[application.dmnewsTypeId] = StructNew();
	customIcons.Type[application.dmnewsTypeId].draft ="#cimages#/newsDraft.gif";
	customIcons.Type[application.dmnewsTypeId].pending ="#cimages#/newsDraft.gif";
	customIcons.Type[application.dmnewsTypeId].approved ="#cimages#/newsDraft.gif";
}*/


customIcons.locked = "#cimages#/padlock.gif";
</cfscript>

<cfsetting enablecfoutputonly="No">
