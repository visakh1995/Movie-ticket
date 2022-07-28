<cfcomponent>
    
    <cffunction name="movieCreateForm" access="remote" output="true">
        <cfargument name="movieName" type="string" required="true">
        <cfargument name="releaseDate" type="string" required="true">
        <cfargument name="movieFormat" type="string" required="true">
        <cfargument name="genre" type="string" required="true">
        <cfargument name="language" type="string" required="true">
        <cfargument name="duration" type="string" required="true">
        <cfargument name="trailerUrl" type="string" required="true">
        <cfargument name="poster" type="string" required="true">
        <cfargument name="wallpaper" type="string" required="true">
        <cfargument name="description" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.movieName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid movie name'/>
        </cfif>
        <cfif arguments.releaseDate EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid release date'/>
        </cfif>
        <cfif arguments.movieFormat EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid movie format'/>
        </cfif>
        <cfif arguments.genre EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid genre'/>
        </cfif>
        <cfif arguments.language EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid language'/>
        </cfif>
        <cfif arguments.duration EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid duration'/>
        </cfif>
        <cfif arguments.trailerUrl EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid trailer Url'/>
        </cfif>
        <cfif arguments.description EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid description'/>
        </cfif>
        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../admin/manage-shows.cfm?aMessages=#local.encryptedMessage#">
        <cfelse>
            <cfquery name="movieVerify" datasource="cruddb">
                SELECT *FROM bookmyticket.moviepanel_movies WHERE movieName = "#arguments.movieName#";
            </cfquery>
            <cfif movieVerify.RecordCount NEQ 0>
                <cfset local.aErrorMessages = 'The movie already entered'/>
                <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
                <cflocation addtoken="no"  url="../admin/manage-shows.cfm?aMessages=#local.encryptedMessage#">
            </cfif> 
            <cffile action="upload"
            fileField="poster"
            nameconflict="overwrite"
            destination="C:\coldFusion2021\cfusion\wwwroot\movie-ticket\uploads\">
            <cfset local.imageValuePoster = #cffile.serverFile#>

            <cffile action="upload"
            fileField="wallpaper"
            nameconflict="overwrite"
            destination="C:\coldFusion2021\cfusion\wwwroot\movie-ticket\uploads\">
            <cfset local.imageValueWallpaper = #cffile.serverFile#>

            <cfparam name="arguments.movieName" default="">
            <cfparam name="arguments.releaseDate" default="">
            <cfparam name="arguments.movieFormat" default="">
            <cfparam name="arguments.genre" default="">
            <cfparam name="arguments.language" default="">
            <cfparam name="arguments.duration" default="">
            <cfparam name="arguments.trailerUrl" default="">
            <cfparam name="arguments.description" default="">
            <cfparam name="arguments.status" default="1">

            <cfquery name="addData" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_movies(movieName,releaseDate,movieFormat,genre,
                language,duration,trailerUrl,poster,wallpaper,description,movieStatus)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.movieName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.releaseDate#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.movieFormat#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.genre#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.language#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.duration#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.trailerUrl#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.imageValuePoster#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#local.imageValueWallpaper#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.description#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Movie created successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/manage-shows.cfm?aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="findMoviesList" access="remote" output="true">
        <cfquery name="showMovies" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_movies
        </cfquery>
        <cfreturn showMovies>
    </cffunction>

    <cffunction name="editMovieInfo" access="remote" returnFormat = "json">
        <cfargument name="movie_id" type="string" required="yes">
        <cfquery name="fetchMovieData" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_movies WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.movie_id#">
        </cfquery>
        <cfreturn fetchMovieData> 
    </cffunction>

    <cffunction name="movieUpdateForm" access="remote">
    
        <cfargument name="movieName" type="string" required="true">
        <cfargument name="movieId" type="string" required="true">
        <cfargument name="releaseDate" type="string" required="true">
        <cfargument name="movieFormat" type="string" required="true">
        <cfargument name="genre" type="string" required="true">
        <cfargument name="language" type="string" required="true">
        <cfargument name="duration" type="string" required="true">
        <cfargument name="trailerUrl" type="string" required="true">
        <cfargument name="poster" type="string" required="true">
        <cfargument name="wallpaper" type="string" required="true">
        <cfargument name="description" type="string" required="true">
        <cfargument name="defaultPoster" type="string" required="true">
        <cfargument name="defaultWallpaper" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.movieName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid movie name'/>
        </cfif>
        <cfif arguments.releaseDate EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid release date'/>
        </cfif>
        <cfif arguments.movieFormat EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid movie format'/>
        </cfif>
        <cfif arguments.genre EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid genre'/>
        </cfif>
        <cfif arguments.language EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid language'/>
        </cfif>
        <cfif arguments.duration EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid duration'/>
        </cfif>
        <cfif arguments.trailerUrl EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid trailer Url'/>
        </cfif>
        <cfif arguments.description EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid description'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages)/>
            <cflocation addtoken="no"  url="../admin/manage-shows.cfm?aMessages=#local.encryptedMessage#">
        <cfelse> 
        
            <cfif len(trim(arguments.poster)) NEQ 0>
                <cffile action="upload"
                fileField="poster"
                nameconflict="overwrite"
                destination="C:\coldFusion2021\cfusion\wwwroot\movie-ticket\uploads\">
                <cfset local.imageValuePoster = #cffile.serverFile#>
            <cfelse>
                <cfset local.imageValuePoster = #arguments.defaultPoster#>
            </cfif>

            <cfif len(trim(arguments.wallpaper)) NEQ 0>
                <cffile action="upload"
                fileField="wallpaper"
                nameconflict="overwrite"
                destination="C:\coldFusion2021\cfusion\wwwroot\movie-ticket\uploads\">
                <cfset local.imageValueWallpaper = #cffile.serverFile#>
            <cfelse>
                <cfset local.imageValueWallpaper = #arguments.defaultWallpaper#>
            </cfif>

            <cfparam name="arguments.movieName" default="">
            <cfparam name="arguments.releaseDate" default="">
            <cfparam name="arguments.movieFormat" default="">
            <cfparam name="arguments.genre" default="">
            <cfparam name="arguments.language" default="">
            <cfparam name="arguments.duration" default="">
            <cfparam name="arguments.trailerUrl" default="">
            <cfparam name="arguments.description" default="">
            <cfparam name="arguments.status" default="1">

            <cfquery name="updateData" datasource="cruddb">
                UPDATE bookmyticket.moviepanel_movies SET 
                    movieName = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.moviename#">,
                    releaseDate =<cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.releaseDate#">,
                    movieFormat = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.movieFormat#">,
                    genre = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.genre#">,
                    language = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.language#">,
                    duration = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.duration#">,
                    trailerUrl = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.trailerUrl#">,
                    poster = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.imageValuePoster#">,
                    wallpaper = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.imageValueWallpaper#">,
                    description = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.description#">,
                    movieStatus = <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                WHERE id = "#arguments.movieId#"
            </cfquery>
            <cfset local.message  ="Movie updated successfully">
            <cfset local.encryptedMessage = ToBase64(local.message)/>
            <cflocation addtoken="no"  url="../admin/manage-shows.cfm?aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="movieDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="deleteMovie" datasource="cruddb">
            DELETE FROM bookmyticket.moviepanel_movies WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
        </cfquery>
        <cfset local.message  ="Movie deleted successfully">
        <cfset local.encryptedMessage = ToBase64(local.message) />
        <cflocation addtoken="no"  url="../admin/manage-shows.cfm?aMessages=#local.encryptedMessage#"> 
    </cffunction>

    <!---    cast crew --->

    <cffunction name="movieTicketCreateCastForm" access="remote" output="true">
        <cfargument name="characterName" type="string" required="true">
        <cfargument name="actorName" type="string" required="true">
        <cfargument name="actorPhoto" type="string" required="true">
        <cfargument name="movieId" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.characterName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid character name'/>
        </cfif>
        <cfif arguments.actorName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid actor name'/>
        </cfif>
        <cfif arguments.actorPhoto EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid actor photo'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../admin/cast-crew.cfm?movieId=#arguments.movieId#&aMessages=#local.encryptedMessage#">
        <cfelse>

            <cffile action="upload"
            fileField="actorPhoto"
            nameconflict="overwrite"
            destination="C:\coldFusion2021\cfusion\wwwroot\movie-ticket\uploads\">
            <cfset local.imageValueActorphoto = #cffile.serverFile#>

            <cfparam name="arguments.characterName" default="">
            <cfparam name="arguments.actorName" default="">
            <cfparam name="arguments.actorPhoto" default="">
            <cfparam name="arguments.movieId" default="">
            <cfparam name="arguments.status" default="1">

            <cfquery name="addData" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_casts(movieid,characterName,actorName,actorPhoto,castStatus)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.movieId#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.characterName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.actorName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#local.imageValueActorphoto#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Cast created successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/cast-crew.cfm?movieId=#arguments.movieId#&aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="movieTicketCreateCrewForm" access="remote" output="true">
        <cfargument name="roleName" type="string" required="true">
        <cfargument name="personsName" type="string" required="true">
        <cfargument name="crewPhoto" type="string" required="true">
        <cfargument name="movieId" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.roleName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid role name'/>
        </cfif>
        <cfif arguments.personsName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid persons name'/>
        </cfif>
        <cfif arguments.crewPhoto EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid crew photo'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../admin/cast-crew.cfm?movieId=#arguments.movieId#&aMessagesShow=#local.encryptedMessage#">
        <cfelse>

            <cffile action="upload"
            fileField="crewPhoto"
            nameconflict="overwrite"
            destination="C:\coldFusion2021\cfusion\wwwroot\movie-ticket\uploads\">
            <cfset local.imageValueCrewphoto = #cffile.serverFile#>

            <cfparam name="arguments.roleName" default="">
            <cfparam name="arguments.movieId" default="">
            <cfparam name="arguments.personsName" default="">
            <cfparam name="arguments.crewPhoto" default="">
            <cfparam name="arguments.status" default="1">

            <cfquery name="addData" result = result datasource="cruddb">
                INSERT INTO bookmyticket.moviepanel_crews(movieid,roleName,personsname,crewphoto,crewStatus)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.movieId#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.roleName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.personsName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#local.imageValueCrewphoto#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Crew created successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/cast-crew.cfm?movieId=#arguments.movieId#&aMessageSuccessShow=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="findMovieCastList" access="public">
        <cfargument name="movieId" type="string" required="yes">
        <cfquery name="movieCastList" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_casts 
            WHERE movieId = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.movieId#">
        </cfquery>
        <cfreturn movieCastList>
    </cffunction>

    <cffunction name="findMovieCrewList" access="public">
        <cfargument name="movieId" type="string" required="yes">
        <cfquery name="movieCrewList" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_crews 
            WHERE movieId = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.movieId#">
        </cfquery>
        <cfreturn movieCrewList>
    </cffunction>

    <cffunction name="castDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="findMovieId" datasource="cruddb">
            SELECT *FROM bookmyticket.moviepanel_casts WHERE id = "#arguments.deleteId#";
        </cfquery>
        <cfif findMovieId.RecordCount NEQ 0>
            <cfset local.movieId = findMovieId.movieId>
            <cfquery name="deleteMovieCast" datasource="cruddb">
                DELETE FROM bookmyticket.moviepanel_casts WHERE 
                id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
            </cfquery>
            <cfset local.message  ="Cast deleted successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/cast-crew.cfm?movieId=#local.movieId#&aMessages=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="crewDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="findMovieId" datasource="cruddb">
            SELECT *FROM bookmyticket.moviepanel_crews WHERE id = "#arguments.deleteId#";
        </cfquery>
        <cfif findMovieId.RecordCount NEQ 0>
            <cfset local.movieId = findMovieId.movieId>
            <cfquery name="deleteMovieCast" datasource="cruddb">
                DELETE FROM bookmyticket.moviepanel_crews WHERE 
                id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
            </cfquery>
            <cfset local.message  ="Crew deleted successfully">
            <cfset local.encryptedMessage = ToBase64(local.message) />
            <cflocation addtoken="no"  url="../admin/cast-crew.cfm?movieId=#local.movieId#&aMessagesShow=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="movieTicketCreateMovieShowTime" access="remote" output="true">

        <cfargument name="movie" type="string" required="true">
        <cfargument name="theater" type="string" required="true">
        <cfargument name="screen" type="string" required="true">
        <cfargument name="showName" type="string" required="true">
        <cfargument name="endDate" type="string" required="true">
        <cfargument name="showPriority" type="string" required="true">
        <cfargument name="totalSeats" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.movie EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid movie name'/>
        </cfif>
        <cfif arguments.theater EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid theater'/>
        </cfif>
        <cfif arguments.screen EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid screen'/>
        </cfif>
        <cfif arguments.showName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid showName'/>
        </cfif>
        <cfif arguments.endDate EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid endDate'/>
        </cfif>
        <cfif arguments.showPriority EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid Priority'/>
        </cfif>
        <cfif arguments.totalSeats EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid totalSeats'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
            <cflocation addtoken="no"  url="../admin/managemovieshowtime.cfm?aMessages=#local.encryptedMessage#">
        <cfelse>

            <cfquery name="show_exists" result="exist_res" datasource="cruddb">
                SELECT * FROM bookmyticket.moviepanel_movieShowTimes where 
                movie=<cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER"> 
                and theater=<cfqueryparam value="#arguments.theater#" cfsqltype="CF_SQL_INTEGER"> 
                and screen=<cfqueryparam value="#arguments.screen#" cfsqltype="CF_SQL_INTEGER"> 
                and showName=<cfqueryparam value="#arguments.showName#" cfsqltype="CF_SQL_INTEGER"> 
            </cfquery>
            <cfquery name="movie_res" result="movie_details" datasource="cruddb">
                SELECT * FROM bookmyticket.moviepanel_movies WHERE 
                id=<cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
            <cfoutput query='movie_res'>
                <cfset start_date=#releaseDate#>
            </cfoutput> 

            <cfif dateCompare(arguments.endDate,start_date) NEQ -1>
                <cfif exist_res.RecordCount EQ 0>
                    <cfparam name="arguments.movie" default="">
                    <cfparam name="arguments.theater" default="">
                    <cfparam name="arguments.screen" default="">
                    <cfparam name="arguments.showName" default="">
                    <cfparam name="arguments.endDate" default="">
                    <cfparam name="arguments.showPriority" default="">
                    <cfparam name="arguments.totalSeats" default="">
                    <cfparam name="arguments.status" default="1">
        
                    <cfquery name="addData" result = result datasource="cruddb">
                        INSERT INTO bookmyticket.moviepanel_movieShowTimes(movie,theater,screen,showName,
                        endDate,showPriority,totalSeats,movieTimeStatus)
                        VALUES(
                            <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.movie#">,
                            <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.theater#">,
                            <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.screen#">,
                            <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.showName#">,
                            <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.endDate#">,
                            <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.showPriority#">,
                            <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.totalSeats#">,
                            <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                        )
                    </cfquery>
                    <cfset local.message  ="Movie Show Time created successfully">
                    <cfset local.encryptedMessage = ToBase64(local.message) />
                    <cflocation addtoken="no"  url="../admin/managemovieshowtime.cfm?aMessageSuccess=#local.encryptedMessage#">
                <cfelse>
                    <cfset local.message  ="This movie Show is already exist,please try again">
                    <cfset local.encryptedMessage = ToBase64(local.message) />
                    <cflocation addtoken="no"  url="../admin/managemovieshowtime.cfm?aMessages=#local.encryptedMessage#">    
                </cfif>
            <cfelse>
                <cfset local.message  ="Please select end date greater than release date">
                <cfset local.encryptedMessage = ToBase64(local.message) />
                <cflocation addtoken="no"  url="../admin/managemovieshowtime.cfm?aMessages=#local.encryptedMessage#">    
            </cfif>

        </cfif>
    </cffunction>

    <cffunction name="editMovieShowTime" access="remote" returnFormat = "json">
        <cfargument name="movieShowTime_id" type="string" required="yes">
        <cfquery name="fetchMovieShowTimeData" datasource="cruddb">
            SELECT * FROM bookmyticket.moviepanel_movieshowtimes WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.movieShowTime_id#">
        </cfquery>
        <cfreturn fetchMovieShowTimeData> 
    </cffunction>

    <cffunction name="movieTicketUpdateMovieShowTime" access="remote">
    
        <cfargument name="movie" type="string" required="true">
        <cfargument name="theater" type="string" required="true">
        <cfargument name="screen" type="string" required="true">
        <cfargument name="showName" type="string" required="true">
        <cfargument name="endDate" type="string" required="true">
        <cfargument name="showPriority" type="string" required="true">
        <cfargument name="totalSeats" type="string" required="true">
        <cfargument name="movieShowTimeId" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.movie EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid movie name'/>
        </cfif>
        <cfif arguments.theater EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid theater'/>
        </cfif>
        <cfif arguments.screen EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid screen'/>
        </cfif>
        <cfif arguments.showName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid showName'/>
        </cfif>
        <cfif arguments.endDate EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid endDate'/>
        </cfif>
        <cfif arguments.showPriority EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid Priority'/>
        </cfif>
        <cfif arguments.totalSeats EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid totalSeats'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cfset local.encryptedMessage = ToBase64(local.aErrorMessages)/>
            <cflocation addtoken="no"  url="../admin/managemovieshowtime.cfm?aMessages=#local.encryptedMessage#">
        <cfelse> 
        
            <cfparam name="arguments.movie" default="">
            <cfparam name="arguments.theater" default="">
            <cfparam name="arguments.screen" default="">
            <cfparam name="arguments.showName" default="">
            <cfparam name="arguments.endDate" default="">
            <cfparam name="arguments.showPriority" default="">
            <cfparam name="arguments.totalSeats" default="">
            <cfparam name="arguments.status" default="1">

            <cfquery name="updateData" datasource="cruddb">
                UPDATE bookmyticket.moviepanel_movieshowtimes SET 
                    movie = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.movie#">,
                    theater =<cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.theater#">,
                    screen = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.screen#">,
                    showName = <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.showName#">,
                    endDate = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.endDate#">,
                    showPriority = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.showPriority#">,
                    totalSeats = <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.totalSeats#">,
                    movieTimeStatus = <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                WHERE id = "#arguments.movieShowTimeId#"
            </cfquery>
            <cfset local.message  ="Movie Show Time updated successfully">
            <cfset local.encryptedMessage = ToBase64(local.message)/>
            <cflocation addtoken="no"  url="../admin/managemovieshowtime.cfm?aMessageSuccess=#local.encryptedMessage#"> 
        </cfif>
    </cffunction>

    <cffunction name="movieShowTimeDelete" access="remote">
        <cfargument name="deleteId" type="string" required="yes">
        <cfquery name="deleteMovieShowTime" datasource="cruddb">
            DELETE FROM bookmyticket.moviepanel_movieshowtimes WHERE 
            id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.deleteId#">
        </cfquery>
        <cfset local.message  ="movie Show time deleted successfully">
        <cfset local.encryptedMessage = ToBase64(local.message) />
        <cflocation addtoken="no"  url="../admin/managemovieshowtime.cfm?aMessages=#local.encryptedMessage#"> 
    </cffunction>

    <cffunction name="screenDetails" access="remote" output="true" returnFormat = "json">
        <cfargument  name="theatre_id" type="integer">
        <cfquery name="screen_details" datasource="cruddb" result="res" returntype="array" >
            SELECT * FROM bookmyticket.moviepanel_screens 
            WHERE theatreId=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">;
        </cfquery>
        <cfreturn screen_details>
    </cffunction>

    <cffunction name="screenTimeDetails" access="remote" output="true" returnFormat = "json">
        <cfargument  name="theatre_id" type="integer">
        <cfargument  name="screen_id" type="integer">
        <cfquery name="time_details" datasource="cruddb" result="res" returntype="array">
            SELECT st.id, st.screen,s.screenName, st.teatreId,st.showStartTime,st.showName
            FROM bookmyticket.moviepanel_showtimes st
            INNER JOIN bookmyticket.moviepanel_screens  s ON s.id = st.screen
        WHERE 
        st.teatreId= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.theatre_id#"> AND
        st.screen=<cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.screen_id#">
        </cfquery>
        <cfreturn time_details>
    </cffunction> 

</cfcomponent>
