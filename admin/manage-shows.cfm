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
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"></h4>
                    <button type="button" class="movie btn btn-primary shadow btn-sm" data-bs-toggle="modal" 
                    data-bs-target=".bd-movie-modal-lg">CREATE</button>
                </div>
                <div class="card-body">
                    <cfif isDefined("aMessageSuccess")>
                        <div>
                            <cfoutput>
                                <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccess))>
                                <div class="alert alert-primary solid alert-end-icon alert-dismissible fade show mt-3">
                                    <span><i class="mdi mdi-account-search"></i></span>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                    </button> Success! #showMessageSuccess#
                                </div>
                            </cfoutput>
                        </div>
                    </cfif>
                    <cfif isDefined("aMessages")>
                        <div>
                            <cfoutput>
                                <cfset showMessage = ToString(ToBinary(aMessages))>
                                <div class="alert alert-danger solid alert-end-icon alert-dismissible fade show">
                                    <span><i class="mdi mdi-help"></i></span>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                    </button>
                                    <strong>Error!</strong> #showMessage#
                                </div>
                            </cfoutput>
                        </div>
                    </cfif>
                    <div class="table-responsive">
                        <table id="example" class="display">
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
                                                                <button type="button" class="badge badge-pill badge-light">
                                                                    <a href="./cast-crew.cfm?movieId=#moviesList.id#">
                                                                        Manage cast and crew</a>
                                                                </button>
                                                                <button type="button" class="movie badge badge-rounded badge-info mt-3" data-id =#moviesList.id# 
                                                                data-bs-toggle="modal" data-bs-target=".bd-movie-modal-lg">
                                                                Edit
                                                                </button>
                                                                <button type="button" class="badge badge-rounded badge-danger">
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
                                                <img class="avatar-img" 
                                                src="../uploads/#moviesList.poster#">
                                            </td>
                                            <td>
                                                <img class="avatar-img" 
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



