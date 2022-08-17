<cfinclude template="../section/dash-header.cfm">
<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset allMovieCount = newInstance.findMovieCount()> 
<cfset allTheaterCount = newInstance.findTheaterCount()> 
<cfset allUserCount = newInstance.findUserCount()> 
<cfset allBookingCount = newInstance.findBookingCount()> 

<div class="content-body">
    <div class="container-fluid">
        <div class="row invoice-card-row">
            <div class="col-xl-3 col-xxl-3 col-sm-6">
                <div class="card bg-warning invoice-card">
                    <div class="card-body d-flex">
                        <div class="icon me-3">
                        </div>
                        <div>
                            <h2 class="text-white invoice-num"><cfoutput>#allTheaterCount#</cfoutput></h2>
                            <span class="text-white fs-18">Total Theaters</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-xxl-3 col-sm-6">
                <div class="card bg-success invoice-card">
                    <div class="card-body d-flex">
                        <div class="icon me-3">
                        </div>
                        <div>
                            <h2 class="text-white invoice-num"><cfoutput>#allMovieCount#</cfoutput></h2>
                            <span class="text-white fs-18">Movies</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-xxl-3 col-sm-6">
                <div class="card bg-info invoice-card">
                    <div class="card-body d-flex">
                        <div class="icon me-3">
                        </div>
                        <div>
                            <h2 class="text-white invoice-num"><cfoutput>#allUserCount#</cfoutput></h2>
                            <span class="text-white fs-18">User registration</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-xxl-3 col-sm-6">
                <div class="card bg-secondary invoice-card">
                    <div class="card-body d-flex">
                        <div class="icon me-3">
                        </div>
                        <div>
                            <h2 class="text-white invoice-num"><cfoutput>#allBookingCount#</cfoutput></h2>
                            <span class="text-white fs-18">Movie Bookings</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<cfinclude template="../section/dash-footer.cfm">

		
		
		
       