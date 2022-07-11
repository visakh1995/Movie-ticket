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
            <cflocation addtoken="no"  url="../admin/managemovies.cfm?aMessages=#local.encryptedMessage#">
        <cfelse>
            <cfquery name="movieVerify" datasource="cruddb">
                SELECT *FROM bookmyticket.moviepanel_movies WHERE movieName = "#arguments.movieName#";
            </cfquery>
            <cfif movieVerify.RecordCount NEQ 0>
                <cfset local.aErrorMessages = 'The movie already entered'/>
                <cfset local.encryptedMessage = ToBase64(local.aErrorMessages) />
                <cflocation addtoken="no"  url="../admin/managemovies.cfm?aMessages=#local.encryptedMessage#">
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
            <cflocation addtoken="no"  url="../admin/managemovies.cfm?aMessageSuccess=#local.encryptedMessage#"> 
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
            <cflocation addtoken="no"  url="../admin/managemovies.cfm?aMessages=#local.encryptedMessage#">
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
            <cflocation addtoken="no"  url="../admin/managemovies.cfm?aMessageSuccess=#local.encryptedMessage#"> 
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
        <cflocation addtoken="no"  url="../admin/managemovies.cfm?aMessages=#local.encryptedMessage#"> 
    </cffunction>

    

</cfcomponent>
