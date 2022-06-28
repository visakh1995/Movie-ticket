<cfcomponent>
    <cffunction name="movieTicketSignin" access="remote" output="true" returnType="string">
        <cfargument name="username" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfquery name="verifiedDetails" datasource="cruddb">
            SELECT *FROM bookmyticket.moviepanel_users WHERE 
            username = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.username#"> AND
            password = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#local.encodedPassword#"> AND
            status = <cfqueryparam CFSQLType="cf_sql_varchar" value ="admin"> 
        </cfquery>

        <cfif verifiedDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"movieBookCredentials")>
                <cflock timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.movieBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"movieBookCredentials")>
                <cfset Session.movieBookCredentials["id"] = "#verifiedDetails.id#">
                <cfset Session.movieBookCredentials["userName"] = "#verifiedDetails.username#">
                <cfset Session.movieBookCredentials["password"] = "#verifiedDetails.password#">
                <cfset Session.movieBookCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation addtoken="no"  url="../pages/dashboard.cfm"> 
        <cfelse>
            <cfset local.message  ="Invalid username or password">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../auth/signin.cfm?aMessages=#encryptedMessage#">  
        </cfif>

    </cffunction>
</cfcomponent>