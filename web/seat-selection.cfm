<cfinclude template="../theme/web-header.cfm"> 
<cfif isDefined("moviesShowId")>
    <cfset showMovieId = ToString(ToBinary(moviesShowId))>
    <cfset available = createObject("component","movie-ticket/components.webside")> 
    <cfset totalSeatsAvail = available.findAvailableSeats(showMovieId)>
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
            <div class="container">
            <!--- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" 
                data-target="#myModal">Open Modal</button> --->
                <div class="modal show" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Welcome ! plan your seating.</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" action="../components/webside.cfc?method=ticketBooking">
                                    <input type="number" class="form-control" name ="seats" id="seats" 
                                    placeholder="Enter number of seats required" required><br>
                                    <cfif isDefined("moviesShowId")>
                                    <input type="hidden" name="movieShowId" value=<cfoutput>#showMovieId#</cfoutput>>
                                    </cfif>
                                    <button type="submit" class="btn text-black">Seats plan</button>
                                    <cfif isDefined("totalSeatsAvail")>
                                        <cfoutput>
                                        <span>(#totalSeatsAvail.totalSeats# seats left)</span>
                                        </cfoutput>
                                    </cfif>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           </div>
       </div>
   </div>
</section>
<cfinclude template="../theme/web-footer.cfm">  