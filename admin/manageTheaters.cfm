<cfinclude template="../section/dash-header.cfm">
<cfinclude template ="./modal.cfm"> 
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset theatreList = newInstance.findTheatreList()> 
<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Theaters</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">Manage Theaters</a></li>
            </ol>
        </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"></h4>
                    <button type="button" class="teater btn btn-primary shadow btn-sm" data-bs-toggle="modal" 
                    data-bs-target=".bd-example-modal-lg">CREATE</button>
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
                        <table id="example" class="display">
                            <thead>
                                <tr>
                                    <th>Photo</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <cfoutput>
                                    <cfloop query = theatreList>
                                        <tr>
                                            <td>
                                                <img class="avatar-img" 
                                                src="../uploads/#theatreList.theaterphoto#">
                                            </td>
                                            <td>#theatreList.TheaterName#</td>
                                            <td>#theatreList.TheaterEmail#</td>
                                            <td>#theatreList.TheaterPhone#</td>
                                            <td>#theatreList.TheaterAddress#</td>
                                            <td>
                                                <button class="btn btn-primary shadow btn-xs">
                                                    <a href="./screens-showtime.cfm?theatreValue=#theatreList.id#">
                                                        Manage screen & show time
                                                    </a>
                                                </button>
                                            </td>
                                            <td>
                                                <button class="teater btn btn-outline btn-show"
                                                 data-id =#theatreList.id# 
                                                data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">
                                                    <i class="fas fa-pencil-alt"></i>
                                                </button>
                                            </td>
                                            <td>
                                                <a href="./action.cfm?teatreDelete=#theatreList.id#">
                                                    <i class="fa fa-trash"></i>
                                                </a>
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
<cfinclude template ="../section/dash-footer.cfm">
