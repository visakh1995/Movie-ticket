<select  class="fullWidth" name = "screen" id="screen" required> 
    <cfoutput>
<!---                                         <cfloop query = screensList> --->
<!---                                             <option value="#screensList.id#">#screensList.screenName#</option> --->
<!---                                         </cfloop> --->
    </cfoutput>
</select>

<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset screensList = newInstance.findScreensList()> 

<div class="form-control">
    <select  class="fullWidth" name = "screen" id="screen" required> 
        <cfoutput>
            <cfloop query = screensList>
                <option value="#screensList.id#">#screensList.screenName#</option> 
            </cfloop> 
        </cfoutput>
    </select>
</div>


<script>
    var hamburger = document.querySelector(".hamburger");
      hamburger.addEventListener("click", function(){
      document.querySelector("body").classList.toggle("active");
  })
</script>

<cffunction name="findScreensList" access="public" output="true">
    <cfargument name="teatreId" type="integer" >
    <cfdump var =#arguments.teatreId#>
    <cfabort>
    <cfquery name="screenList" datasource="cruddb">
        SELECT * FROM bookmyticket.moviepanel_screens 
        WHERE id = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.teatreId#">
    </cfquery>
    <cfreturn screenList>
</cffunction>

<div class="d-flex">
    <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i class="fas fa-pencil-alt"></i></a>
    <a href="#" class="btn btn-danger shadow btn-xs sharp"><i class="fa fa-trash"></i></a>
</div>



<cfinclude template="../section/dash-header.cfm">
<cfinclude template ="./createmovie.cfm"> 
<cfset newInstance = createObject("component","movie-ticket/components.movies")> 
<cfset moviesList = newInstance.findMoviesList()> 
<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Movies</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">Manage Movies</a></li>
            </ol>
        </div>
    <div class="row">
        <div class="col-12">
            <cfif isDefined("aMessageSuccess")>
                <div class="alertSuccess" id="alertSuccess">
                  <cfoutput>
                      <span class="closebtndash" onclick="closeAlertBoxSuccess()">&times</span> 
                      <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccess))>
                      <p>#showMessageSuccess#</p>
                  </cfoutput>
                </div>
            </cfif>
            <cfif isDefined("aMessages")>
                <div class="alertClass" id="alertClass">
                    <cfoutput>
                        <span class="closebtn" onclick="closeAlertBox()">&times</span> 
                        <cfset showMessage = ToString(ToBinary(aMessages))>
                        <p>#showMessage#</p>
                    </cfoutput>
                </div>
            </cfif>
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"></h4>
                    <button type="button" class="movie btn btn-primary mb-2" data-bs-toggle="modal" 
                    data-bs-target=".bd-movie-modal-lg">Create</button>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example" class="display" style="min-width: 845px">
                            <thead>
                                <tr>
                                    <th>Poster</th>
                                    <th>Wallpaper</th>
                                    <th>Name</th>
                                    <th>Release<p>Date</p></th>
                                    <th>Format</th>
                                    <th>genre</th>
                                    <th>Language</th>
                                    <th>Duration</th>
                                    <th>Description</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
        
                                </tr>
                            </thead>
                            <tbody>
                                
                                    <cfloop query = moviesList>
                                        <div class="accordion accordion-danger-solid" id="accordion-two">
                                            <div class="accordion-item">
                                              <div class="accordion-header  rounded-lg" id="accord-2One"
                                               data-bs-toggle="collapse" data-bs-target="#collapse2One"
                                                aria-controls="collapse2One" aria-expanded="true" role="button">
                                                <span class="accordion-header-text">Accordion Header One</span>
                                                <span class="accordion-header-indicator"></span>
                                                <!--- --->
                                                <tr>
                                                    <td>
                                                        <img style="width:10px" class="avatar-img" 
                                                        src="../uploads/#moviesList.poster#">
                                                    </td>
                                                    <td>
                                                        <img  style="width:10px" class="avatar-img" 
                                                        src="../uploads/#moviesList.wallpaper#">
                                                    </td>
                                                    <td>#moviesList.movieNames#</td>
                                                    <td>#moviesList.releaseDate#</td>
                                                    <td>#moviesList.movieFormat#</td>
                                                    <td>#moviesList.genre#</td>
                                                    <td>#moviesList.language#</td>
                                                    <td>#moviesList.duration#</td>
                                                    <td>#moviesList.description#</td>
                                                    <td>Trailer: #moviesList.trailerUrl#</td>
                                                    <td>
                                                        <button class="btn btn-outline btn-show">
                                                            <a href="./screens-showtime.cfm?theatreValue=#moviesList.id#">
                                                                Manage cast and crew</a>
                                                        </button>
                                                    </td>
                                                    <td>
                                                        <button class="movie btn btn-outline btn-show" data-id =#moviesList.id# 
                                                        data-bs-toggle="modal" data-bs-target=".bd-movie-modal-lg">
                                                        Edit
                                                        </button>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-outline btn-show">
                                                            <a href="./action.cfm?movieDelete=#moviesList.id#">
                                                            Delete</a>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <!---  --->
                                              </div>
                                              <div id="collapse2One" class="collapse accordion__body show" aria-labelledby="accord-2One" data-bs-parent="#accordion-two">
                                                <div class="accordion-body-text">
                                                   Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                </div>
                                              </div>
                                            </div>
                                        
                                    </cfloop>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<cfinclude template ="../section/dash-footer.cfm">

INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.screen_time_id =st.id




<cfif NOT isDefined("Session.movieTicketCredentials")>
	<cflocation url="./auth/signin.cfm" addtoken="no" /> 
<cfelse>
    <cflocation url="./admin/dashboard.cfm" addtoken="no" /> 
</cfif>

BETWEEN CAST ('2015-01-24' AS DATE) AND CAST ('2015-01-25' AS DATE); 