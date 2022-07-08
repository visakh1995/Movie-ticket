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
            <h3>Manage cast and crew</h3>
            <div class="card">
                <button class="screen btn" data-id ="0" data-bs-toggle="modal" 
                data-bs-target=".screenModal">Add new cast</button>
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
                            <th>Photo</th>
                            <th>Cast</th>
                            <th>Actor</th>
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
                data-bs-target=".showtimeModal">Add new crew</button>
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
                            <th>Photo</th>
                            <th>Crew Role</th>
                            <th>Person Name</th>
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


