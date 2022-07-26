<cfif isDefined("url.selectDate")>
    <cfset selectDate = url.selectDate>
    <cfparam  name="selectDate" default="">
    <cfset dateSelector = createObject("component","movie-ticket/components.webside")> 
    <cfset res = dateSelector.dateMovieSelector(selectDate)>
</cfif>