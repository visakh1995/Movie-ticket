<cfcomponent>
    <cffunction name="comingSoonMovies" access="remote" output="true">
        <cfquery name="comingSoonByDates" datasource="cruddb">
            SELECT sm.id, sm.movieName,sm.releaseDate,sm.movieFormat,sm.genre,sm.language,sm.duration,sm.poster,s.movie
            FROM bookmyticket.moviepanel_movies sm
            INNER JOIN bookmyticket.moviepanel_movieshowtimes s ON s.movie = sm.id
            WHERE sm.releaseDate >= CURDATE() GROUP BY sm.movieName; 
        </cfquery>
        <cfreturn comingSoonByDates>
    </cffunction>

    <cffunction name="nowShowingMovies" access="remote" output="true">
        <cfquery name="nowShowingMovies" datasource="cruddb">
            SELECT sm.id,sm.movieName,sm.releaseDate,sm.movieFormat,sm.genre,sm.language,sm.duration,sm.poster,s.movie
            FROM bookmyticket.moviepanel_movies sm
            INNER JOIN bookmyticket.moviepanel_movieshowtimes s ON s.movie = sm.id
            WHERE CURDATE() BETWEEN sm.releaseDate AND s.endDate GROUP BY sm.movieName; 
        </cfquery>
        <cfreturn nowShowingMovies>
    </cffunction>

    <cffunction name="frontEndShowAllMovies" access="remote" output="true">
        <cfquery name="allShowingMovies" datasource="cruddb">
            SELECT sm.id,sm.movieName,sm.releaseDate,sm.movieFormat,sm.genre,sm.language,sm.duration,sm.poster,s.movie
            FROM bookmyticket.moviepanel_movies sm
            INNER JOIN bookmyticket.moviepanel_movieshowtimes s ON s.movie = sm.id GROUP BY sm.movieName;
        </cfquery>
        <cfreturn allShowingMovies>
    </cffunction>

    <cffunction name="webMovieDetailsById" access="remote" returnFormat = "json">
        <cfargument name="movieId" type="string" required="yes">
        <cfquery name="fetchShowData" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_movies WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.movieId#">
        </cfquery>
        <cfreturn fetchShowData> 
    </cffunction>

    <cffunction name="webMovieCastById" access="remote" returnFormat = "json">
        <cfargument name="movieId" type="string" required="yes">
        <cfquery name="fetchShowCasts" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_casts WHERE 
            movieId = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.movieId#">
        </cfquery>
        <cfreturn fetchShowCasts> 
    </cffunction>

    <cffunction name="webMovieCrewById" access="remote" returnFormat = "json">
        <cfargument name="movieId" type="string" required="yes">
        <cfquery name="fetchShowCrews" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_crews WHERE 
            movieId = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.movieId#">
        </cfquery>
        <cfreturn fetchShowCrews> 
    </cffunction>

    <cffunction name="webMovieSchedulesById" access="public">
        <cfargument name="movieId" type="string" required="yes">
        <cfquery name="allScheduledList" datasource="cruddb">
            SELECT sh.id,sh.theater,m.poster,m.movieName,m.genre,th.theaterName,m.releaseDate,m.duration,
            s.screenName,st.showStartTime,st.showName,sh.endDate,sh.showPriority
            FROM bookmyticket.moviepanel_movieshowtimes sh
            INNER JOIN bookmyticket.moviepanel_movies m ON sh.movie =m.id
            INNER JOIN bookmyticket.moviepanel_teaters th ON sh.theater=th.id 
            INNER JOIN bookmyticket.moviepanel_screens s ON sh.screen=s.id
            INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.showName =st.id
            WHERE m.id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.movieId#">
            -- GROUP BY th.theaterName
        </cfquery>
        <cfreturn allScheduledList>
    </cffunction>

    <cffunction name="webMovieScheduleTimesById" access="remote" returnFormat = "json">
        <cfargument name="theaterId" type="string" required="yes">
        <cfargument name="movieId" type="string" required="yes">
        <cfquery name="fetchShowTimes" datasource="cruddb">
            SELECT s.id, s.movie,s.theater,st.showName,st.showStartTime
            FROM bookmyticket.moviepanel_movieshowtimes s
            INNER JOIN bookmyticket.moviepanel_showtimes st ON s.theater = st.teatreId
            WHERE s.movie =  <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.movieId#"> 
            AND st.teatreId =  <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.theaterId#">
        </cfquery>
        <cfreturn fetchShowTimes> 
    </cffunction>

    <cffunction name="dateMovieSelector" access="remote" returnFormat = "json">
        <cfargument name="selectDate" type="string" required="yes">
        <cfset local.selDate = #dateFormat(arguments.selectDate,"yyyy-mm-dd")#>      
        <cfquery name="show_details" datasource="cruddb" result="show_data">
            SELECT DISTINCT
                m.movieName,sh.id,m.poster,m.trailerUrl,
                m.language,m.releaseDate,m.description,
                m.duration,sh.totalSeats,            
                sh.endDate,sh.showPriority,
                sh.id,m.genre,
                th.theaterName,                  
                s.screenName,st.showStartTime,
                st.showName,m.id as m_id,th.id as t_id,s.id as s_id,st.id as st_id
            FROM bookmyticket.moviepanel_movieshowtimes sh
            INNER JOIN bookmyticket.moviepanel_movies m ON sh.movie =m.id
            INNER JOIN bookmyticket.moviepanel_teaters th ON sh.theater=th.id 
            INNER JOIN bookmyticket.moviepanel_screens s ON sh.screen=s.id
            INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.showName =st.id
            WHERE m.releaseDate < <cfqueryparam value="#local.selDate#" cfsqltype="cf_sql_date"> 
            AND  sh.endDate > <cfqueryparam value="#local.selDate#" cfsqltype="cf_sql_date">
            OR sh.endDate = <cfqueryparam value="#local.selDate#" cfsqltype="cf_sql_date">   
            OR  m.releaseDate = <cfqueryparam value="#local.selDate#" cfsqltype="cf_sql_date">         
            ORDER BY m.movieName
        </cfquery>  
    <cfreturn show_details> 
    </cffunction>

    <cffunction name="authorizeRelocation" access="remote">
        <cfargument name="movieShowId" type="string" required="yes">
        <cfif isDefined("Session.UsermovieTicketCredentials")>
            <cflocation addtoken="no" url="../web/seat-selection.cfm?moviesShowId=#arguments.movieShowId#">
        <cfelse>
            <cflocation addtoken="no" url="../web/user-signin.cfm">
        </cfif> 
    </cffunction>

    <!---Authorization --->

    <cffunction name="UserMovieTicketSignin" access="remote" output="true" returnType="string">
        <cfargument name="email" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfquery name="userVerifiedDetails" datasource="cruddb">
            SELECT *FROM bookmyticket.moviepanel_webusers WHERE 
            email = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.email#"> AND
            password = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#local.encodedPassword#"> AND
            role = <cfqueryparam CFSQLType="cf_sql_varchar" value ="user"> 
        </cfquery>

        <cfif userVerifiedDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"UsermovieTicketCredentials")>
                <cflock timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.UsermovieTicketCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"UsermovieTicketCredentials")>
                <cfset Session.UsermovieTicketCredentials["id"] = "#userVerifiedDetails.id#">
                <cfset Session.UsermovieTicketCredentials["email"] = "#userVerifiedDetails.email#">
                <cfset Session.UsermovieTicketCredentials["password"] = "#userVerifiedDetails.password#">
                <cfset Session.UsermovieTicketCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation addtoken="no"  url="../web/seat-selection.cfm"> 
        <cfelse>
            <cfset local.message  ="Invalid username or password">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../web/user-signin.cfm?aMessages=#encryptedMessage#">  
        </cfif>

    </cffunction>

    <cffunction  name="UserMovieTicketSignup" access="remote" output="true" returnType="string">

        <cfargument  name="email" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfargument  name="confirmPassword" type="string" required="yes">
        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfset local.aErrorMessages =  "">
        <cfif arguments.email EQ '' OR NOT isValid("email",arguments.email)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
         </cfif>
        <cfif arguments.password EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid password'/>
        </cfif>
        <cfif arguments.confirmPassword EQ ''>
            <cfset local.aErrorMessages = 'Confirm password field cant be empty'/>
        </cfif>
        <cfif arguments.confirmPassword NEQ arguments.password>
            <cfset local.aErrorMessages = 'password does not match!'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../web/user-signup.cfm?aMessages=#local.encryptedMessage#">
        <cfelse>
   
            <cfparam name="arguments.email" default="">
            <cfparam name="arguments.password" default="">
            <cfparam name="arguments.confirmPassword" default="">

            <cfquery name="emailVerify" datasource="cruddb">
                SELECT *FROM bookmyticket.moviepanel_webusers WHERE email = "#arguments.email#";
            </cfquery>

            <cfif emailVerify.RecordCount neq 0>
                <cfset local.aErrorMessages = 'The email already registered'/>
                <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
                <cflocation addtoken="no"  url="../web/user-signup.cfm?aMessages=#local.encryptedMessage#">
            </cfif> 

            <cfquery name="addData" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_webusers(email,password,role,status)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.email#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.encodedPassword#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="user">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="1">      
                )
            </cfquery>
            <cfset local.message  ="User registered successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"   url="../web/user-signin.cfm?aMessageSuccess=#encryptedMessage#">   
            </cfif>
    </cffunction>

    <cffunction name="findAvailableSeats" access="remote">
        <cfargument name="showMovieId" type="string" required="yes">
        <cfquery name="fetchShowDataBySeats" datasource="cruddb">
            SELECT totalSeats FROM bookmyticket.moviepanel_movieshowtimes WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.showMovieId#">
        </cfquery>
        <cfreturn fetchShowDataBySeats> 
    </cffunction>

    
</cfcomponent>