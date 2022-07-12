<div class="modal fade bd-cast-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 id="cast_modal_title"></h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="my-4" method="post" enctype="multipart/form-data" 
                                    action="" name="img_form" id="castFormId">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name ="characterName" required
                                                id ="character_name" placeholder="Character Name*">
                                                <cfoutput>
                                                <input type="hidden" id="movie_id" value=#movieId# name="movieId">
                                                </cfoutput>
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name ="actorName" required
                                                id ="actor_name" placeholder="Actor Name*">
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-sm-6">
                                                <p>Actor Photo</p>
                                                <input type="file" class="form-control" name ="actorPhoto" 
                                                id="actor_photo" placeholder="Actor Photo*" 
                                                accept=".jpeg,.png,.gif,.jpg">
                                                <input type="hidden" name ="defaultActorPhoto" 
                                                id="default_actor_photo" placeholder="Actor Photo*">
                                                <div class="img-show">
                                                <img style="width:10px" id="outputActorPhoto"
                                                     class="img-fluid"  />
                                                </div>
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



