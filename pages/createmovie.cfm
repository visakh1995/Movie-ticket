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
                        action="" name="img_form" id="movieFormId">
                        <div class="modal-body">
                            <div class="form-control">
                                <input type="text" name ="movieName" required
                                id ="movie_name" placeholder="Movie Name*">
                                <input type="hidden" id="movie_id" name="movieId">

                            </div>
                            <div class="form-control">
                                <input type="date" name ="releaseDate" required
                                id ="release_date" placeholder="Release Date*">
                            </div>
                            <div class="form-control">
                                <select  class="fullWidth" name = "movieFormat" id="movie-format" required> 
                                    <option value = "">--- Movie Format ---</option> 
                                    <option value = "2D">2D</option> 
                                    <option value = "3D">3D</option>  
                                    <option value = "4D">4D</option>  
                                </select>
                            </div>
                        </div>
        
                        <div class="modal-body-inclusive">
                            <div class="form-control">
                                <input type="text" name ="genre" required
                                id ="genre" placeholder="Genre*">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="language" required
                                id ="language" placeholder="Language*">
                            </div>
                            <div class="form-control">
                                <input type="text" name ="duration" required
                                id ="duration" placeholder="Duration(h:m:s)*">
                            </div>
                        </div>

                        <div class="modal-body">
                            <div class="form-control">
                                <input type="text" name ="trailerUrl" required
                                id ="trailer_url" placeholder="TrailerURL">
                            </div>
                            <div class="form-control photo">
                                <p>upload poster</p>
                                <input type="file" name ="poster" 
                                id="poster" placeholder="Upload Poster*" 
                                accept=".jpeg,.png,.gif,.jpg" >
                                <input type="hidden" name ="defaultPoster" 
                                id="default_poster" placeholder="Upload poster*">
                                <div class="img-show">
                                    <img id="outputPoster" class="img-fluid"  />
                                </div>
                            </div>
                            <div class="form-control photo">
                                <p>upload wallpaper</p>
                                <input type="file" name ="wallpaper" 
                                id="poster" placeholder="Upload Wallpaper*" 
                                accept=".jpeg,.png,.gif,.jpg" >
                                <input type="hidden" name ="defaultWallpaper" 
                                id="default_wallpaper" placeholder="Upload Wallpaper*">
                                <div class="img-show">
                                    <img id="outputWallpaper" class="img-fluid"  />
                                </div>
                            </div>
                        </div>

                        <div class="modal-body-inclusive">
                            <div class="form-control">
                                <input type="text" name ="description" required
                                id ="desc" placeholder="description*">
                            </div>
                        </div>
        
                        <button class="btn modal-btn"
                            onclick ="return onMovieValidate()">Submit
                        </button>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    </div>
</div>
