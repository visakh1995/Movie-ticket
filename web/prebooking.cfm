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
                                                <img class="cast-pic" src="../uploads/#movie_schedules.poster#" 
                                                alt="thumb">
                                            </li>
                                            <li class="bx-item-title">
                                                <h4>#movie_schedules.theaterName#</h4>
                                                <span>#movie_schedules.genre#</span>
                                            </li>
                                            <li class="bx-item-m">#movie_schedules.screenName#</li>
                                        
                                             <li class="bx-item-d">
                                                <cfset local.encryptMovieShowTime = ToBase64(movie_schedules.id) />
                                                <button 
                                                    class="btn">
                                                    <a href="./web_action.cfm?movieShowId=#local.encryptMovieShowTime#">
                                                        #movie_schedules.showStartTime#
                                                    </a>
                                                </button>
                                            </li> 
                                        </ol>
                                    </li>
                                </cfloop>
                            </cfoutput>    
<!---                             <a href="#order" class="order_btn">test</a> --->
                            <cfquery dbtype="query" name="GetSomeUsers">
                                select showStartTime
                                from movie_schedules
                            </cfquery>
                            <cfoutput query="GetSomeUsers">
                                #showStartTime#<br>
                            </cfoutput>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

 <cfinclude template="../theme/web-footer.cfm">  