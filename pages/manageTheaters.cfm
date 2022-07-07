<cfinclude template="../section/dashheader.cfm">
<cfinclude template ="./modal.cfm"> 
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset theatreList = newInstance.findTheatreList()> 
<div class="wrapper flex">
    <cfinclude template="../section/sidebar.cfm">
    <div>
        <section class="main-content">
            <div class="card">
                <button class="teater btn" data-id ="0" data-bs-toggle="modal" 
                data-bs-target=".exampleModal">CREATE</button>
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
                <table id="table_id" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>View</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfoutput>
                            <cfloop query = theatreList >
                                <tr>
                                    <td>
                                        <img class="avatar-img" 
                                        src="../uploads/#theatreList.TheaterPhoto#">
                                    </td>
                                    <td>#theatreList.TheaterName#</td>
                                    <td>#theatreList.TheaterEmail#</td>
                                    <td>#theatreList.TheaterPhone#</td>
                                    <td>#theatreList.TheaterAddress#</td>
                                    <td>
                                        <button class="btn btn-outline btn-show">
                                            <a href="./screens-showtime.cfm?theatreValue=#theatreList.id#">
                                                Manage screen & show time</a>
                                        </button>
                                    </td>
                                    <td>
                                        <button class="teater btn btn-outline btn-show" data-id =#theatreList.id# 
                                        data-bs-toggle="modal" data-bs-target=".exampleModal">
                                        Edit
                                        </button>
                                    </td>
                                    <td>
                                        <button class="btn btn-outline btn-show">
                                            <a href="./action.cfm?teatreDelete=#theatreList.id#">
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
