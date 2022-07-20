<div class="modal fade bd-crew-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="crew_modal_title"></h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="my-4" method="post" enctype="multipart/form-data" 
                                    action="" name="img_form" id="crewFormId">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name ="roleName" required
                                            id ="role_name" placeholder="Role Name*">
                                            <cfoutput>
                                                <input type="hidden" id="movie_id" value=#movieId# name="movieId">
                                            </cfoutput>                                            </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name ="personsName" required
                                            id ="persons_name" placeholder="Persons Name*">
                                        </div>
                                    </div>

                                    <div class="row mt-3">                               
                                        <div class="col-sm-6">
                                            <div class="input-group mb-3">
                                                <button class="btn btn-primary btn-sm" type="button">Photo</button>
                                                <div class="form-file">
                                                    <input type="file" name ="crewPhoto" id="crew_photo"
                                                    accept=".jpeg,.png,.gif,.jpg" class="form-file-input form-control">
                                                    <input type="hidden" name ="defaultCrewPhoto" 
                                                    id="default_crew_photo">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger light" 
                                        data-bs-dismiss="modal">
                                            Close
                                        </button>
                                        <button type="submit" class="btn btn-primary" 
                                        onclick ="return onAddressBookContactValidate()">
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



