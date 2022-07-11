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
                                    <th></th>
                                    <th>Poster</th>
                                    <th>Wallpaper</th>
                                    <th>Name</th>
                                    <th>Release</th>
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
                                    <tr>
                                        <td>
                                            <div class="accordion accordion-primary-solid" id="accordion-two">
                                                <div class="accordion-item">
                                                    <div class="accordion-header collapsed  rounded-sm" id="accord-3One" 
                                                        data-bs-toggle="collapse" data-bs-target="#collapse3One" 
                                                        aria-controls="collapse3One" aria-expanded="true" role="button">
                                                            <span class="accordion-header-indicator"></span>
                                                    </div>
                                                    <div id="collapse3One" class="collapse accordion__body" 
                                                        aria-labelledby="accord-3One" data-bs-parent="#accordion-three">
                                                        <cfoutput>   
                                                            <div class="accordion-body-text">
                                                                <p>Trailer</p> <p>#moviesList.trailerUrl#</p>
                                                                <button type="button" class="btn btn-primary btn-sm">
                                                                    <a href="./screens-showtime.cfm?theatreValue=#moviesList.id#">
                                                                        Manage cast and crew</a>
                                                                </button>
                                                                <button type="button" class="movie  btn-primary btn-sm" data-id =#moviesList.id# 
                                                                data-bs-toggle="modal" data-bs-target=".bd-movie-modal-lg">
                                                                Edit
                                                                </button>
                                                                <button type="button" class=" btn-primary btn-sm">
                                                                    <a href="./action.cfm?movieDelete=#moviesList.id#">
                                                                    Delete</a>
                                                                </button>
                                                            </div>
                                                        </cfoutput>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <cfoutput>
                                            <td>
                                                <img style="width:10px" class="avatar-img" 
                                                src="../uploads/#moviesList.poster#">
                                            </td>
                                            <td>
                                                <img  style="width:10px" class="avatar-img" 
                                                src="../uploads/#moviesList.wallpaper#">
                                            </td>
                                            <td>#moviesList.movieName#</td>
                                            <td>#moviesList.releaseDate#</td>
                                            <td>#moviesList.movieFormat#</td>
                                            <td>#moviesList.genre#</td>
                                            <td>#moviesList.language#</td>
                                            <td>#moviesList.duration#</td>
                                            <td>#moviesList.description#</td>
                                        </cfoutput>
                                    </tr>
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



