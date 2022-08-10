<cfif isDefined("url.selectDate")>
    <cfset selectDate = url.selectDate>
    <cfparam  name="selectDate" default="">
    <cfset dateSelector = createObject("component","movie-ticket/components.webside")> 
    <cfset res = dateSelector.dateMovieSelector(selectDate)>
</cfif>
<cfif isDefined("url.movieShowId")>
    <cfset movieShowId = url.movieShowId>
    <cfset dateSelector = createObject("component","movie-ticket/components.webside")> 
    <cfset res = dateSelector.authorizeRelocation(movieShowId)>
</cfif>

<cfif isDefined("url.urlWebSignout")>
    <cfset signOut = url.urlWebSignout>
    <cfset signouts = createObject("component","movie-ticket/components.webside")> 
    <cfset res = signouts.webUserSignout()>
</cfif>

