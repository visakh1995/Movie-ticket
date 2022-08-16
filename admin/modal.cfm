<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="modal_title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                    <div class="card">
                        <div id="alert"></div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="my-4" method="post" enctype="multipart/form-data" 
                                    action="" name="img_form" id="formId">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name ="TheaterName" required
                                            id ="theatre_name" placeholder="Theater Name*">
                                            <input type="hidden" name="TheaterId" 
                                            id="TheaterId">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="email" name ="email" class="form-control" required
                                            id ="email" placeholder="Email*">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-sm-6">
                                            <input type="text" name ="address" class="form-control" required
                                            id ="address" placeholder="Address*">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" name ="street" class="form-control" required
                                            id ="street" placeholder="Street*">
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-sm-6">
                                            <input type="number" name ="pinCode" class="form-control" required
                                            id ="pinCode" placeholder="Pincode*">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="number" name ="phone" class="form-control" required
                                            id ="phone" placeholder="Phone*">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-sm-6">
                                            <div class="input-group mb-3">
                                                <button class="btn btn-primary btn-sm" type="button">Photo</button>
                                                <div class="form-file">
                                                    <input type="file" name ="photo" id="photo" 
                                                    accept=".jpeg,.png,.gif,.jpg" class="form-file-input form-control">
                                                    <input type="hidden" name ="defaultPhoto" id="default_photo" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="img-show">
                                                <img style="width:20%" id="output"/>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger light" 
                                        data-bs-dismiss="modal">
                                            Close
                                        </button>
                                        <button type="submit" class="btn btn-primary" 
                                        onclick ="return onMovieTicketTheaterValidate()">
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



