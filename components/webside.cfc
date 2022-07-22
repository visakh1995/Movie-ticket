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
            GROUP BY th.theaterName
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

</cfcomponent>