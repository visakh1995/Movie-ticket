<cfinclude template="../section/dashheader.cfm">
<cfinclude template ="./createmovie.cfm"> 
<cfset newInstance = createObject("component","movie-ticket/components.movies")> 
<cfset moviesList = newInstance.findMoviesList()> 
<div class="wrapper flex">
    <cfinclude template="../section/sidebar.cfm">
    <div>
        <section class="main-content">
            <div class="card">
                <button class="movie btn" data-id ="0" data-bs-toggle="modal" 
                data-bs-target=".movieModal">Add New Movie</button>
                <cfif isDefined("aMessageSuccess")>
                    <div class="alertSuccess" id="alertSuccess">
                      <cfoutput>
                          <span class="closebtndash" onclick="closeAlertBoxSuccess()">&times</span> 
                          <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccess))>
                          <p>#showMessageSuccess#</p>
                      </cfoutput>
                    </div>
                </cfif>
                <cfif isDefined("aMessages")>
                    <div class="alertClass" id="alertClass">
                        <cfoutput>
                            <span class="closebtn" onclick="closeAlertBox()">&times</span> 
                            <cfset showMessage = ToString(ToBinary(aMessages))>
                            <p>#showMessage#</p>
                        </cfoutput>
                    </div>
                </cfif>
                <table id="table_id" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>Poster</th>
                            <th>Wallpaper</th>
                            <th>Name</th>
                            <th>Release<p>Date</p></th>
                            <th>Format</th>
                            <th>genre</th>
                            <th>Language</th>
                            <th>Duration</th>
                            <th>Description</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>

                        </tr>
                    </thead>
                    <tbody>
                        <cfoutput>
                            <cfloop query = moviesList >
                                <tr>
                                    <td>
                                        <img class="avatar-img" 
                                        src="../uploads/#moviesList.poster#">
                                    </td>
                                    <td>
                                        <img class="avatar-img" 
                                        src="../uploads/#moviesList.wallpaper#">
                                    </td>
                                    <td>#moviesList.movieName#</td>
                                    <td>#moviesList.releaseDate#</td>
                                    <td>#moviesList.movieFormat#</td>
                                    <td>#moviesList.genre#</td>
                                    <td>#moviesList.language#</td>
                                    <td>#moviesList.duration#</td>
                                    <td>#moviesList.description#</td>
                                    <td>Trailer: #moviesList.trailerUrl#</td>
                                    <td>
                                        <button class="btn btn-outline btn-show">
                                            <a href="./screens-showtime.cfm?theatreValue=#moviesList.id#">
                                                Manage cast and crew</a>
                                        </button>
                                    </td>
                                    <td>
                                        <button class="movie btn btn-outline btn-show" data-id =#moviesList.id# 
                                        data-bs-toggle="modal" data-bs-target=".movieModal">
                                        Edit
                                        </button>
                                    </td>
                                    <td>
                                        <button class="btn btn-outline btn-show">
                                            <a href="./action.cfm?movieDelete=#moviesList.id#">
                                            Delete</a>
                                        </button>
                                    </td>
                                </tr>
                               
                            </cfloop>
                        </cfoutput>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</div>
<cfinclude template ="../section/footer.cfm">
