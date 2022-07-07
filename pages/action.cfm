<cfif isDefined("url.teatreDelete")>
    <cfset deleteId = url.teatreDelete>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","movie-ticket/components.moviefunctions")> 
    <cfset res = deleteDirectory.movieTheatreDelete(deleteId)>
</cfif>
<cfif isDefined("url.screenDelete")>
    <cfset deleteId = url.screenDelete>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","movie-ticket/components.moviefunctions")> 
    <cfset res = deleteDirectory.theatreScreenDelete(deleteId)>
</cfif>
<cfif isDefined("url.showTimeDelete")>
    <cfset deleteId = url.showTimeDelete>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","movie-ticket/components.moviefunctions")> 
    <cfset res = deleteDirectory.theatreShowTimeDelete(deleteId)>
</cfif>