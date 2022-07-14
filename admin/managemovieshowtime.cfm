<cfinclude template="../section/dash-header.cfm">
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfinclude template ="./createmovieshowtime.cfm"> 
<cfset allMovieShowTimeList = newInstance.findJoinList()> 

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Theaters</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">Manage Theaters</a></li>
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
                    <button type="button" class="movieShowTime btn btn-primary mb-2" data-bs-toggle="modal" 
                    data-bs-target=".bd-movieShowTime-modal-lg">Create</button>
                </div>
                <div class="card-body">
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
                                                                <button type="button" class="movieShowTime  btn-primary btn-sm" data-id =#allMovieShowTimeList.id# 
                                                                data-bs-toggle="modal" data-bs-target=".bd-movieShowTime-modal-lg">
                                                                Edit
                                                                </button>
                                                                <button type="button" class=" btn-primary btn-sm">
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
