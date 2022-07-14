<cfset movieList = newInstance.findAllMoviesList()> 
<cfset theatreList = newInstance.findTheatreList()> 
<cfset screensList = newInstance.findAllScreensList()> 

<div class="modal fade bd-movieShowTime-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <h4 id="modal_movie_showtime_title"></h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="my-4" method="post" enctype="multipart/form-data" 
                                    action="" name="img_form" id="movieShowTimeFormId">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <select  class="form-control" name = "movie" id="movie" required> 
                                                    <option value = "">--- Select Movie---</option> 
                                                    <cfoutput>
                                                        <cfloop query = movieList> 
                                                            <option value="#movieList.id#">#movieList.movieName#</option> 
                                                        </cfloop> 
                                                    </cfoutput>
                                                </select>
                                                <input type="hidden" name="movieShowTimeId" id="movie_show_time_id">
                                            </div>
                                            <div class="col-sm-6">
                                                <select  class="form-control" name = "theater" id="theater" required> 
                                                    <option value = "">--- Select Theatre---</option> 
                                                    <cfoutput>
                                                      <cfloop query = theatreList> 
                                                           <option value="#theatreList.id#">#theatreList.theaterName#</option> 
                                                       </cfloop> 
                                                    </cfoutput>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-sm-6">
                                                <select  class="form-control" name = "screen" id="screen" onchange="screenList()" required> 
                                                    <option value = "">--- Select Screen ---</option> 
                                                    <cfoutput>
                                                      <cfloop query = screensList> 
                                                           <option value="#screensList.id#">#screensList.screenName#</option> 
                                                       </cfloop> 
                                                    </cfoutput>
                                                </select>
                                            </div>
                                            <div class="col-sm-6">
                                                <select  class="form-control" name = "showName" id="show_name" required> 
                                                    <option value = "">--- Select ---</option> 
                                                    <option value = "First_show">First show</option> 
                                                    <option value = "Noon_show">Noon Show</option>  
                                                    <option value = "Second_show">Second Show</option>  
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-sm-6">
                                                <input type="date" name ="endDate" class="form-control" required
                                                id ="end_date" placeholder="Planned End Date*">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" name ="showPriority" class="form-control" required
                                                id ="show_priority" placeholder="Show priority*">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-sm-6">
                                                <input type="text" name ="totalSeats" class="form-control" required
                                                id ="total_seats" placeholder="Total Seats*">
                                            </div>
                                            <div class="col-sm-6">
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



