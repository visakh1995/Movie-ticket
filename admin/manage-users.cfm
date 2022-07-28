<cfinclude template="../section/dash-header.cfm">
<cfset newInstance = createObject("component","movie-ticket/components.users")> 
<cfset usersList = newInstance.findUsersList()> 

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Users</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">Manage Users</a></li>
            </ol>
        </div>
    <div class="row">
        <div class="col-12">
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
                </di>
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
                                    <th>Registered on</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <cfoutput>
                                    <cfloop query = usersList>
                                        <tr>
                                            <td>#usersList.userName#</td>
                                            <td>#usersList.email#</td>
                                            <td>#usersList.registeredOn#</td>
                                            <td>
                                            <button class="btn">
                                                <a href="./action.cfm?userDelete=#usersList.id#">
                                                    delete
                                                </a>
                                            </button></td>
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
