<cfinclude template="../section/dash-header.cfm">
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset allMovieShowTimeList = newInstance.findJoinList()> 
<cfdump var =#allMovieShowTimeList#>
<cfinclude template ="./createmovieshowtime.cfm"> 

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
                                <cfoutput>
                                    <cfloop query = theatreList>
                                        <tr>
                                            <td>#theatreList.TheaterName#</td>
                                            <td>#theatreList.TheaterName#</td>
                                            <td>#theatreList.TheaterEmail#</td>
                                            <td>#theatreList.TheaterName#</td>
                                            <td>#theatreList.TheaterName#</td>
                                            <td>#theatreList.TheaterEmail#</td>
                                            <td>#theatreList.TheaterPhone#</td>
                                            <td>#theatreList.TheaterAddress#</td>
                                            <td>
                                                <button class="btn btn-primary shadow btn-xs ">
                                                    <a href="./screens-showtime.cfm?theatreValue=#theatreList.id#">
                                                        Manage screen & show time
                                                    </a>
                                                </button>
                                            </td>
                                            <td>
                                                <button class="teater btn btn-outline btn-show"
                                                 data-id =#theatreList.id# 
                                                data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">
                                                    <i class="fas fa-pencil-alt"></i>
                                                </button>
                                            </td>
                                            <td>
                                                <a href="./action.cfm?teatreDelete=#theatreList.id#">
                                                    <i class="fa fa-trash"></i>
                                                </a>
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
<cfinclude template ="../section/dash-footer.cfm">
