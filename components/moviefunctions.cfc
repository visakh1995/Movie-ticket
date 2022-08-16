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
                    <cfset Session.movieTicketCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"movieTicketCredentials")>
                <cfset Session.movieTicketCredentials["id"] = "#verifiedDetails.id#">
                <cfset Session.movieTicketCredentials["userName"] = "#verifiedDetails.username#">
                <cfset Session.movieTicketCredentials["password"] = "#verifiedDetails.password#">
                <cfset Session.movieTicketCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation addtoken="no"  url="../admin/dashboard.cfm"> 
        <cfelse>
            <cfset local.message  ="Invalid username or password">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../auth/signin.cfm?aMessages=#encryptedMessage#">  
        </cfif>

    </cffunction>

    <cffunction name="loggedOut" access="remote" output="true">
        <cfset StructDelete(Session, "movieTicketCredentials")>
        <cflocation addtoken="no"  url="../auth/signin.cfm">
    </cffunction>

    <cffunction name="movieTicketCreateForm" access="remote" output="true">
        <cfargument name="theaterName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="phone" type="string" required="true">
        <cfargument name="address" type="string" required="true">
        <cfargument name="street" type="string" required="true">
        <cfargument name="pinCode" type="string" required="true">
        <cfargument name="photo" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.email EQ '' OR NOT isValid("email",arguments.email)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
        </cfif> 
        <cfif arguments.phone EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid phone'/>
        </cfif>
        <cfif arguments.address EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid address'/>
        </cfif>
        <cfif arguments.street EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid street name'/>
        </cfif>
        <cfif arguments.pinCode EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid Pincode'/>
        </cfif>
        <cfif arguments.photo EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid photo'/>
        </cfif>
        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../admin/manageTheaters.cfm?aMessages=#local.encryptedMessage#">
        <cfelse>
            <cfquery name="emailVerify" datasource="cruddb">
                SELECT *FROM bookmyticket.moviepanel_teaters WHERE theaterEmail = "#arguments.email#";
            </cfquery>
            <cfquery name="phoneVerify" datasource="cruddb">
                SELECT *FROM bookmyticket.moviepanel_teaters WHERE theaterPhone = "#arguments.phone#";
            </cfquery>
            <cfif emailVerify.RecordCount NEQ 0>
                <cfset local.aErrorMessages = 'The email already registered'/>
                <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
                <cflocation addtoken="no"  url="../admin/manageTheaters.cfm?aMessages=#local.encryptedMessage#">
            </cfif> 
            <cfif phoneVerify.RecordCount NEQ 0>
                <cfset local.aErrorMessages = 'The phone already registered'/>
                <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
                <cflocation addtoken="no"  url="../admin/manageTheaters.cfm?aMessages=#local.encryptedMessage#">
            </cfif> 
            <cffile action="upload"
            fileField="photo"
            nameconflict="overwrite"
            destination="C:\coldFusion2021\cfusion\wwwroot\movie-ticket\uploads\">

            <cfset local.imageValue = #cffile.serverFile#>
            <cfparam name="arguments.theaterName" default="">
            <cfparam name="arguments.email" default="">
            <cfparam name="arguments.phone" default="">
            <cfparam name="arguments.address" default="">
            <cfparam name="arguments.street" default="">
            <cfparam name="arguments.pinCode" default="">
            <cfparam name="imageValue" default="">
            <cfparam name="arguments.status" default="1">

            <cfquery name="addData" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_teaters(theaterName,theateremail,theaterphone,theaterPhoto,
                theateraddress,
                theaterStreet,theaterPincode,theaterStatus)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.theaterName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.email#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.phone#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#imageValue#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.address#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.street#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.pinCode#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Theater created successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/manageTheaters.cfm?aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="findTheatreList" access="remote" output="true">
        <cfquery name="showTheatres" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_teaters
        </cfquery>
        <cfreturn showTheatres>
    </cffunction>

    <cffunction name="movieTheatreDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="deleteData" datasource="cruddb">
            DELETE FROM bookmyticket.moviepanel_teaters WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
        </cfquery>
        <cfset local.message  ="Theater deleted successfully">
        <cfset local.encryptedMessage = ToBase64(local.message) />
        <cflocation addtoken="no"  url="../admin/manageTheaters.cfm?aMessages=#local.encryptedMessage#"> 
    </cffunction>

    <cffunction name="editTheaterInfo" access="remote" returnFormat = "json">
        <cfargument name="theatre_id" type="string" required="yes">
        <cfquery name="fetchData" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_teaters WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.theatre_id#">
        </cfquery>
        <cfreturn fetchData> 
    </cffunction>

    <cffunction name="updateTheaterInfo" access="remote">
    
        <cfargument name="TheaterId" type="string" required="true">
        <cfargument name="theaterName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="phone" type="string" required="true">
        <cfargument name="address" type="string" required="true">
        <cfargument name="street" type="string" required="true">
        <cfargument name="pinCode" type="string" required="true">
        <cfargument name="photo" type="string" required="true">
        <cfargument name="defaultPhoto" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.email EQ '' OR NOT isValid("email",arguments.email)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
        </cfif> 
        <cfif arguments.phone EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid phone'/>
        </cfif>
        <cfif arguments.address EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid address'/>
        </cfif>
        <cfif arguments.street EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid street name'/>
        </cfif>
        <cfif arguments.pinCode EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid Pincode'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages)/>
            <cflocation addtoken="no"  url="../admin/manageTheaters.cfm?aMessages=#local.encryptedMessage#">
        <cfelse> 
            <cfparam name="arguments.theaterName" default="">
            <cfparam name="arguments.email" default="">
            <cfparam name="arguments.phone" default="">
            <cfparam name="arguments.address" default="">
            <cfparam name="arguments.street" default="">
            <cfparam name="arguments.pinCode" default="">
            <cfparam name="imageValue" default="">
            <cfparam name="arguments.status" default="1">
            <cfparam name="Session.movieTicketCredentials.id" default="Not Authenticated">

            <cfif len(trim(arguments.photo)) NEQ 0>
                <cffile action="upload"
                fileField="photo"
                nameconflict="overwrite"
                destination="C:\coldFusion2021\cfusion\wwwroot\movie-ticket\uploads\">
                <cfset local.imageUpdatedValue = #cffile.serverFile#>
            <cfelse>
                <cfset local.imageUpdatedValue = #arguments.defaultPhoto#>
            </cfif>
            <cfquery name="updateData" datasource="cruddb">
                UPDATE bookmyticket.moviepanel_teaters SET 
                    theaterName = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.theaterName#">,
                    theaterEmail =<cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.email#">,
                    theaterPhone = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.phone#">,
                    theaterAddress = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.address#">,
                    theaterStreet = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.street#">,
                    theaterPincode = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.pinCode#">,
                    theaterPhoto = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.imageUpdatedValue#">,
                    theaterStatus = <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                WHERE id = "#arguments.TheaterId#"
            </cfquery>
            <cfset local.message  ="Theater updated successfully">
            <cfset local.encryptedMessage = ToBase64(local.message)/>
            <cflocation addtoken="no"  url="../admin/manageTheaters.cfm?aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <!--- manage screen and show time --->
    <cffunction name="movieTicketCreateScreenForm" access="remote" output="true">
        <cfargument name="theatreId" type="string" required="true">
        <cfargument name="screenName" type="string" required="true">
        <cfargument name="silverRate" type="string" required="true">
        <cfargument name="goldRate" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.screenName EQ ''>
            <cfset local.aErrorMessages = 'Please provide screen name'/>
        </cfif>
        <cfif arguments.silverRate EQ ''>
            <cfset local.aErrorMessages = 'Please provide silver rate'/>
        </cfif>
        <cfif arguments.goldRate EQ ''>
            <cfset local.aErrorMessages = 'Please provide gold rate'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?aMessages=#local.encryptedMessage#">
        <cfelse>
            <cfparam name="arguments.screenName" default="">
            <cfparam name="arguments.theatreId" default="">
            <cfparam name="arguments.silverRate" default="">
            <cfparam name="arguments.goldRate" default="">
            <cfparam name="arguments.status" default="1">

            <cfquery name="addScreen" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_screens(
                    theatreId,
                    screenName,
                    silverRate,
                    goldRate,
                    screenStatus)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.theatreId#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.screenName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.silverRate#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.goldRate#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Screen created successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?theatreValue=#arguments.theatreId#&aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="findScreensList" access="public">
        <cfargument name="teatreId" type="string" required="yes">
        <cfquery name="screenList" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_screens 
            WHERE theatreId = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.teatreId#">
        </cfquery>
        <cfreturn screenList>
    </cffunction>

    <cffunction name="theatreScreenDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="findTheaterId" datasource="cruddb">
            SELECT *FROM bookmyticket.moviepanel_screens WHERE id = "#arguments.deleteId#";
        </cfquery>
        <cfif findTheaterId.RecordCount NEQ 0>
            <cfset TheatreId = "#findTheaterId.theatreId#">
            <cfquery name="deleteScreen" datasource="cruddb">
                DELETE FROM bookmyticket.moviepanel_screens WHERE 
                id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
            </cfquery>
            <cfset local.message  ="Screen deleted successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?theatreValue=#TheatreId#&aMessages=#local.encryptedMessage#"> 
        </cfif> 
    </cffunction>

    <cffunction name="editSceenInfo" access="remote" returnFormat = "json">
        <cfargument name="screen_id" type="string" required="yes">
        <cfquery name="fetchScreenData" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_screens WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.screen_id#">
        </cfquery>
        <cfreturn fetchScreenData> 
    </cffunction>

    <cffunction name="movieTicketUpdateScreenForm" access="remote">
        <cfargument name="theatreId" type="string" required="true">
        <cfargument name="screenId" type="string" required="true">
        <cfargument name="screenName" type="string" required="true">
        <cfargument name="silverRate" type="string" required="true">
        <cfargument name="goldRate" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.screenName EQ ''>
            <cfset local.aErrorMessages = 'Please provide screen name'/>
        </cfif>
        <cfif arguments.silverRate EQ ''>
            <cfset local.aErrorMessages = 'Please provide silver rate'/>
        </cfif>
        <cfif arguments.goldRate EQ ''>
            <cfset local.aErrorMessages = 'Please provide gold rate'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages)/>
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?aMessages=#local.encryptedMessage#">
        <cfelse> 
            <cfparam name="arguments.screenName" default="">
            <cfparam name="arguments.screenId" default="">
            <cfparam name="arguments.theatreId" default="">
            <cfparam name="arguments.silverRate" default="">
            <cfparam name="arguments.goldRate" default="">
            <cfparam name="arguments.status" default="1">

            <cfquery name="updateData" datasource="cruddb">
                UPDATE bookmyticket.moviepanel_screens SET 
                theatreId = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.theatreId#">,
                screenName = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.screenName#">,
                silverRate =<cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.silverRate#">,
                goldRate = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.goldRate#">,
                screenStatus = <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                WHERE id = "#arguments.screenId#"
            </cfquery>

            <cfset local.message  ="Screen updated successfully">
            <cfset local.encryptedMessage = ToBase64(local.message)/>
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?theatreValue=#arguments.theatreId#&aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <!---  show screen time --->
    <cffunction name="movieTicketCreateShowTime" access="remote" output="true">
        <cfargument name="theatreId" type="string" required="true">
        <cfargument name="showName" type="string" required="true">
        <cfargument name="screen" type="integer" required="true">
        <cfargument name="showStartTime" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.showName EQ ''>
            <cfset local.aErrorMessages = 'Please provide show name'/>
        </cfif>
        <cfif arguments.screen EQ ''>
            <cfset local.aErrorMessages = 'Please select your screen'/>
        </cfif>
        <cfif arguments.showStartTime EQ ''>
            <cfset local.aErrorMessages = 'Please provide your show time'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?theatreValue=#arguments.theatreId#&aMessagesShow=#local.encryptedMessage#">
        <cfelse>
            <cfparam name="arguments.theatreId" default="">
            <cfparam name="arguments.showName" default="">
            <cfparam name="arguments.screen" default="">
            <cfparam name="arguments.showStartTime" default="1">

            <cfquery name="addShowTime" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_showtimes(
                    teatreId,
                    showName,
                    screen,
                    showStartTime,
                    showTimeStatus)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.theatreId#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.showName#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value ="#arguments.screen#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.showStartTime#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Show time created successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?theatreValue=#arguments.theatreId#&aMessageSuccessShow=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>
    
    <cffunction name="findShowTimesList" access="remote" output="true" returnFormat = "json">
        <cfargument  name="teatreId" type="integer">
        <cfquery name="showTimesList" datasource="cruddb" result="res" returntype="array">
            SELECT st.id, st.screen,s.screenName, st.teatreId,st.showStartTime,st.showName
            FROM bookmyticket.moviepanel_showtimes st
            INNER JOIN bookmyticket.moviepanel_screens s ON s.id = st.screen
        WHERE 
        st.teatreId= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.teatreId#">
        </cfquery>
        <cfreturn showTimesList>
    </cffunction>

    <cffunction name="editShowTimeInfo" access="remote" returnFormat = "json">
        <cfargument name="showTime_id" type="string" required="yes">
        <cfquery name="fetchShowTimeData" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_showtimes WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.showTime_id#">
        </cfquery>
        <cfreturn fetchShowTimeData> 
    </cffunction>

    <cffunction name="movieTicketUpdateShowTime" access="remote">
        <cfargument name="theatreId" type="string" required="true">
        <cfargument name="showId" type="string" required="true">
        <cfargument name="showName" type="string" required="true">
        <cfargument name="screen" type="integer" required="true">
        <cfargument name="showStartTime" type="string" required="true">
 
        <cfset local.aErrorMessages =  "">
        <cfif arguments.showName EQ ''>
            <cfset local.aErrorMessages = 'Please select show name'/>
        </cfif>
        <cfif arguments.screen EQ ''>
            <cfset local.aErrorMessages = 'Please select your screen'/>
        </cfif>
        <cfif arguments.showStartTime EQ ''>
            <cfset local.aErrorMessages = 'Please provide your show time'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages)/>
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?theatreValue=#arguments.theatreId#&aMessagesShow=#local.encryptedMessage#">
        <cfelse> 
            <cfparam name="arguments.theatreId" default="">
            <cfparam name="arguments.showId" default="">
            <cfparam name="arguments.showName" default="">
            <cfparam name="arguments.screen" default="">
            <cfparam name="arguments.showStartTime" default="1">


            <cfquery name="updateData" datasource="cruddb">
                UPDATE bookmyticket.moviepanel_showtimes SET 
                teatreId = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.theatreId#">,
                showName = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.showName#">,
                screen =<cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.screen#">,
                showStartTime = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.showStartTime#">,
                showTimeStatus = <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                WHERE id = "#arguments.showId#"
            </cfquery>

            <cfset local.message  ="Screen updated successfully">
            <cfset local.encryptedMessage = ToBase64(local.message)/>
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?theatreValue=#arguments.theatreId#&aMessageSuccessShow=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="theatreShowTimeDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="findTheaterId" datasource="cruddb">
            SELECT *FROM bookmyticket.moviepanel_showtimes WHERE id = "#arguments.deleteId#";
        </cfquery>
        <cfif findTheaterId.RecordCount NEQ 0>
            <cfset TheatreId = findTheaterId.teatreId>
            <cfquery name="deleteShowTime" datasource="cruddb">
                DELETE FROM bookmyticket.moviepanel_showtimes WHERE 
                id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
            </cfquery>
            <cfset local.message  ="Show Time deleted successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/screens-showtime.cfm?theatreValue=#TheatreId#&aMessagesShow=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="findAllScreensList" access="public">
        <cfquery name="screenList" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_screens 
        </cfquery>
        <cfreturn screenList>
    </cffunction>

    <cffunction name="findAllMoviesList" access="public">
        <cfquery name="movieList" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_movies
        </cfquery>
        <cfreturn movieList>
    </cffunction>

    <cffunction name="findJoinList" access="public">
        <cfquery name="allJoinList" datasource="cruddb">
            SELECT sh.id,m.poster,m.movieName,th.theaterName,m.releaseDate,m.duration,
            s.screenName,st.showStartTime,st.showName,sh.endDate,sh.showPriority
            FROM bookmyticket.moviepanel_movieshowtimes sh
            INNER JOIN bookmyticket.moviepanel_movies m ON sh.movie =m.id
            INNER JOIN bookmyticket.moviepanel_teaters th ON sh.theater=th.id 
            INNER JOIN bookmyticket.moviepanel_screens s ON sh.screen=s.id
            INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.showName =st.id
        </cfquery>
        <cfreturn allJoinList>
    </cffunction>

    <cffunction name="updateWebPassword" access="remote" output="true"> 
        <cfargument name="oldPassword" type="string" required="true">
        <cfargument name="newPassword" type="string" required="true">
        <cfargument name="confirmPassword" type="string" required="true">

        <cfset local.encodOldPassword = hash("#arguments.oldPassword#", "SHA-256", "UTF-8")>
        <cfset local.encodNewPassword = hash("#arguments.newPassword#", "SHA-256", "UTF-8")>

        <cfset local.aErrorMessages =  "">
        <cfif arguments.oldPassword EQ ''>
            <cfset local.aErrorMessages = 'Please fill old password'/>
        </cfif>
        <cfif arguments.newPassword EQ ''>
            <cfset local.aErrorMessages = 'Please fill new Password'/>
        </cfif>
        <cfif arguments.confirmPassword EQ ''>
            <cfset local.aErrorMessages = 'Please fill confirmPassword'/>
        </cfif>
        <cfif arguments.newPassword NEQ confirmPassword>
            <cfset local.aErrorMessages = 'password donot match'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../web/update_password.cfm?aMessages=#local.encryptedMessage#">
        <cfelse>

            <cfquery name="verifiedUserDetails" datasource="cruddb">
                SELECT *FROM bookmyticket.moviepanel_webusers WHERE 
                password = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#local.encodOldPassword#"> AND
                email = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#local.encodOldPassword#"> 
            </cfquery>

            <cfif verifiedUserDetails.RecordCount gt 0>
                <cfquery name="update_pass" datasource="cruddb" result="pass_res">
                    UPDATE bookmyticket.moviepanel_users SET 
                    password=<cfqueryparam value="#encodNewPassword#" cfsqltype="CF_SQL_VARCHAR">
                    WHERE status="admin"
                </cfquery>
                <cfset local.message  ="Password updated successfully">
                <cfset local.encryptedMessage = ToBase64(local.message) />
                <cflocation addtoken="no"  url="../admin/updatepassword.cfm?aMessages=#encryptedMessage#"> 
            <cfelse>
                <cfset local.message  ="Inavalid old password,please try again">
                <cfset local.encryptedMessage = ToBase64(local.message) />
                <cflocation addtoken="no"  url="../admin/updatepassword.cfm?aMessages=#encryptedMessage#">  
            </cfif>
        </cfif>
    </cffunction>

    <cffunction name="fetchScreenDetails" access="remote" output="true" returnFormat = "json">
        <cfargument  name="theatre_id" type="integer">
        <cfquery name="screen_details"  result="res" returntype="array" >
            SELECT * FROM bookmyticket.moviepanel_screens
            WHERE theatreId=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">;
        </cfquery>
        <cfreturn screen_details>
    </cffunction>

    <cffunction name="fetchScreenTimeDetails" access="remote" output="true" returnFormat = "json">
        <cfargument  name="theatre_id" type="integer">
        <cfargument  name="screen_id" type="integer">
        <cfquery name="time_details"  result="res" returntype="array"  datasource="cruddb">
            SELECT st.id, st.screen,s.screenName,st.teatreId,st.showName,st.showStartTime
            FROM bookmyticket.moviepanel_showtimes st
            INNER JOIN bookmyticket.moviepanel_screens s ON s.id = st.screen
        WHERE 
        st.teatreId= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.theatre_id#"> AND
        st.screen=<cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.screen_id#">
        </cfquery>
        <cfreturn time_details>
    </cffunction> 

    <cffunction name="findMovieCount" access="remote" output="true">
        <cfquery name ="movieCount" result ="result" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_movies;
        </cfquery>
        <cfreturn movieCount.recordCount>
    </cffunction>

    <cffunction name="findTheaterCount" access="remote" output="true">
        <cfquery name ="theaterCount" result ="result" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_teaters;
        </cfquery>
        <cfreturn theaterCount.recordCount>
    </cffunction>

    <cffunction name="findUserCount" access="remote" output="true">
        <cfquery name ="userCount" result ="result" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_webusers;
        </cfquery>
        <cfreturn userCount.recordCount>
    </cffunction>

    <cffunction name="findBookingCount" access="remote" output="true">
        <cfquery name ="bookingCount" result ="result" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_reservation WHERE
             bookingStatus = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="PAYMENTED">
        </cfquery>
        <cfreturn bookingCount.recordCount>
    </cffunction>






</cfcomponent>

