<cfset screensList = newInstance.findScreensList(teatreId)> 
<div class="modal fade bd-showTime-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="modal_title_time"></h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="my-4" method="post" enctype="multipart/form-data" 
                                    action="" name="img_form" id="timeFormId">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <select  class="form-control" name = "showName" id="show_name" required> 
                                                <option value = "">--- Select ---</option> 
                                                <option value = "First_show">First show</option> 
                                                <option value = "Noon_show">Noon Show</option>  
                                                <option value = "Second_show">Second Show</option>  
                                            </select>
                                            <cfoutput>
                                                <input type="hidden" name="theatreId" value="#teatreId#" id="theatreId">
                                                <input type="hidden" name="showId"  id="show_id">
                                            </cfoutput>
                                        </div>
                                        <div class="col-sm-6">
                                            <select  class="form-control" name = "screen" id="screen" required> 
                                                <option value = "">--- Select ---</option> 
                                                <cfoutput>
                                                    <cfloop query = screensList> 
                                                        <option value="#screensList.id#">#screensList.screenName#</option> 
                                                    </cfloop> 
                                                </cfoutput>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-sm-6">
                                            <input type="time" class="form-control"name ="showStartTime"
                                                required id ="show_start_time" placeholder="Show start time*">
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger light" 
                                        data-bs-dismiss="modal">
                                            Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">
                                            Save changes
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>