<cfcomponent>
    <cffunction name="findUsersList" access="remote" output="true">
        <cfquery name="showUsers" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_webusers
        </cfquery>
        <cfreturn showUsers>
    </cffunction>
    <cffunction name="userDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="deleteUsers" datasource="cruddb">
            DELETE FROM bookmyticket.moviepanel_webusers WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
        </cfquery>
        <cfset local.message  ="User deleted successfully">
        <cfset local.encryptedMessage = ToBase64(local.message) />
        <cflocation addtoken="no"  url="../admin/manage-users.cfm?aMessages=#local.encryptedMessage#"> 
    </cffunction>
</cfcomponent>
