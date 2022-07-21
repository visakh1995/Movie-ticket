<div class="modal fade bd-movie-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="movie_modal_title"></h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="my-4" method="post" enctype="multipart/form-data" 
                                    action="" name="img_form" id="movieFormId">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name ="movieName" required
                                            id ="movie_name" placeholder="Movie Name">
                                            <input type="hidden" id="movie_id" name="movieId">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="date" class="form-control" name ="releaseDate" required
                                            id ="release_date" placeholder="dd-mm-yyyy" min="01-01-1920" max="01-01-2120">
                                            <label>Release Date</label>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-sm-6">
                                            <select  class="form-control" name = "movieFormat" 
                                            id="movie-formats" required> 
                                                <option value = "">Movie Format</option> 
                                                <option value = "2D">2D</option> 
                                                <option value = "3D">3D</option>  
                                                <option value = "4D">4D</option>  
                                            </select>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control"name ="genre" required
                                            id ="genre" placeholder="Genre">
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name ="language" required
                                            id ="language" placeholder="Language">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="time" class="form-control" name ="duration" required
                                            id ="duration" placeholder="Duration(h:m:s)">
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" name ="trailerUrl" required
                                            id ="trailer_url" placeholder="Trailer">
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" name ="description" required
                                            id ="desc" placeholder="description">
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-sm-6">
                                            <div class="input-group mb-3">
                                                <button class="btn btn-primary btn-sm" type="button">Wallpaper</button>
                                                <div class="form-file">
                                                    <input type="file" name ="wallpaper" id="poster" 
                                                    accept=".jpeg,.png,.gif,.jpg" class="form-file-input form-control">
                                                    <input type="hidden" name ="defaultWallpaper" id="default_wallpaper">
                                                </div>
                                            </div>
                                            <div class="img-show">
                                                <img style="width:40px" id="outputWallpaper" class="img-fluid"  />
                                            </div>
                                        </div>


                                        <div class="col-sm-6">
                                            <div class="input-group mb-3">
                                                <button class="btn btn-primary btn-sm" type="button">Poster</button>
                                                <div class="form-file">
                                                    <input type="file" name ="poster" id="poster"
                                                    accept=".jpeg,.png,.gif,.jpg" class="form-file-input form-control">
                                                    <input type="hidden" name ="defaultPoster" id="default_poster">
                                                </div>
                                            </div>
                                            <div class="img-show">
                                                <img style="width:40px" id="outputPoster" class="img-fluid"  />
                                            </div>
                                        </div>
                                    </div>


                                    <div class="modal-footer mt-3">
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



