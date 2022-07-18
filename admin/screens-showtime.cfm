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
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Screen</h4>
                        <button type="button" class="screen btn btn-primary shadow btn-sm" data-bs-toggle="modal" 
                        data-bs-target=".bd-screen-modal-lg">Add Screen</button>
                    </div>
                    <div class="card-body">
                        <cfif isDefined("aMessageSuccess")>
                            <div>
                                <cfoutput>
                                    <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccess))>
                                    <div class="alert alert-primary solid alert-end-icon alert-dismissible fade show mt-3">
                                        <span><i class="mdi mdi-account-search"></i></span>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                        </button> Success! #showMessageSuccess#
                                    </div>
                                </cfoutput>
                            </div>
                        </cfif>
                        <cfif isDefined("aMessages")>
                            <div>
                                <cfoutput>
                                    <cfset showMessage = ToString(ToBinary(aMessages))>
                                    <div class="alert alert-danger solid alert-end-icon alert-dismissible fade show">
                                        <span><i class="mdi mdi-help"></i></span>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                        </button>
                                        <strong>Error!</strong> #showMessage#
                                    </div>
                                </cfoutput>
                            </div>
                        </cfif>
                        <div class="table-responsive">
                            <table class="table table-responsive-md" id="nonShowTab">
                                <thead>
                                    <tr>
                                        <th>Screen </th>
                                        <th>Gold </th>
                                        <th>Silver </th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfoutput>
                                        <cfloop query = screensList >
                                            <tr>
                                                <td>#screensList.screenName#</td>
                                                <td>#screensList.goldRate# Rs</td>
                                                <td>#screensList.silverRate# Rs</td>
                                                <td>
                                                    <button class="screen btn btn-outline btn-show" data-id =#screensList.id# 
                                                        data-bs-toggle="modal" data-bs-target=".bd-screen-modal-lg">
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline btn-show">
                                                        <a href="./action.cfm?screenDelete=#screensList.id#">
                                                            <i class="fa fa-trash"></i></a>
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
                        <h4 class="card-title">Show Time</h4>
                        <button type="button" class="showTime btn btn-primary shadow btn-sm" data-bs-toggle="modal" 
                        data-bs-target=".bd-showTime-modal-lg">Add Showtime</button>
                    </div>
                    <div class="card-body">
                        <cfif isDefined("aMessageSuccessShow")>
                            <div>
                                <cfoutput>
                                    <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccessShow))>
                                    <div class="alert alert-primary solid alert-end-icon alert-dismissible fade show mt-3">
                                        <span><i class="mdi mdi-account-search"></i></span>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                        </button> Success! #showMessageSuccess#
                                    </div>
                                </cfoutput>
                            </div>
                        </cfif>
                        <cfif isDefined("aMessagesShow")>
                            <div>
                                <cfoutput>
                                    <cfset showMessage = ToString(ToBinary(aMessagesShow))>
                                    <div class="alert alert-danger solid alert-end-icon alert-dismissible fade show">
                                        <span><i class="mdi mdi-help"></i></span>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                        </button>
                                        <strong>Error!</strong> #showMessage#
                                    </div>
                                </cfoutput>
                            </div>
                        </cfif>
                        <div class="table-responsive">
                            <table class="table table-responsive-md" id="nonShowTabOne">
                                <thead>
                                    <tr>
                                        <th>Show</th>
                                        <th>Screen</th>
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
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline btn-show">
                                                        <a href="./action.cfm?showTimeDelete=#timeList.id#">
                                                            <i class="fas fa-trash"></i></a>
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