
<cfcomponent extends="types" displayname="dmImage handler " hint="Image objects">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->
<cfproperty name="title" type="string" hint="Image title." required="yes" default=""> 
<cfproperty name="alt" type="string" hint="Alternate text" required="no" default="" > 
<!--- <cfproperty name="caption" type="string" hint="Image Caption" required="no" default="">   --->
<cfproperty name="width" type="string" hint="Image width" required="no" default="">  
<cfproperty name="height" type="string" hint="Image height" required="no" default="">  
<cfproperty name="imagefile" type="string" hint="The image file to be uploaded" required="No" default="">
<cfproperty name="thumbnail" type="string" hint="The name of the thumbnail image to be uploaded" required="no" default="">  
<cfproperty name="optimisedImage" type="string" hint="The name of the optimised image to be uploaded" required="no" default="">  
<cfproperty name="originalImagePath" type="string" hint="The location in the filesystem where the original image is stored." required="No" default=""> 
<cfproperty name="thumbnailImagePath" editHandler="void" type="string" hint="The location in the filesystem where the thumbnail image is stored." required="Yes" default=""> 
<cfproperty name="optimisedImagePath" editHandler="void" type="string" hint="The location in the filesystem where the optimized image is stored." required="Yes" default=""> 

<!--- Object Methods --->

<cffunction name="edit" access="public">
	<cfargument name="objectid" required="yes" type="UUID">
	
	<!--- getData for object edit --->
	<cfset stObj = this.getData(arguments.objectid)>
	
	<cfset stArgs = arguments> <!--- hack to make arguments available to included file --->
	<cfinclude template="_dmImage/edit.cfm">
</cffunction>

<cffunction name="display" access="public" output="true">
	<cfargument name="objectid" required="yes" type="UUID">
	
	<!--- getData for object edit --->
	<cfset stObj = this.getData(arguments.objectid)>
	<cfset stArgs = arguments> <!--- hack to make arguments available to included file --->
	<cfinclude template="_dmImage/display.cfm">
</cffunction>

</cfcomponent>