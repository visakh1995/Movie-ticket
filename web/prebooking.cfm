
 <cfinclude template="../theme/web-header.cfm">  
 <cfif isDefined("movieId")>
    <cfset movieId = ToString(ToBinary(movieId))>
    <cfset webShowTheaters = createObject("component","movie-ticket/components.webside")> 
    <cfset movie_schedules = webShowTheaters.webMovieSchedulesById(movieId)>
 </cfif>
 <section class="section-content pv12 bg-cover" data-bg-image="../assets/web/images/blog/bg-single.jpg">
     <div class="container">
         <div class="row">
             <div class="col-md-12"></div> 
         </div>
     </div> 
 </section>

 <section class="section-content">
    <div class="fullscreen-section bg-black pvb0">
        <div class="container wpc-boxoffice pv8">
            <div class="row">
                <div class="col-sm-3 col-xs-12"></div>
                    <div class="col-sm-12 col-xs-12">
                        <ul class="wpc-box-list">
                            <cfoutput>
                                <cfloop query = movie_schedules>
                                    <li class="wpc-box-item"> 
                                        <ol>
                                            <li class="bx-item-t">
                                                <img class="cast-pic" src="../uploads/#movie_schedules.poster#" alt="thumb"></li>
                                            <li class="bx-item-title">
                                                <h4>#movie_schedules.theaterName#</h4>
                                                <span>#movie_schedules.genre#</span>
                                            </li>
                                            <li class="bx-item-m">#movie_schedules.screenName#</li>
                                            <cfset theaterId = movie_schedules.theater>
                                            <cfinvoke component ="movie-ticket/components.webside"  method="webMovieScheduleTimesById"
                                            returnVariable = "results">
                                                <cfinvokeargument  name="theaterId"  value="#theaterId#">
                                                <cfinvokeargument  name="movieId"  value="#movieId#">
                                            </cfinvoke>
                                            <cfdump var =#results#>

                                        

                                             <li class="bx-item-d">
                                                <button class="order btn">#movie_schedules.showStartTime#</button>
                                            </li> 
                                        </ol>
                                    </li>
                                </cfloop>
                            </cfoutput>    
                            <a href="#order" class="order_btn">test</a>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div id="order">
    <div class="container">
        <div class="row order-content">
            <div class="col-sm-8 col-xs-12 seat_content ph0">
                <h2>order a ticket</h2>
                <div class="entry-order-content">
                    <form id="msform" name="msform">
                        <!-- fieldsets -->
                        <fieldset>
                             <div class="wpc-content">
                                <h3>location</h3>
                                <select name="location">
                                    <option>Tenguu Cinema Tysons corner</option>
                                    <option>Tenguu Cinema </option>
                                    <option>Tenguu Cinema corner</option>
                                    <option>Tenguu Cinema Tysons</option>
                                </select>
                                <h3 class="mt3">Movie</h3>
                                <select>
                                    <option>Dead pool</option>
                                    <option>THE BATTLE OF ALGIERS (DI ALGERI)</option>
                                    <option>LORD OF THE RINGS: THE RETURN OF THE KINGS</option>
                                    <option>Tenguu Cinema Tysons corner</option>
                                </select>
                                <h3 class="mt3">Date</h3>
                                <input type='date' class="datetime"/>
                                <h3 class="mt3">TIME</h3>
                                <ul class="order-date">
                                    <li><a href="javascript:;"><i>11:50</i></a></li>
                                    <li><a href="javascript:;"><i>13:40</i></a></li>
                                    <li><a href="javascript:;"><i>16:35</i></a></li>
                                    <li><a href="javascript:;"><i>17:30</i></a></li>
                                    <li><a href="javascript:;"><i>19:50</i></a></li>
                                    <li><a href="javascript:;"><i>21:10</i></a></li>
                                </ul>
                            </div>
                            <input type="button" name="next" class="next action-button" value="Next" />
                        </fieldset>
                        <fieldset class="seat-content">
                            <div class="wpc-content">
                                <h3 class="seat_title">seats</h3>
                                <div id="seat-map"></div>
                                <div id="legend"></div>
                            </div>
                            <input type="button" name="previous" class="action-button previous" value="Previous" />
                            <input type="submit" name="submit" class="submit action-button" value="Submit" />
                        </fieldset>
                    </form>
                </div>
            </div>
            <div class="col-sm-4 col-xs-12 order_sidebar ph0">
                <h2>Your Information</h2>
                <div class="order-details">
                    <span> Location:</span><p id="locationp">Tenguu Cinema Tysons cornerss</p>
                    <span>Time:</span>  <p>2016.3.8 18:30</p>
                    <span>Seat: </span>
                    <ul id="selected-seats"></ul>
                    <div>Tickets: <span id="counter">0</span></div>
                    <div>Total: <b>$<span id="total">0</span></b></div>
                </div>
                <a href="javascript:;" class="close-window"><i class="fa fa-times"></i></a>
            </div>
        </div>
    </div>
</div>
 <cfinclude template="../theme/web-footer.cfm">  