<div class="modal fade bd-screen-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="modal_title"></h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="my-4" method="post" enctype="multipart/form-data" 
                                    action="" name="img_form" id="formId">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control"  
                                            name ="screenName" required
                                            id ="screen_name" placeholder="Screen name">
                                            <cfoutput>
                                                <input type="hidden" name="theatreId" value="#teatreId#" 
                                                id="theatreId">
                                                <input type="hidden" name="screenId" id="screen_id">
                                            </cfoutput>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control" 
                                                name ="goldRate" required
                                            id ="gold_rate" placeholder="Gold rate">
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control"  
                                            name ="silverRate" required
                                            id ="silver_rate" placeholder="Silver rate">
                                        </div>
                                    </div>

                                    <div class="modal-footer mt-3">
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



