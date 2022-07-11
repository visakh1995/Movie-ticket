<div class="modal fade screenModal" tabindex="-1" aria-labelledby="screenModal" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-contente">
        <div class="modal-body">
            <div class="modal-content">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <div class="contact-list">
                    <div class="modal-container">
                        <div class="modal-head">
                        <h2><span id="modal_title"></span></h2>
                        <div id="alert"></div>
                    </div>
                    <form class="my-4" method="post" enctype="multipart/form-data" 
                        action="" name="img_form" id="formId">
                        <div class="modal-body">
                            <div class="form-control">
                                <input type="text" name ="screenName" required
                                id ="screen_name" placeholder="Screen Name">
                                <cfoutput>
                                    <input type="hidden" name="theatreId" value="#teatreId#" id="theatreId">
                                    <input type="hidden" name="screenId" id="screen_id">
                                </cfoutput>
                            </div>
                            <div class="form-control">
                                <input type="text" name ="goldRate" required
                                id ="gold_rate" placeholder="Gold Rate*">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="silverRate" required
                                id ="silver_rate" placeholder="Silver Rate*">
                            </div>
                        </div>
                        <button class="btn modal-btn"
                            onclick ="return onScreenCreateValidate()">Submit
                        </button>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    </div>
</div>
