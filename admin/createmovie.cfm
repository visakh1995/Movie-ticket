<div class="modal fade bd-movie-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <h4 id="movie_modal_title"></h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="my-4" method="post" enctype="multipart/form-data" 
                                    action="" name="img_form" id="movieFormId">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name ="movieName" required
                                                id ="movie_name" placeholder="Movie Name*">
                                                <input type="hidden" id="movie_id" name="movieId">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="date" class="form-control" name ="releaseDate" required
                                                id ="release_date" placeholder="Release Date*">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-sm-6">
                                                <select  class="form-control" name = "movieFormat" 
                                                id="movie-formats" required> 
                                                    <option value = "">--- Movie Format ---</option> 
                                                    <option value = "2D">2D</option> 
                                                    <option value = "3D">3D</option>  
                                                    <option value = "4D">4D</option>  
                                                </select>
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control"name ="genre" required
                                                id ="genre" placeholder="Genre*">
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name ="language" required
                                                id ="language" placeholder="Language*">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name ="duration" required
                                                id ="duration" placeholder="Duration(h:m:s)*">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-sm-6">
                                                <p>upload wallpaper</p>
                                                <input type="file" class="form-control" name ="wallpaper" 
                                                id="poster" placeholder="Upload Wallpaper*" 
                                                accept=".jpeg,.png,.gif,.jpg" >
                                                <input type="hidden" name ="defaultWallpaper" 
                                                id="default_wallpaper" placeholder="Upload Wallpaper*">
                                                <div class="img-show">
                                                    <img style="width:10px" id="outputWallpaper" class="img-fluid"  />
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <p>upload poster</p>
                                                <input type="file" class="form-control" name ="poster" 
                                                id="poster" placeholder="Upload Poster*" 
                                                accept=".jpeg,.png,.gif,.jpg" >
                                                <input type="hidden" name ="defaultPoster" 
                                                id="default_poster" placeholder="Upload poster*">
                                                <div class="img-show">
                                                    <img style="width:10px" id="outputPoster" class="img-fluid"  />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name ="trailerUrl" required
                                                id ="trailer_url" placeholder="TrailerURL">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name ="description" required
                                                id ="desc" placeholder="description*">
                 
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



