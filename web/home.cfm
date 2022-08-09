<cfset Instance = createObject("component","movie-ticket/components.webside")> 
<cfset comingSoon = Instance.comingSoonMovies()> 
<cfset nowShowing = Instance.nowShowingMovies()> 
<cfset allShowingMovies = Instance.frontEndShowAllMovies()> 
<cfinclude template="../theme/web-header.cfm">   
<div class="fullwidth-slider">
    <div id="headerslider" class="carousel slide"> 
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div class="fill" data-bg-image="../assets/web/images/header-slider.jpg">
                <div class="bs-slider-overlay"></div>
                    <div class="container movie-slider-container"> 
                        <div class="row">
                            <div class="col-sm-12 movie-slider-content"> 
                                <div class="slider-content" >
                                    <ul class="subtitle"  data-animation="animated bounceInRight">
                                        <li></li>
                                        <li></li>
                                    </ul>
                                    <div class="title" data-animation="animated bounceInRight">
                                        BOOK YOUR TICKETS
                                    </div>
                                    <div class="slide_right" data-animation="animated bounceInRight">
                                        <a href="javascript:;" class="btn">Feel the experience</a> 
                                        <a href="javascript:;" class="btn">stay tune</a>
                                        <ul class="award-logo">
                                            <li><img src="../assets/web/images/header/icon1.png" alt="icon" ></li>
                                            <li><img src="../assets/web/images/header/icon2.png" alt="icon"></li>
                                            <li><img src="../assets/web/images/header/icon3.png" alt="icon"></li>
                                            <li><img src="../assets/web/images/header/icon4.png" alt="icon"></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</div>
      
<section class="section-content">
    <div class="container-fluid pv11 ">
        <div class="row">
            <div class="col-sm-12">
                <h3 class="heading text-center">Now playing</h3>
                <div class="ticket-carousel pvt85">
                    <div class="swiper-container carousel-container movie-images" data-col="5">
                        <div class="swiper-wrapper">
                            <cfloop query = nowShowing>
                                <cfoutput>
                                    <div class="swiper-slide">
                                        <div class="movie-image" data-bg-image="../uploads/#nowShowing.poster#">
                                            <div class="entry-hover">
                                                <div class="entry-actions">
                                                   <cfset local.encryptId = ToBase64(nowShowing.id)/>
                                                    <a href="./movie_details.cfm?movieId=#local.encryptId#" class="">
                                                        Details
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="entry-desc">
                                                <h3 class="entry-title">#nowShowing.movieName#</h3><br>
                                                <!--- <span>duartion : #nowShowing.duration#</span><br>
                                                <span>genre : #nowShowing.genre#</span> --->
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
        </div><br><br>

        <div class="row">
            <div class="col-sm-12">
                <h3 class="heading text-center">COMING SOON</h3>
                <div class="ticket-carousel pvt85">
                    <div class="swiper-container carousel-container movie-images" data-col="5">
                        <div class="swiper-wrapper">
                        <cfloop query = comingSoon>
                            <cfoutput>
                                <div class="swiper-slide">
                                    <div class="movie-image" data-bg-image="../uploads/#comingSoon.poster#">
                                        <div class="entry-hover">
                                            <div class="entry-actions">
                                                <a href="order" class="btn-ticket">Show Details</a>
                                            </div>
                                        </div>
                                        <div class="entry-desc">
                                            <h3 class="entry-title">#comingSoon.movieName#</h3>
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

    <div class="section-content pvb0 bg-cover" data-bg-image="../assets/web/images/coming-bg.jpg">
        <div class="container pvt80">
            <div class="row">
                <div class="col-md-12">
                    <div id="slider_coming" class="flexslider">
                        <ul class="slides">
                            <li>
                                <article class="product-item hover-dark">
                                    <div class="entry-title">
                                        <ul class="subtitle">
                                            <li>Action</li>
                                            <li>Science Fiction</li>
                                            <li>Adventure</li>
                                        </ul>
       
                                        <a href="javascript:;" class="title">ALL MOVIES..  </a>
                                        <div class="ml-4">
                                            <form method="post" action="../components/webside.cfc?method=findDetailsBySearchResults">
                                                <select name="movie" id="movie-select">
                                                    <option value="">--Please select the movie--</option>
                                                    <option value="default">Search For a Movie</option>
                                                    <cfoutput query='searchResults'>
                                                        <option value="#id#"> #movieName#
                                                        </option>
                                                    </cfoutput>
                                                </select>
                                                <button class="btn"><i class="fa fa-search"></i></button>
                                            </form>
                                        </div>
                                    
                                        <div class="social-links">
                                            <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                            <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                                            <a href="javascript:;"><i class="fa fa-instagram"></i></a>
                                        </div>
                                    </div>
                                </article>
                            </li>     
                        </ul>
                    </div>
                </div>
            </div>	
            <div id="carousel_coming" class="flexslider">
            <ul class="slides">
                    <cfloop query = allShowingMovies>
                        <cfoutput>
                            <li class="thumb_item bg-cover">
                                <div class="movie-image">
                                    <!--- <a href="" class="btn fill"></a> --->
                                    <img src="../uploads/#allShowingMovies.poster#" class="wpc_img" alt="image"/>
                                    <div class="entry-desc">
                                        <h3 class="entry-title">#allShowingMovies.movieName#</h3>
                                        <ul class="entry-date">
                                            <li>5 May 2017</li>  
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </cfoutput>
                    </cfloop>
                </ul>
            </div>
        </div>
    </div>       
     

</section>
<cfinclude template="../theme/web-footer.cfm">    