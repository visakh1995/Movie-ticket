<cfcomponent output="false">
    <cfset this.name="movie-ticket">
    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.sessionManagement  = "true">
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>


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
            findNoCase("/movie-ticket/admin/manageTheaters.cfm",arguments.targetPage) > 0 ){
                writeOutput('<center><h1>Login Required</h1>
                <p>Please Login to your account</p><br>
                <a href="../index.cfm">Click Here</a></center>');
            abort;
            }
        }
    </cfscript>
</cffunction>

<cffunction name="onError">
    <cfargument name="Exception" required=true/>
    <cfargument type="String" name="EventName" required=true/>
    <cfscript>
        writeOutput('<center><h1>An error occurred</h1>
        <p>Please Contact the developer</p>
        <p>Error details: #Exception.message#</p></center>');
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