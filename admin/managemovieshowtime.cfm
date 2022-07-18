<cfinclude template="../section/dash-header.cfm">
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfinclude template ="./createmovieshowtime.cfm"> 
<cfset allMovieShowTimeList = newInstance.findJoinList()> 

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Shows</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">Manage Shows</a></li>
            </ol>
        </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"></h4>
                    <button type="button" class="movieShowTime btn btn-primary mb-2" data-bs-toggle="modal" 
                    data-bs-target=".bd-movieShowTime-modal-lg">Create</button>
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
                        <table id="example" class="display" style="min-width: 845px">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Poster</th>
                                    <th>Movie Name</th>
                                    <th>Theater</th>
                                    <th>Screen</th>
                                    <th>Start Date</th>
                                    <th>Starting Time</th>
                                    <th>Duration</th>
                                    <th>Ending Time</th>
                                    <th>Show End Date</th>
                                    <th>Show Status</th>
                                    <th>Show Priority</th>
                                </tr>
                            </thead>
                            <tbody>
                                <cfloop query = allMovieShowTimeList>
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
                                                                <button type="button" class="movieShowTime  badge badge-rounded badge-primary" data-id =#allMovieShowTimeList.id# 
                                                                data-bs-toggle="modal" data-bs-target=".bd-movieShowTime-modal-lg">
                                                                Edit
                                                                </button>
                                                                <button type="button" class="badge badge-rounded badge-danger">
                                                                    <a href="./action.cfm?movieShowTimeDelete=#allMovieShowTimeList.id#">
                                                                    Delete</a>
                                                                </button>
                                                            </div>
                                                        </cfoutput>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <cfoutput>
                                            <td>#allMovieShowTimeList.movieName#</td>
                                            <td>#allMovieShowTimeList.movieName#</td>
                                            <td>#allMovieShowTimeList.theaterName#</td>
                                            <td>#allMovieShowTimeList.screenName#</td>
                                            <td>#allMovieShowTimeList.releasedate#</td>
                                            <td>#allMovieShowTimeList.showStartTime#</td>
                                            <td>#allMovieShowTimeList.duration#</td>
                                            <td>#allMovieShowTimeList.duration#</td>
                                            <td>#allMovieShowTimeList.endDate#</td>
                                            <td>Pending</td>
                                            <td>#allMovieShowTimeList.showPriority#</td>
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
