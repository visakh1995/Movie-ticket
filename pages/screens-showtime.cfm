<cfinclude template="../section/dashheader.cfm">
<cfif isDefined("url.theatreValue")>
    <cfset teatreId = url.theatreValue>
</cfif>
<cfinclude template ="./createscreen.cfm"> 
<cfinclude template ="./createshowtime.cfm"> 
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")>
<cfset screensList = newInstance.findScreensList(teatreId)> 
<cfset showTimesList = newInstance.findShowTimesList(teatreId)> 
<div class="wrapper flex">
    <cfinclude template="../section/sidebar.cfm">
    <div>
        <section class="main-content">
            <h3>Manage screen and show time</h3>
            <div class="card">
                <button class="screen btn" data-id ="0" data-bs-toggle="modal" 
                data-bs-target=".screenModal">Add new screen</button>
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
                <table class="display nowrap" style="width:100%">
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
                                            data-bs-toggle="modal" data-bs-target=".screenModal">
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
            <!--- show time--->
            <div class="card">
                <button class="showTime btn" data-id ="0" data-bs-toggle="modal" 
                data-bs-target=".showtimeModal">Add new show time</button>
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
                <table class="display nowrap" style="width:100%">
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
                            <cfloop query = showTimesList >
                                <tr>
                                    <td>#showTimesList.showName#</td>
                                    <td>#showTimesList.screen#</td>
                                    <td>#showTimesList.showStartTime#</td>
                                    <td>
                                        <button class="showTime btn btn-outline btn-show" data-id =#showTimesList.id# 
                                            data-bs-toggle="modal" data-bs-target=".showTimeModal">
                                            Edit
                                        </button>
                                    </td>
                                    <td>
                                        <button class="btn btn-outline btn-show">
                                            <a href="./action.cfm?showTimeDelete=#showTimesList.id#">
                                            Delete</a>
                                        </button>
                                    </td>
                                </tr>
                            </cfloop>
                        </cfoutput>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</div>
<cfinclude template ="../section/footer.cfm">


