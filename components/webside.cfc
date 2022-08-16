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
            SELECT sm.id,sm.movieName,sm.releaseDate,
            sm.movieFormat,sm.genre,sm.language,sm.duration,sm.poster,s.movie
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
        <cfif isDefined("Session.UserwebMovieTicketCredentials")>
            <cflocation addtoken="no" url="../web/seat-selection.cfm?moviesShowId=#arguments.movieShowId#">
        <cfelse>
            <cflocation addtoken="no" url="../web/user-signin.cfm?movieShowId=#arguments.movieShowId#">
        </cfif> 
    </cffunction>

    <!---Authorization --->

    <cffunction name="UserMovieTicketSignin" access="remote" output="true" returnType="string">
        <cfargument name="email" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfargument  name="movieShowValue" type="string" required="no">

        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfquery name="userVerifiedDetails" datasource="cruddb">
            SELECT *FROM bookmyticket.moviepanel_webusers WHERE 
            email = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.email#"> AND
            password = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#local.encodedPassword#"> AND
            role = <cfqueryparam CFSQLType="cf_sql_varchar" value ="user"> 
        </cfquery>

        <cfif userVerifiedDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"UserwebMovieTicketCredentials")>
                <cflock timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.UserwebMovieTicketCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"UserwebMovieTicketCredentials")>
                <cfset Session.UserwebMovieTicketCredentials["id"] = "#userVerifiedDetails.id#">
                <cfset Session.UserwebMovieTicketCredentials["userName"] = "#userVerifiedDetails.userName#">
                <cfset Session.UserwebMovieTicketCredentials["email"] = "#userVerifiedDetails.email#">
                <cfset Session.UserwebMovieTicketCredentials["password"] = "#userVerifiedDetails.password#">
                <cfset Session.UserwebMovieTicketCredentials["isAuthenticated"] = "True">
            </cfif>
            <cfif isDefined("arguments.movieShowValue")>
                <cflocation addtoken="no"  url="../web/seat-selection.cfm?moviesShowId=#arguments.movieShowValue#"> 
            <cfelse>
                <cflocation addtoken="no"  url="../web/home.cfm"> 
            </cfif>

        <cfelse>
            <cfset local.message  ="Invalid username or password">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../web/user-signin.cfm?aMessages=#encryptedMessage#">  
        </cfif>

    </cffunction>

    <cffunction  name="UserMovieTicketSignup" access="remote" output="true" returnType="string">

        <cfargument  name="userName" type="string" required="yes">
        <cfargument  name="email" type="string" required="yes"> 
        <cfargument  name="password" type="string" required="yes">
        <cfargument  name="confirmPassword" type="string" required="yes">
        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfset local.aErrorMessages =  "">
        <cfif arguments.userName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid user name'/>
         </cfif>
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
            <cfparam name="arguments.userName" default="">
            <cfparam name="arguments.email" default="">
            <cfparam name="arguments.password" default="">
            <cfparam name="arguments.confirmPassword" default="">
            <cfset local.registered = Now()>
            <cfset local.registeredOn = DateFormat(local.registered,'yyyy-mm-dd')>

            <cfquery name="emailVerify" datasource="cruddb">
                SELECT *FROM bookmyticket.moviepanel_webusers WHERE email = "#arguments.email#";
            </cfquery>

            <cfif emailVerify.RecordCount neq 0>
                <cfset local.aErrorMessages = 'The email already registered'/>
                <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
                <cflocation addtoken="no"  url="../web/user-signup.cfm?aMessages=#local.encryptedMessage#">
            </cfif> 

            <cfquery name="addData" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_webusers(userName,email,password,registeredOn,role,status)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.userName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.email#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.encodedPassword#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.registeredOn#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="user">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="1">      
                )
            </cfquery>

            <cfset local.message  ="User registered successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"   url="../web/user-signin.cfm?aMessageSuccess=#encryptedMessage#">   
            </cfif>
    </cffunction>

    <cffunction  name="webUserSignout" access="remote">
        <cfset structDelete(Session,"UserwebMovieTicketCredentials")>
        <cflocation addtoken="no" url ="../web/home.cfm">
    </cffunction>

    <cffunction name="findAvailableSeats" access="remote">
        <cfargument name="showMovieId" type="string" required="yes">
        <cfquery name="fetchShowDataBySeats" datasource="cruddb">
            SELECT availableSeats FROM bookmyticket.moviepanel_movieshowtimes WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.showMovieId#">
        </cfquery>
        <cfreturn fetchShowDataBySeats> 
    </cffunction>

    <cffunction  name="ticketBooking" access="remote">
        <cfargument name="seats" type="string" required="yes">
        <cfargument name="movieShowId" type="string" required="yes">
        <cfset local.seatCount = ToBase64(arguments.seats) />
        <cfset local.movieShowId = ToBase64(arguments.movieShowId) />
        <cflocation  addtoken="no" 
        url="../web/ticket-booking.cfm?seatCount=#local.seatCount#&movieShowId=#local.movieShowId#">
    </cffunction>

    <cffunction  name="webMovieFindBookingDetails" access="remote">
        <cfargument name="movieShowId" type="string" required="yes">
        <cfset local.webMovieShowId = ToString(ToBinary(arguments.movieShowId))>
        <cfquery name="webTicketDetailJoinList" datasource="cruddb">
            SELECT sh.id,m.poster,m.movieName,th.theaterName,th.id as theatrId,m.releaseDate,m.duration,
            sh.screen,sh.showName,s.screenName,s.silverRate,s.goldRate,st.showStartTime,st.showName,sh.endDate,sh.showPriority,sh.totalSeats
            FROM bookmyticket.moviepanel_movieshowtimes sh
            INNER JOIN bookmyticket.moviepanel_movies m ON sh.movie =m.id
            INNER JOIN bookmyticket.moviepanel_teaters th ON sh.theater=th.id 
            INNER JOIN bookmyticket.moviepanel_screens s ON sh.screen=s.id
            INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.showName =st.id
            WHERE sh.id =  <cfqueryparam  CFSQLType = "cf_sql_integer" value="#local.webMovieShowId#"> 
        </cfquery>
        <cfreturn webTicketDetailJoinList>
    </cffunction>

    <cffunction name="saveUserSeatInfo" access="remote" returnFormat = "json">
        <cfargument name="movie_show_time_id" type="integer" required="yes">
        <cfargument name="seats" type="string" required="yes">
        <cfargument name="ticket_count" type="integer" required="yes">
        <cfargument name="total" type="integer" required="yes">
        <cfargument name="theaterId" type="integer" required="yes">


        <cfset local.bookTime = dateFormat(Now())>

        <cfif isDefined("Session.UserwebMovieTicketCredentials.id") >
            <cfset local.userId = #Session.UserwebMovieTicketCredentials.id#>
        <cfelse>
            <cfset local.userId = 0>
        </cfif>

        <cfquery name="addData" result = result datasource="cruddb" >
            INSERT INTO bookmyticket.moviepanel_reservation(userId,movieShowTimeId,ticketCount,theater,selectedSeats,
            totalPrice,bookingTime,bookingStatus)
            VALUES(
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.userId#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.movie_show_time_id#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.ticket_count#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.theaterId#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.seats#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.total#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.bookTime#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="onHold">
            )
        </cfquery>
            <cfset local.NewPrimaryKey = result.generatedkey>
            <cfset local.reservId = ToBase64(local.NewPrimaryKey) /> 
        <cfreturn local.reservId> 

    </cffunction>

    <cffunction name="webMovieTheaterFilledSeats" datasource="cruddb">
         <cfargument name="theaterId" type="string" required="yes"> 
         <cfargument name="screenId" type="string" required="yes"> 
         <cfargument name="showTimeId" type="string" required="yes"> 

         <cfif isDefined("Session.UserwebMovieTicketCredentials.id") >
            <cfset local.userId = #Session.UserwebMovieTicketCredentials.id#>
        <cfelse>
            <cfset local.userId = 0>
        </cfif>

         <cfquery name="filledSeats" datasource="cruddb">
            SELECT rs.selectedSeats,rs.theater,sh.screen,sh.showName
            FROM bookmyticket.moviepanel_movieshowtimes sh
            INNER JOIN bookmyticket.moviepanel_reservation rs ON sh.id =rs.movieShowTimeId
            INNER JOIN bookmyticket.moviepanel_webusers wb ON rs.userId =wb.id
            WHERE bookingStatus = <cfqueryparam  CFSQLType="cf_sql_varchar" value="PAYMENTED"> 
            AND rs.theater = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.theaterId#"> 
            AND sh.screen = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.screenId#"> 
            AND sh.showName = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.showTimeId#"> 
        </cfquery>
        <cfreturn filledSeats>
    </cffunction>

    <cffunction name="retrieveKey" access="remote">
        <cfargument name="key" type="integer" required="yes">
        <cfif NOT structKeyExists(Session,"movieKeyValues")>
            <cflock timeout="20" scope="Session" type="Exclusive">
                <cfset Session.movieKeyValues = structNew()>
            </cflock>
        </cfif>
        <cfif structKeyExists(Session,"movieKeyValues")>
            <cfset Session.movieKeyValues["keys"] = "#arguments.key#">
        </cfif>
    </cffunction>

    <cffunction name="findCheckoutDetails" access="remote">
        <cfargument name="reservationId" type="integer" required="yes">
        <cfif isDefined("Session.UserwebMovieTicketCredentials.id") >
            <cfset local.userId = #Session.UserwebMovieTicketCredentials.id#>
        <cfelse>
            <cfset local.userId = 0>
        </cfif>
        <cfquery name="reservationByDetail" datasource="cruddb">
            SELECT sh.id,m.poster,m.movieName,th.theaterName,m.releaseDate,m.duration,
            s.screenName,s.silverRate,s.goldRate,st.showStartTime,st.showName,sh.endDate,sh.showPriority,
            sh.availableSeats,wb.userName,wb.email,rs.totalPrice,rs.id as reservId,rs.ticketCount
            FROM bookmyticket.moviepanel_movieshowtimes sh
            INNER JOIN bookmyticket.moviepanel_movies m ON sh.movie = m.id
            INNER JOIN bookmyticket.moviepanel_teaters th ON sh.theater=th.id 
            INNER JOIN bookmyticket.moviepanel_screens s ON sh.screen=s.id
            INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.showName =st.id
            INNER JOIN bookmyticket.moviepanel_reservation rs ON sh.id =rs.movieShowTimeId
            INNER JOIN bookmyticket.moviepanel_webusers wb ON rs.userId =wb.id
            WHERE rs.id =  <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.reservationId#">
            AND wb.id =  <cfqueryparam  CFSQLType = "cf_sql_integer" value="#local.userId#">; 
        </cfquery>
        <cfreturn reservationByDetail>
    </cffunction>

    <cffunction name="saveUserPaymentInfo" access="remote" returnFormat = "json">
        <cfargument name="amount" type="integer" required="yes">
        <cfargument name="reservId" type="integer" required="yes">
        <cfargument name="paymentId" type="string" required="yes">
        <cfargument name="availableSeats" type="integer" required="yes">
        <cfargument name="ticketCount" type="integer" required="yes">
        <cfargument name="movieShowId" type="integer" required="yes">


        <cfset local.paymentDate = dateFormat(Now())>

        <cfif isDefined("Session.UserwebMovieTicketCredentials.id") >
            <cfset local.userId = #Session.UserwebMovieTicketCredentials.id#>
            <cfset local.email = #Session.UserwebMovieTicketCredentials.email#>
        <cfelse>
            <cfset local.userId = 0>
        </cfif>

        <cfquery name="addPaymentData" result = result datasource="cruddb">
            INSERT INTO bookmyticket.moviepanel_payment(userId,reservId,paymentId,dateOfBooking,amountPayable,
            paymentStatus)
            VALUES(
                <cfqueryparam  CFSQLType="cf_sql_integer" value="#local.userId#">,
                <cfqueryparam  CFSQLType="cf_sql_integer" value ="#arguments.reservId#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.paymentId#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#local.paymentDate#">,
                <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.amount#">,
                <cfqueryparam  CFSQLType="cf_sql_varchar" value="PAYMENTED">
            )
        </cfquery>
        <cfmail
            from="Sender@Company.com"
            to="#local.email#"
            subject="Your Booking Confirmed|Movie Ticket"
            type="html">

            <html>
                <body>   
                    Date of Booking : #DateFormat(Now(),"dd-mmm-yyyy")#</br></br>
                    <table width="720">
                    <tr>
                        <td>User ID</td>
                        <td>Booking ID</td>
                        <td>Payment ID</td>
                        <td>Payment Date</td>
                        <td>Amount</th>
                    </tr>
                    <tr>
                        <td>#local.userId#</td>
                        <td>#arguments.reservId#</td>
                        <td>#arguments.paymentId#</td>
                        <td>#local.paymentDate#</td>
                        <td>#arguments.amount#</td>
                    </tr>
                    </table>
                </body>
            </html>
        </cfmail>

        <cfif result.recordCount eq 1>
            <cfquery name="updateReservationStatus" result="updateStatusResult" datasource="cruddb">
                UPDATE bookmyticket.moviepanel_reservation SET bookingStatus = "PAYMENTED" 
                WHERE id = <cfqueryparam CFSQLType ="cf_sql_integer" value="#arguments.reservId#">
            </cfquery>
            <cfset local.NewPaymentKey = result.generatedkey>
            <cfset local.paymentkey = ToBase64(local.NewPaymentKey) /> 
            <cfif updateStatusResult.recordCount eq 1>
                <cfset local.remainSeats = arguments.availableSeats - arguments.ticketCount>
                <cfquery name="updateAvailableSeats" result="updateSeatsStatus" datasource="cruddb">
                    UPDATE bookmyticket.moviepanel_movieshowtimes 
                    SET availableSeats =  <cfqueryparam CFSQLType ="cf_sql_integer" value="#local.remainSeats#">
                    WHERE id = <cfqueryparam CFSQLType ="cf_sql_integer" value="#arguments.movieShowId#">
                </cfquery>
                <cfset local.description = "Your booking Confirmed">


                <cfreturn local.paymentkey>
            <cfelse>
                <cfreturn "FAILED">
            </cfif>
        <cfelse>
            <cfreturn "FAILED">
        </cfif>
    </cffunction>

    <cffunction  name="findTicketConfirmDetails" access="remote" returnFormat="json">
        <cfargument  name="paymentId" type="integer" required="yes">
        <cfif isDefined("Session.UserwebMovieTicketCredentials.id") >
            <cfset local.userId = #Session.UserwebMovieTicketCredentials.id#>
        <cfelse>
            <cfset local.userId = 0>
        </cfif>
        <cfquery name="confirmTicketByDetail" result = result datasource="cruddb">
            SELECT sh.id,m.poster,m.movieName,th.theaterName,m.releaseDate,m.duration,m.language,
            s.screenName,s.silverRate,s.goldRate,st.showStartTime,st.showName,sh.endDate,sh.showPriority,
            wb.userName,wb.email,rs.totalPrice,rs.ticketCount,rs.selectedSeats,
            rs.id as reservId,py.dateOfBooking,py.amountPayable
            FROM bookmyticket.moviepanel_movieshowtimes sh
            INNER JOIN bookmyticket.moviepanel_movies m ON sh.movie = m.id
            INNER JOIN bookmyticket.moviepanel_teaters th ON sh.theater = th.id 
            INNER JOIN bookmyticket.moviepanel_screens s ON sh.screen= s.id
            INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.showName = st.id
            INNER JOIN bookmyticket.moviepanel_reservation rs ON sh.id = rs.movieShowTimeId
            INNER JOIN bookmyticket.moviepanel_webusers wb ON rs.userId = wb.id
            INNER JOIN bookmyticket.moviepanel_payment py ON rs.id = py.reservId
            WHERE py.id =  <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.paymentId#">
            AND wb.id =  <cfqueryparam  CFSQLType = "cf_sql_integer" value="#local.userId#">; 
        </cfquery>
        <cfreturn confirmTicketByDetail>
    </cffunction>

    <cffunction name="searchResults" access="remote" returnFormat="json">
        <cfquery name="searchResults" result="result" datasource="cruddb">
            SELECT *FROM bookmyticket.moviepanel_movies;
        </cfquery>
        <cfreturn searchResults>
    </cffunction>

    <cffunction name="findDetailsBySearchResults" access="remote">
        <cfargument name="movie" type="string" required="yes">
        <cfset local.encryptId = ToBase64(movie)/>
        <cflocation addtoken="no"  url="../web/movie_specifics.cfm?movieId=#local.encryptId#">
    </cffunction>

    <cffunction name="showsNowShowing" access="remote" returnFormat = "json">
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
            WHERE CURDATE() BETWEEN m.releaseDate AND sh.endDate GROUP BY m.movieName; 
        </cfquery>  
    <cfreturn show_details> 
    </cffunction>



    
</cfcomponent>