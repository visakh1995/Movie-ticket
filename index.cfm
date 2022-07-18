<cfif NOT isDefined("Session.movieTicketCredentials")>
	<cflocation url="./auth/signin.cfm" addtoken="no" /> 
<cfelse>
    <cflocation url="./admin/dashboard.cfm" addtoken="no" /> 
</cfif>