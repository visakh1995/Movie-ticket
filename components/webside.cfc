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

    <cffunction name="authorizeRelocation" access="remote" returnFormat = "json">
        <cfif isDefined("Session.UsermovieTicketCredentials")>
        </cfelse>

        </cfif> 

    </cffunction>

    



    

</cfcomponent>