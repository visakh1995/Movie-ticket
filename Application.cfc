<cfcomponent output="false">
    <cfset this.name="movie-ticket">
    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.sessionManagement  = "true">
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>

    <cfset this.clientManagement="true">
    <cfset this.setClientCookies=true>
    <cfset this.scriptProtect="all">
    <cfset this.datasource="cruddb">    
    <cfset this.serverSideFormValidation = false>
<cffunction 
    name="OnApplicationStart" 
    access="public" 
    returnType="boolean" 
    output="false"
    hint="Fires when the application is first created.">

    <cfreturn true/>
</cffunction>

<cffunction 
    name="OnSessionStart"
    access="public"
    returnType="void"
    output="false"
    hint="Fires when the session is first created">

    <!---setting up cfid/cftoken as cookies,cz session ends on browser close --->
    <cfset session.started = now()>
    <cfif not isDefined("Cookie.CFID")>
        <cflock scope="session" type = "readonly" timeout="5">
            <cfcookie name="CFID" value="#session.CFID#">
            <cfcookie name="CFTOKEN" value="#session.CFTOKEN#">
            <cfset session.SessionStartTime = Now() />
        </cflock>
    </cfif>
</cffunction>

<cffunction 
    name="OnRequestStart"
    access="public"
    returnType="void"
    output="false"
    hint="Fires at first part of page processing.">

    <cfargument
        name="targetPage"
        type="string"
        required="true"
    />
    <cfscript>

        if(!structKeyExists(Session, "movieTicketCredentials")){
            if(findNoCase("/movie-ticket/admin/dashboard.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/cast-crew.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/create-cast.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/create-crew.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/createmovie.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/createmovieshowtime.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/createscreen.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/createshowtime.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/manage-booking.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/manage-contact-info.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/manage-shows.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/manage-users.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/managemovieshowtime.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/modal.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/screens-showtime.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/update-password.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/manageTheaters.cfm",arguments.targetPage) > 0 ){
                writeOutput('<center><h1>Login Required</h1>
                <p>Please Login to your account</p><br>
                <a href="../index.cfm">Click Here</a></center>');
            abort;
            }
        }
    </cfscript>
</cffunction>


<cffunction name="onMissingTemplate">
    <cfargument
        name="targetPage"
        type="string"
        required="true"
    />
    <cfscript>
        writeOutput('<center><h1>This Page is not avilable.</h1>
            <p>Please go back:</p></center>');
    </cfscript>
</cffunction>

<cffunction 
    name="OnRequestEnd"
    access="public"
    returnType="void"
    output="false"
    hint="Fires after the page processing is complete.">
</cffunction>

<cffunction 
    name="OnSessionEnd"
    access="public"
    returnType="void"
    output="false"
    hint="Fires when the session is terminated.">

    <cfargument name="sessionScope" required=true/>
    <cfargument type="String" name="applicationScope" required=true/>
    <cfscript>
        writeOutput('<center>
            <h1>Your session expired. Please login again</h1>
            <a href="index.cfm">Click Here</a>
            </center>');
    </cfscript>
</cffunction>

<cffunction 
    name="OnApplicationEnd"
    access="public"
    returnType="void"
    output="false"
    hint="Fires when the application is terminated.">
</cffunction>

</cfcomponent>