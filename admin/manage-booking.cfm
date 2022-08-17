<cfinclude template="../section/dash-header.cfm">
<cfset newInstance = createObject("component","movie-ticket/components.users")> 
<cfset usersBookingList = newInstance.findUsersBookingList()> 
<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Booking</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">Manage Booking</a></li>
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
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example" class="display" style="min-width: 845px">
                            <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Movie</th>
                                    <th>Booking Date</th>
                                    <th>Show Time</th>
                                    <th>Seats&amount</th>
                                    <th>Ticket Id</th>
                                    <th>Theater</th>
                                </tr>
                            </thead>
                            <tbody>
                                <cfoutput>
                                    <cfloop query = usersBookingList>
                                        <tr>
                                            <td>#usersBookingList.userName#</td>
                                            <td>#usersBookingList.email#</td>
                                            <td>#usersBookingList.movieName#</td>
                                            <td>#usersBookingList.bookingTime#</td>
                                            <td>#usersBookingList.showStartTime#</td>
                                            <td>#usersBookingList.ticketCount#seats&#usersBookingList.totalPrice#rupees</td>
                                            <td>#usersBookingList.reservId#</td>
                                            <td>#usersBookingList.theaterName#</td>
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
