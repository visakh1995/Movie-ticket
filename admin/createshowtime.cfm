<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset screensList = newInstance.findScreensList(teatreId)> 
<div class="modal fade showtimeModal" tabindex="-1" aria-labelledby="showtimeModal" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-contente">
        <div class="modal-body">
            <div class="modal-content">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <div class="contact-list">
                    <div class="modal-container">
                        <div class="modal-head">
                        <h2><span id="modal_title_time" name="titles"></span></h2>
                        <div id="alert"></div>
                    </div>
                    <form class="my-4" method="post" enctype="multipart/form-data" 
                        action="" name="img_form" id="timeFormId">
                        <div class="modal-body">
                            <div class="form-control">
                                <select  class="fullWidth" name = "showName" id="show_name" required> 
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
                            <div class="form-control">
                                <select  class="fullWidth" name = "screen" id="screen" required> 
                                    <option value = "">--- Select ---</option> 
                                    <cfoutput>
                                      <cfloop query = screensList> 
                                           <option value="#screensList.id#">#screensList.screenName#</option> 
                                       </cfloop> 
                                    </cfoutput>
                                </select>
                            </div>
                            <div class="form-control">
                                <input type="text" name ="showStartTime" required
                                id ="show_start_time" placeholder="Show start time*">
                            </div>
                        </div>
                        <button class="btn modal-btn"
                            onclick ="return onShowTimeCreateValidate()">Submit
                        </button>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    </div>
</div>
