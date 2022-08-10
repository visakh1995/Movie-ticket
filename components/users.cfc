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
    <cffunction name="saveContacts" access="remote" output="true">
      
        <cfargument name="name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="subject" type="string" required="true">
        <cfargument name="message" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.name EQ ''>
            <cfset local.aErrorMessages = 'Please provide name field'/>
        </cfif>
        <cfif arguments.email EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid email'/>
        </cfif>
        <cfif arguments.subject EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid subject'/>
        </cfif>
        <cfif arguments.message EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid message'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../web/contact-us.cfm?aMessages=#local.encryptedMessage#">
        <cfelse>
            <cfparam name="arguments.name" default="">
            <cfparam name="arguments.email" default="">
            <cfparam name="arguments.subject" default="">
            <cfparam name="arguments.message" default="">
            <cfset local.submitdate = dateFormat(Now())>

            <cfquery name="addContact" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_contacts(name,email,subject,message,submitDate)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.name#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.email#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.subject#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.message#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.submitdate#">

                )
            </cfquery>
            <cfset local.message  ="data successfully submitted">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../web/contact-us.cfm?aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>
    <cffunction name="findContactsList" access="remote" output="true">
        <cfquery name="showContacts" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_contacts
        </cfquery>
        <cfreturn showContacts>
    </cffunction>

    <cffunction name="findUsersBookingList" access="remote">
        <cfquery name="showBookingUsersDetail" result = result datasource="cruddb">
            SELECT sh.id,m.poster,m.movieName,th.theaterName,st.showStartTime,st.showName,
            wb.userName,wb.email,rs.totalPrice,rs.ticketCount,rs.bookingTime,rs.id as reservId
            FROM bookmyticket.moviepanel_movieshowtimes sh
            INNER JOIN bookmyticket.moviepanel_movies m ON sh.movie = m.id
            INNER JOIN bookmyticket.moviepanel_teaters th ON sh.theater = th.id 
            INNER JOIN bookmyticket.moviepanel_screens s ON sh.screen= s.id
            INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.showName = st.id
            INNER JOIN bookmyticket.moviepanel_reservation rs ON sh.id = rs.movieShowTimeId
            INNER JOIN bookmyticket.moviepanel_webusers wb ON rs.userId = wb.id
            WHERE rs.bookingStatus = <cfqueryparam  CFSQLType = "cf_sql_varchar" value="PAYMENTED">
        </cfquery>
        <cfreturn showBookingUsersDetail>
    </cffunction>

    

</cfcomponent>
