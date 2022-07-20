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
                        <h4 class="card-title">Cast</h4>
                        <button type="button" class="cast btn btn-primary shadow btn-sm" data-bs-toggle="modal" 
                        data-bs-target=".bd-cast-modal-lg">Add Cast</button>
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
                            <table id="nonShowTab" class="table table-responsive-md">
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
                                                            <i class="fa fa-trash"></i>
                                                        </a>
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
                        <h4 class="card-title">Crew</h4>
                        <button type="button" class="crew btn btn-primary shadow btn-sm" data-bs-toggle="modal" 
                        data-bs-target=".bd-crew-modal-lg">Add Crew</button>
                    </div>
                    <div class="card-body">
                        <cfif isDefined("aMessageSuccessShow")>
                            <div>
                                <cfoutput>
                                    <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccessShow))>
                                    <div class="alert alert-primary solid alert-end-icon alert-dismissible fade show mt-3">
                                        <span><i class="mdi mdi-account-search"></i></span>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                        </button> Success! #showMessageSuccess#
                                    </div>
                                </cfoutput>
                            </div>
                        </cfif>
                        <cfif isDefined("aMessagesShow")>
                            <div>
                                <cfoutput>
                                    <cfset showMessage = ToString(ToBinary(aMessagesShow))>
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
                            <table id="nonShowTabOne" class="table table-responsive-md">
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
                                                            <i class="fa fa-trash"></i>
                                                        </a>
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