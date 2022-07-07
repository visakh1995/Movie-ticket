<div class="modal fade movieModal" tabindex="-1" aria-labelledby="movieModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-contente">
        <div class="modal-body">
            <div class="modal-content">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <div class="contact-list">
                    <div class="modal-container ">
                        <div class="modal-head">
                        <h2><span id="movie_modal_title"></span></h2>
                        <div id="alert"></div>
                    </div>
                    <form class="my-4" method="post" enctype="multipart/form-data" 
                        action="" name="img_form" id="formId">
                        <div class="modal-body">
                            <div class="form-control">
                                <input type="text" name ="poster" required
                                id ="poster" placeholder="Poster*">
                                <input type="hidden" name="TheaterId" 
                                id="TheaterId" >
                            </div>
                            <div class="form-control">
                                <input type="email" name ="email" required
                                id ="email" placeholder="Email*" 
                                onclick ="return onValidateEmail()">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="phone" required
                                id ="phone" placeholder="Phone*">
                            </div>
                        </div>
        
                        <div class="modal-body-inclusive">
                            <div class="form-control">
                                <input type="text" name ="address" required
                                id ="address" placeholder="Address*">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="street" required
                                id ="street" placeholder="Street*">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="pinCode" required
                                id ="pinCode" placeholder="Pincode*">
                            </div>
                        </div>

                        <div class="modal-body">
                            <div class="form-control photo">
                                <input type="file" name ="photo" 
                                id="photo" placeholder="Upload photo*" 
                                accept=".jpeg,.png,.gif,.jpg" >
                                <input type="hidden" name ="defaultPhoto" 
                                id="defaultPhoto" placeholder="Upload photo*">
                                <div class="img-show">
                                    <img id="output" class="img-fluid"  />
                                </div>
                            </div>
                        </div>
        
                        <button class="btn modal-btn"
                            onclick ="return onAddressBookContactValidate()">Submit
                        </button>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    </div>
</div>
