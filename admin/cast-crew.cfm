<cfif isDefined("url.movieId")>
    <cfset movieId = url.movieId>
</cfif>
<cfinclude template="../section/dash-header.cfm">
<cfinclude template ="./create-cast.cfm"> 
<cfinclude template ="./create-crew.cfm"> 
<cfset newInstance = createObject("component","movie-ticket/components.movies")>
<cfset castList = newInstance.findMovieCastList(movieId)> 
<cfset crewList = newInstance.findMovieCrewList(movieId)> 
<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">CAST</h4>
                        <button type="button" class="cast btn btn-primary mb-2" data-bs-toggle="modal" 
                        data-bs-target=".bd-cast-modal-lg">Add Cast</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-responsive-md">
                                <thead>
                                    <tr>
                                        <th>Photo</th>
                                        <th>Cast</th>
                                        <th>Actor</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfoutput>
                                        <cfloop query = castList >
                                            <tr>
                                                <td>
                                                    <img style="width:30px" class="avatar-img" 
                                                    src="../uploads/#castList.actorPhoto#">
                                                </td>
                                                <td>#castList.characterName#</td>
                                                <td>#castList.actorName#</td>
                                                <td>
                                                    <button class="btn btn-outline btn-show">
                                                        <a href="./action.cfm?castDelete=#castList.id#">
                                                        Delete</a>
                                                    </button>
                                                </td>
                                            </tr>
                                        </cfloop>
                                    </cfoutput>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">CREW</h4>
                        <button type="button" class="crew btn btn-primary mb-2" data-bs-toggle="modal" 
                        data-bs-target=".bd-crew-modal-lg">Add Crew</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-responsive-md">
                                <thead>
                                    <tr>
                                        <th>Photo</th>
                                        <th>Crew Role</th>
                                        <th>Person Name</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfoutput>
                                        <cfloop query = crewList >
                                            <tr>
                                                <td>
                                                    <img style="width:30px" class="avatar-img" 
                                                    src="../uploads/#crewList.crewPhoto#">
                                                </td>
                                                <td>#crewList.roleName#</td>
                                                <td>#crewList.personsName#</td>
                                                <td>
                                                    <button class="btn btn-outline btn-show">
                                                        <a href="./action.cfm?crewDelete=#crewList.id#">
                                                        Delete</a>
                                                    </button>
                                                </td>
                                            </tr>
                                        </cfloop>
                                    </cfoutput>
                                </tbody>
                            </table>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<cfinclude template ="../section/dash-footer.cfm">3