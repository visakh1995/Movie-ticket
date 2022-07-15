<cfinclude template="../section/dash-header.cfm">
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
                    <button type="button" class="teater btn btn-primary mb-2" data-bs-toggle="modal" 
                    data-bs-target=".bd-example-modal-lg">Create</button>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example" class="display" style="min-width: 845px">
                            <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Movie on</th>
                                    <th>Booking Date</th>
                                    <th>Show Time</th>
                                    <th>Seats&amount</th>
                                    <th>Ticket Id</th>
                                    <th>Theater</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>a</td>
                                    <td>b</td>
                                    <td>c</td>
                                    <td>a</td>
                                    <td>b</td>
                                    <td>c</td>
                                    <td>a</td>
                                    <td>b</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<cfinclude template ="../section/dash-footer.cfm">
