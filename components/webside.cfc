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




</cfcomponent>