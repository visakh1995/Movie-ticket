<cfif isDefined("url.delete")>
    <cfset deleteId = url.delete>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","movie-ticket/components.moviefunctions")> 
    <cfset res = deleteDirectory.movieTheatreDelete(deleteId)>
</cfif>