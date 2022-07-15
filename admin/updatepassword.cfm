<cfinclude template="../section/dash-header.cfm">
<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-8 col-lg-8">
                <div class="card">
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
                    <div class="card-header">
                        <h4 class="card-title">Manage Password</h4>
                    </div>
                    <div class="card-body">
                        <div class="basic-form">
                            <form method="post" action="../components/moviefunctions.cfc?method=updatePassword" 
                            name="passwordForm" id="password_form">
                                <div class="mb-3">
                                    <input type="text" class="form-control input-rounded" 
                                    placeholder="Old Password" name ="oldPassword">
                                </div>
                                <div class="mb-3">
                                    <input type="text" class="form-control input-rounded" 
                                    placeholder="New Password" name ="newPassword">
                                </div>
                                <div class="mb-3">
                                    <input type="text" class="form-control input-rounded"
                                     placeholder="Confirm Password" name ="confirmPassword">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    Update password
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</div>
<cfinclude template ="../section/dash-footer.cfm">