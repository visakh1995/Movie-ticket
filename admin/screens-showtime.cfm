<cfif isDefined("url.theatreValue")>
    <cfset teatreId = url.theatreValue>
</cfif>
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")>
<cfset screensList = newInstance.findScreensList(teatreId)> 
<cfset showTimesList = newInstance.findShowTimesList(teatreId)> 
<cfinclude template="../section/dash-header.cfm">
<cfinclude template ="./createscreen.cfm"> 
<cfinclude template ="./createshowtime.cfm"> 

<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6">
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
                        <h4 class="card-title">SCREEN</h4>
                        <button type="button" class="screen btn btn-primary mb-2" data-bs-toggle="modal" 
                        data-bs-target=".bd-screen-modal-lg">Add Screen</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-responsive-md">
                                <thead>
                                    <tr>
                                        <th>Screen Name</th>
                                        <th>Gold Ticket</th>
                                        <th>Silver Ticket</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfoutput>
                                        <cfloop query = screensList >
                                            <tr>
                                                <td>#screensList.screenName#</td>
                                                <td>#screensList.goldRate#</td>
                                                <td>#screensList.silverRate#</td>
                                                <td>
                                                    <button class="screen btn btn-outline btn-show" data-id =#screensList.id# 
                                                        data-bs-toggle="modal" data-bs-target=".bd-screen-modal-lg">
                                                        Edit
                                                    </button>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline btn-show">
                                                        <a href="./action.cfm?screenDelete=#screensList.id#">
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
                        <h4 class="card-title">SHOWTIME</h4>
                        <button type="button" class="showTime btn btn-primary mb-2" data-bs-toggle="modal" 
                        data-bs-target=".bd-showTime-modal-lg">Add Showtime</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-responsive-md">
                                <thead>
                                    <tr>
                                        <th>Show Name</th>
                                        <th>Screen Name</th>
                                        <th>Start Time</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfoutput>
                                        <cfloop array = "#showTimesList#" index="timeList">
                                            <tr>
                                                <td>#timeList.showName#</td>
                                                <td>#timeList.screenName#</td>
                                                <td>#timeList.showStartTime#</td>
                                                <td>
                                                    <button class="showTime btn btn-outline btn-show" data-id =#timeList.id# 
                                                        data-bs-toggle="modal" data-bs-target=".bd-showTime-modal-lg">
                                                        Edit
                                                    </button>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline btn-show">
                                                        <a href="./action.cfm?showTimeDelete=#timeList.id#">
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
<cfinclude template ="../section/dash-footer.cfm">