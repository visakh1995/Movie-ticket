<cfinclude template="../section/dashheader.cfm">
<cfif isDefined("url.theatreValue")>
    <cfset teatreId = url.theatreValue>
</cfif>
<cfinclude template ="./createscreen.cfm"> 
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset screensList = newInstance.findScreensList()> 
<div class="wrapper flex">
    <div class="sidebar ">
        <div class="profile">
            <img src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg" alt="profile_picture">
            <h3>Admin</h3>
        </div>
        <div>
            <ul>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">My Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item"><a href="./manageTheaters.cfm">Manage Teatres</a></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">Manage Movies</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">Manage Shows</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">Manage Users</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">Manage Bookings</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">View Contactinfo</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">Update Password</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

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
                <button class="teater btn" data-id ="0" data-bs-toggle="modal" 
                data-bs-target=".screenModal">Add new time</button>
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
                            <cfloop query = screensList >
                                <tr>
                                    <td>#screensList.screenName#</td>
                                    <td>#screensList.goldRate#</td>
                                    <td>#screensList.silverRate#</td>
                                    <td>
                                        <button class="teater btn btn-outline btn-show" data-id ="1" 
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
            <!---  --->
        </section>
    </div>
</div>
<cfinclude template ="../section/footer.cfm">


