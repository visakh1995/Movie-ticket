<cfif isDefined("movieId")>
   <cfset movieId = ToString(ToBinary(movieId))>
   <cfset findmovieDetails = createObject("component","movie-ticket/components.webside")> 
   <cfset movie_details = findmovieDetails.webMovieDetailsById(movieId)>
   <cfset movie_cast_details = findmovieDetails.webMovieCastById(movieId)>
   <cfset movie_crew_details = findmovieDetails.webMovieCrewById(movieId)>
   <cfset allShowingMovies = findmovieDetails.frontEndShowAllMovies()> 
</cfif>
<cfinclude template="../theme/web-header.cfm">  

<section class="section-content pv12 bg-cover" data-bg-image="../assets/web/images/blog/bg-single.jpg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <cfoutput>
                    <article class="blog-item single">
                        <div class="col-md-4 col-sm12 post-image hover-dark" 
                            data-bg-image="../uploads/#movie_details.wallpaper#"></div>
                        <div class="col-md-8 col-sm-12 col-xs-12 ph0">
                            <div class="post-content bg-cover" 
                                data-bg-image="../assets/web/images/blog/post-single.jpg">
                                <div class="content-meta"> 
                                    <h2 class="entry-title">#movie_details.movieName#
                                    <span>Synopsis</span>
                                    </h2>
                                    <div class="social-links">
                                        <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                        <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                                        <a href="javascript:;"><i class="fa fa-user"></i></a>
                                    </div>
                                </div>
                                <p class="entry-text">#movie_details.description#</p>
                                <div class="info-content">
                                    <ul class="item-info">
                                        <li><span>Duration:</span>  <p>#movie_details.duration#</p></li>
                                        <li><span>Genre:</span>  <p>#movie_details.genre#</p></li>
                                        <li><span>Language:</span>  <p>#movie_details.language#</p></li>
                                        <li><span>Type:</span>  <p>#movie_details.movieFormat#</p></li>
                                        <li><span>Release Date:</span> <p>#movie_details.releaseDate#</p></li>
                                    </ul>
                                    <div class="item-info-rate">
                                        <div class="chart-cirle">
                                            <div class="chart-circle-l">
                                                <div class="circle-chart" data-circle-width="7" data-percent="64" 
                                                data-text="6.4">
                                                </div>
                                                <span>AMDB Rating</span> 
                                            </div>
                                            <div class="chart-circle-r">
                                                <div class="circle-chart" data-circle-width="7" data-percent="84"
                                                data-text="8.4">
                                                </div>
                                                <span>Rotten Rating</span> 
                                            </div>
                                        </div>
                                    </div>
                                </div>                       
                                <div class="content-footer"> 
                                    <span>Available time:</span>
                                    <ul class="mdate"> 
                                        <li><a href="javascript:;"><i>16:40</i></a></li> 
                                        <li><a href="javascript:;"><i>18:10</i></a></li> 
                                        <li><a href="javascript:;"><i>20:20</i></a></li> 
                                        <li><a href="javascript:;"><i>21:20</i></a></li> 
                                    </ul> 
                                    <cfset local.encryptId = ToBase64(movie_details.id)/>
                                    <a href="./prebooking.cfm?movieId=#local.encryptId#" class="btn order text-right"> Buy ticket</a>
                                </div>
                            </div>
                        </div>
                    </article>     
                </cfoutput>
            </div> 
        </div>
        <div class="row">
            <div class="col-md-12 mt4">
                <div class="single-slider">
                    <div class="swiper-container movie-../assets/web/images" id="singleslider" data-col="5">
                        <div class="swiper-wrapper">
                            <cfloop query = allShowingMovies>
                                <cfoutput>
                                    <div class="swiper-slide">
                                        <div class="movie-image" data-bg-image="../uploads/#allShowingMovies.poster#">
                                            <div class="entry-hover">
                                                <div class="entry-actions">
                                                    <cfset local.encryptId = ToBase64(allShowingMovies.id)/>
                                                    <a href="./movie_details.cfm?movieId=#local.encryptId#" class="btn fill">More</a>
                                                </div>
                                            </div>
                                            <div class="entry-desc">
                                                <div class="rating">
                                                    <input name="stars" type="radio">
                                                    <label>☆</label>
                                                    <input name="stars" type="radio">
                                                    <label>☆</label>
                                                    <input name="stars" type="radio">
                                                    <label>☆</label>
                                                    <input name="stars" type="radio">
                                                    <label>☆</label>
                                                    <input name="stars" type="radio">
                                                    <label>☆</label>
                                                </div>
                                                <h3 class="entry-title">#allShowingMovies.movieName#</h3>
                                                <ul class="entry-date">
                                                    <li>#allShowingMovies.releaseDate#</li>  
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </cfoutput>
                            </cfloop>
                        </div>
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
        </div>
    </div> 
</section>

<!---box office--->
<section class="section-content">
    <div class="fullscreen-section bg-black pvb0">
        <div class="container wpc-boxoffice pv8">
            <div class="row">
                <div class="col-sm-5 col-xs-12">
                    <h3>Cast</h3>
                    <ul class="wpc-box-list">
                        <cfloop query="#movie_cast_details#">
                            <cfoutput>
                                <li class="wpc-box-item" > 
                                    <ol>
                                        <li class="bx-item-t"><img class="cast-pic" src="../uploads/#movie_cast_details.actorPhoto#" alt="thumb"></li>
                                        <li class="bx-item-c">1</li>
                                        <li class="bx-item-title">
                                            <h4>#movie_cast_details.characterName#</h4>
                                            <span>(character name)</span>
                                        </li>
                                        <li class="bx-item-d">#movie_cast_details.actorName#</li>
                                    </ol>
                                </li>
                            </cfoutput>     
                        </cfloop>
                    </ul>
                </div>
                <div class="col-sm-2 col-xs-12"></div>
                <div class="col-sm-5 col-xs-12">
                    <h3>Crew</h3>
                    <ul class="wpc-box-list">
                        <cfloop query="#movie_crew_details#">
                            <cfoutput>
                                <li class="wpc-box-item" > 
                                    <ol>
                                        <li class="bx-item-t"><img class="cast-pic" src="../uploads/#movie_crew_details.crewPhoto#" alt="thumb"></li>
                                        <li class="bx-item-c">1</li>
                                        <li class="bx-item-title">
                                            <h4>#movie_crew_details.roleName#</h4>
                                            <span>(role name)</span>
                                        </li>
                                        <li class="bx-item-d">#movie_crew_details.personsName#</li>
                                    </ol>
                                </li>
                            </cfoutput>     
                        </cfloop>
                    </ul>
                </div>
            </div>
        </div>
    </section>

<cfinclude template="../theme/web-footer.cfm">  
