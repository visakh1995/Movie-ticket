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
<!--- <!---      ---> --->
<cffunction name="teatreCreateContactForm" access="remote" output="true">
    <cfargument name="title" type="string" required="true">
    <cfargument name="name" type="string" required="true">
    <cfargument name="email" type="string" required="true">
    <cfargument name="dob" type="string" required="true">
    <cfargument name="photo" type="string" required="true">
    <cfargument name="address" type="string" required="true">
    <cfargument name="pinCode" type="string" required="true">
    <cfargument name="street" type="string" required="true">
    <cfargument name="phone" type="string" required="true">

    <cfset local.aErrorMessages =  "">
    <cfif arguments.title EQ ''>
        <cfset local.aErrorMessages = 'Please provide your title'/>
    </cfif>
    <cfif arguments.email EQ '' OR NOT isValid("email",arguments.email)>
        <cfset local.aErrorMessages = 'Please provide valid email ID'/>
     </cfif>
    <cfif arguments.lastName EQ ''> 
    <cfset local.aErrorMessages = 'Please provide valid last name'/>
    </cfif> 
    <cfif arguments.dob EQ ''>
        <cfset local.aErrorMessages = 'Please provide valid dob'/>
    </cfif>
    <cfif arguments.photo EQ ''>
        <cfset local.aErrorMessages = 'Please provide valid photo'/>
    </cfif>
    <cfif arguments.address EQ ''>
        <cfset local.aErrorMessages = 'Please provide valid address'/>
    </cfif>
    <cfif arguments.pinCode EQ ''>
        <cfset local.aErrorMessages = 'Please provide valid Pincode'/>
    </cfif>
    <cfif arguments.street EQ ''>
        <cfset local.aErrorMessages = 'Please provide valid street name'/>
    </cfif>
    <cfif arguments.phone EQ ''>
        <cfset local.aErrorMessages = 'Please provide valid phone'/>
    </cfif>
    <cfif len(trim(local.aErrorMessages)) NEQ 0>
        <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
        <cflocation addtoken="no"  url="../pages/dashboard.cfm?aMessages=#local.encryptedMessage#">
    <cfelse>
        <cfquery name="emailVerify">
            SELECT *FROM coldfusiion.moviebookcontacts WHERE email = "#arguments.email#";
        </cfquery>
        <cfquery name="phoneVerify">
            SELECT *FROM coldfusiion.moviebookcontacts WHERE photo = "#arguments.phone#";
        </cfquery>
        <cfif emailVerify.RecordCount NEQ 0>
            <cfset local.aErrorMessages = 'The email already registered'/>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../pages/dashboard.cfm?aMessages=#local.encryptedMessage#">
        </cfif> 
        <cfif phoneVerify.RecordCount NEQ 0>
            <cfset local.aErrorMessages = 'The phone already registered'/>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../pages/dashboard.cfm?aMessages=#local.encryptedMessage#">
        </cfif> 
        <cffile action="upload"
        fileField="photo"
        nameconflict="overwrite"
        destination="C:\coldFusion2021\cfusion\wwwroot\ADDRESSBOOK\uploads\">

        <cfset local.imageValue = #cffile.serverFile#>
        <cfparam name="arguments.title" default="">
        <cfparam name="arguments.Name" default="">
        <cfparam name="arguments.email" default="">
        <cfparam name="arguments.dob" default="">
        <cfparam name="arguments.address" default="">
        <cfparam name="arguments.pinCode" default="">
        <cfparam name="arguments.street" default="">
        <cfparam name="arguments.phone" default="">
        <cfparam name="imageValue" default="">
        <cfparam name="arguments.status" default="1">

        <cfparam name="Session.addressBookCredentials.id" default="Not Authenticated">
        <cfquery name="addData" result = result>
            INSERT INTO coldfusiion.adbookcontacts(userId,title,firstName,lastName,email,gender,dob,
            photo,address,phone,street,pincode,status)
            VALUES(
                <cfqueryparam  CFSQLType="cf_sql_integer" value="#Session.movieBookCredentials.id#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.title#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.name#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.email#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.checks#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.dob#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#imageValue#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.address#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.phone#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.street#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.pinCode#">,
                <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
            )
        </cfquery>
        <cfset local.message  ="Contact created successfully">
        <cfset local.encryptedMessage = ToBase64(local.message) />
        <cflocation addtoken="no"  url="../pages/dashboard.cfm?aMessageSuccess=#local.encryptedMessage#"> 
    </cfif>
</cffunction>

</cfcomponent>