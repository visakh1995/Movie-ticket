<cfinclude template="../theme/web-header.cfm">  
<cfset params = structKeyList(url)/>          
<cfif params neq ''>
    <cfset selectDate = url.selectDate>
    <cfparam  name="selectDate" default="">
    <cfset dateSelector = createObject("component","movie-ticket/components.webside")> 
    <cfset dateResults = dateSelector.dateMovieSelector(selectDate)>
</cfif>
<cfset Instance = createObject("component","movie-ticket/components.webside")> 
<cfset showNowShowing = Instance.showsNowShowing()> 

<section class="section-content pv12 bg-cover" data-bg-image="../assets/web/images/coming-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 page-title mt5 mb5">
                <h2 class="blog-title">Shows</h2>
                <ol class="breadcrumb">
                    <li><a href="./" class="active">Home</a></li>
                    <li><a href="blog.php">Shows</a></li>
                </ol>
            </div>
        </div>
    </div> 

    <div class="container h-100 py-2">
        <ul class="nav nav-pills">
            <cfset fromDate = Now()> 
            <cfset toDate = Now() + 5>  
            <cfoutput>
            <cfloop from="#fromDate#" to="#toDate#" index="i" step=+1 >                                     
                <li class="item-wrap">
                    <a href="./shows.cfm?selectDate=#DateFormat(i,'yyyy-mm-dd')#"
                    class="tags__item" data-filter='ending'>
                        <cfoutput>#DateFormat(i,"dd-ddd")#</cfoutput>
                    </a>
                </li>
            </cfloop>
            </cfoutput>
        </ul>
    </div>
    <cfif isDefined("dateResults")>
        <div class="container mt4">
            <div class="row"> 
                <div class="col-sm-12 col-xs-12 pl0">
                    <div class="blog-container">
                        <cfloop query = dateResults>
                            <cfoutput>
                                <article class="blog-item">
                                    <div class="col-sm-4 col-xs-12 ">
                                        <div class="post-image" data-bg-image="../uploads/#dateResults.poster#"></div>
                                    </div>
                                    <div class="col-sm-8 ml-r-15">
                                    <div class="overlay bg-cover" data-bg-image="../assets/web/images/blog/post-2.jpg"> </div>
                                        <div class="post-content">
                                        <div class="entry-meta">
                                            <ul class="category">
                                                <li><a href="javascript:;">Genre - #dateResults.genre#</a></li>    
                                                <li><a href="javascript:;">Release Date - #dateResults.releaseDate#</a></li>    
                                                <li><a href="javascript:;">Show Date - #dateResults.releaseDate# to #endDate#</a></li>    
                                            </ul> 
                                            <div class="social-links">
                                                <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                                <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                                                <a href="javascript:;"><i class="fa fa-user"></i></a>
                                            </div>
                                        </div>
                                            <h2 class="entry-title"><a href="javascript:;">#dateResults.movieName#</a></h2>
                                            <p class="entry-excepts">#dateResults.description#</p>
                                            <p class="entry-excepts">Theatre : #dateResults.theaterName#
                                                 | Shows : #dateResults.showStartTime# | Trailer : #dateResults.trailerUrl#  </p>
                                            <cfset local.encryptId = ToBase64(dateResults.m_id)/>
                                            <a href="./movie_details.cfm?movieId=#local.encryptId#" class="btn more mt1"> Book Tickets</a>
                                            <div class="social-icon mt1">
                                                <span><i class="fa fa-thumbs-o-up"></i>14</span>
                                                <span><i class="fa fa-comment-o"></i>11</span>
                                            </div>
                                        </div>
                                    </div>
                                </article> 
                            </cfoutput>
                        </cfloop>
                    </div>
                    <div class="post-navigation mv3">
                        <ul>
                            <li><a href="javascript:;">1</a></li>
                            <li><a href="javascript:;">2</a></li>
                            <li><a href="javascript:;">3</a></li>
                            <li><a href="javascript:;">4</a></li>
                            <li><a href="javascript:;" class="arrow">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </div>        
        </div> 
    <cfelse>
        <div class="container mt4">
            <div class="row"> 
                <div class="col-sm-12 col-xs-12 pl0">
                    <div class="blog-container">
                        <cfloop query = showNowShowing>
                            <cfoutput>
                                <article class="blog-item">
                                    <div class="col-sm-4 col-xs-12 ">
                                        <div class="post-image" data-bg-image="../uploads/#showNowShowing.poster#"></div>
                                    </div>
                                    <div class="col-sm-8 ml-r-15">
                                    <div class="overlay bg-cover" data-bg-image="../assets/web/images/blog/post-2.jpg"> </div>
                                        <div class="post-content">
                                        <div class="entry-meta">
                                            <ul class="category">
                                                <li><a href="javascript:;">Genre - #showNowShowing.genre#</a></li>    
                                                <li><a href="javascript:;">Release Date - #showNowShowing.releaseDate#</a></li>    
                                                <li><a href="javascript:;">Show Date - #showNowShowing.releaseDate# to #endDate#</a></li>    
                                            </ul> 
                                            <div class="social-links">
                                                <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                                <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                                                <a href="javascript:;"><i class="fa fa-user"></i></a>
                                            </div>
                                        </div>
                                            <h2 class="entry-title"><a href="javascript:;">#showNowShowing.movieName#</a></h2>
                                            <p class="entry-excepts">#showNowShowing.description#</p>
                                            <p class="entry-excepts">Theatre : #showNowShowing.theaterName#
                                                 | Shows : #showNowShowing.showStartTime# | Trailer : #showNowShowing.trailerUrl#  </p>
                                            <cfset local.encryptId = ToBase64(showNowShowing.m_id)/>
                                            <a href="./movie_details.cfm?movieId=#local.encryptId#" class="btn more mt1"> Book Tickets</a>
                                            <div class="social-icon mt1">
                                                <span><i class="fa fa-thumbs-o-up"></i>14</span>
                                                <span><i class="fa fa-comment-o"></i>11</span>
                                            </div>
                                        </div>
                                    </div>
                                </article> 
                            </cfoutput>
                        </cfloop>
                    </div>
                    <div class="post-navigation mv3">
                        <ul>
                            <li><a href="javascript:;">1</a></li>
                            <li><a href="javascript:;">2</a></li>
                            <li><a href="javascript:;">3</a></li>
                            <li><a href="javascript:;">4</a></li>
                            <li><a href="javascript:;" class="arrow">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </div>        
        </div> 

        
    </cfif>
</section>
<cfinclude template="../theme/web-footer.cfm"> 

    