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
<cfif isDefined("url.movieDelete")>
    <cfset deleteId = url.movieDelete>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","movie-ticket/components.movies")> 
    <cfset res = deleteDirectory.movieDelete(deleteId)>
</cfif>
<cfif isDefined("url.castDelete")>
    <cfset deleteId = url.castDelete>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","movie-ticket/components.movies")> 
    <cfset res = deleteDirectory.castDelete(deleteId)>
</cfif>
<cfif isDefined("url.crewDelete")>
    <cfset deleteId = url.crewDelete>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","movie-ticket/components.movies")> 
    <cfset res = deleteDirectory.crewDelete(deleteId)>
</cfif>
<cfif isDefined("url.movieShowTimeDelete")>
    <cfset deleteId = url.movieShowTimeDelete>
    <cfparam  name="deleteId" default="">
    <cfset deleteDirectory = createObject("component","movie-ticket/components.movies")> 
    <cfset res = deleteDirectory.movieShowTimeDelete(deleteId)>
</cfif>




