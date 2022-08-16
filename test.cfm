<select  class="fullWidth" name = "screen" id="screen" required> 
    <cfoutput>
<!---                                         <cfloop query = screensList> --->
<!---                                             <option value="#screensList.id#">#screensList.screenName#</option> --->
<!---                                         </cfloop> --->
    </cfoutput>
</select>

<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset screensList = newInstance.findScreensList()> 

<div class="form-control">
    <select  class="fullWidth" name = "screen" id="screen" required> 
        <cfoutput>
            <cfloop query = screensList>
                <option value="#screensList.id#">#screensList.screenName#</option> 
            </cfloop> 
        </cfoutput>
    </select>
</div>


<script>
    var hamburger = document.querySelector(".hamburger");
      hamburger.addEventListener("click", function(){
      document.querySelector("body").classList.toggle("active");
  })
</script>

<cffunction name="findScreensList" access="public" output="true">
    <cfargument name="teatreId" type="integer" >
    <cfdump var =#arguments.teatreId#>
    <cfabort>
    <cfquery name="screenList" datasource="cruddb">
        SELECT * FROM bookmyticket.moviepanel_screens 
        WHERE id = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.teatreId#">
    </cfquery>
    <cfreturn screenList>
</cffunction>

<div class="d-flex">
    <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i class="fas fa-pencil-alt"></i></a>
    <a href="#" class="btn btn-danger shadow btn-xs sharp"><i class="fa fa-trash"></i></a>
</div>



<cfinclude template="../section/dash-header.cfm">
<cfinclude template ="./createmovie.cfm"> 
<cfset newInstance = createObject("component","movie-ticket/components.movies")> 
<cfset moviesList = newInstance.findMoviesList()> 
<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Movies</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">Manage Movies</a></li>
            </ol>
        </div>
    <div class="row">
        <div class="col-12">
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
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"></h4>
                    <button type="button" class="movie btn btn-primary mb-2" data-bs-toggle="modal" 
                    data-bs-target=".bd-movie-modal-lg">Create</button>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example" class="display" style="min-width: 845px">
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
                                
                                    <cfloop query = moviesList>
                                        <div class="accordion accordion-danger-solid" id="accordion-two">
                                            <div class="accordion-item">
                                              <div class="accordion-header  rounded-lg" id="accord-2One"
                                               data-bs-toggle="collapse" data-bs-target="#collapse2One"
                                                aria-controls="collapse2One" aria-expanded="true" role="button">
                                                <span class="accordion-header-text">Accordion Header One</span>
                                                <span class="accordion-header-indicator"></span>
                                                <!--- --->
                                                <tr>
                                                    <td>
                                                        <img style="width:10px" class="avatar-img" 
                                                        src="../uploads/#moviesList.poster#">
                                                    </td>
                                                    <td>
                                                        <img  style="width:10px" class="avatar-img" 
                                                        src="../uploads/#moviesList.wallpaper#">
                                                    </td>
                                                    <td>#moviesList.movieNames#</td>
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
                                                        data-bs-toggle="modal" data-bs-target=".bd-movie-modal-lg">
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
                                                <!---  --->
                                              </div>
                                              <div id="collapse2One" class="collapse accordion__body show" aria-labelledby="accord-2One" data-bs-parent="#accordion-two">
                                                <div class="accordion-body-text">
                                                   Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                </div>
                                              </div>
                                            </div>
                                        
                                    </cfloop>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<cfinclude template ="../section/dash-footer.cfm">

INNER JOIN bookmyticket.moviepanel_showtimes st ON sh.screen_time_id =st.id


<cfif NOT isDefined("Session.movieTicketCredentials")>
	<cflocation url="./auth/signin.cfm" addtoken="no" /> 
<cfelse>
    <cflocation url="./admin/dashboard.cfm" addtoken="no" /> 
</cfif>

BETWEEN CAST ('2015-01-24' AS DATE) AND CAST ('2015-01-25' AS DATE); 


SELECT sh.id,sh.movieName,sh.language,sh.genre,sh.releaseDate,sh.duration,sh.movieFormat,
mc.characterName,mc.actorName,mc.actorPhoto,ms.roleName,ms.personsName,ms.crewPhoto    
FROM bookmyticket.moviepanel_movies sh
INNER JOIN bookmyticket.moviepanel_casts mc ON sh.id=mc.movieId 
INNER JOIN bookmyticket.moviepanel_crews ms ON sh.id=ms.movieId
WHERE sh.id = <cfqueryparam  CFSQLType = "cf_sql_integer" value="#arguments.movieId#">


<div class="section-content pvb0">
    <div class="container  pv8">
        <div class="row">
            <div class="col-sm-6">
                <div id="comments" class="comments-area">
                    <div class="comments-wrapper">
                        <h2 class="comments-title">Comments (2)</h2>
                        <ol class="comment-list">
                            <li>
                                <article>
                                    <div class="comment-avatar">
                                        <img alt="Image" src="../assets/web/images/blog/user-1.jpg" class="avatar">
                                    </div>
                                    <div class="comment-body">
                                        <div class="meta-data">
                                            <a href="#" class="comment-author">DANIAL RADCLIFFE</a>
                                        </div>
                                        <div class="comment-content">
                                            Dramatically grow market positioning human capital rather than professional data. Authoritatively reconceptualize equity invested sources with adaptive materials.
                                        </div>
                                    </div>
                                </article>
                            </li>
                            <li>
                                <article>
                                    <div class="comment-avatar">
                                        <img alt="Image" src="../assets/web/images/blog/user-2.jpg" class="avatar">
                                    </div>
                                    <div class="comment-body">
                                        <div class="meta-data">
                                            <a href="#" class="comment-author">DANIEL CRAIG</a>
                                        </div>
                                        <div class="comment-content">
                                            Progressively repurpose extensive partnerships and one-to-one technology. Competently impact market positioning solutions before user friendly alignments. Energistically deploy reliable process improvements via interdependent.
                                        </div>
                                    </div>
                                </article>
                            </li>
                        </ol>
                    </div>
                </div>
             </div>   
            <div class="col-sm-6">
                <div id="respond" class="comment-respond">
                    <h3 id="reply-title" class="comment-reply-title">Leave a comment</h3>
                    <form id="commentform" class="comment-form" novalidate="">
                        <div class="row">
                            <p class="comment-form-author col-sm-6">
                                <input id="author" name="author" type="text" value="" size="30" placeholder="Name *">
                            </p>
                            <p class="comment-form-email col-sm-6">
                                <input id="email" name="email" type="email" value="" size="30" placeholder="E-mail *">
                            </p>
                        </div>
                        <p class="comment-form-comment">
                            <textarea id="comment" name="comment" placeholder="Comments"></textarea>
                        </p>
                        <p class="form-submit">
                            <button type="submit" class="button fill rectangle">Send to us</button>
                        </p>                    
                    </form>
                </div>
            </div> 
        </div>1
    </div>
</div>



<cfset theaterId = movie_schedules.theater>
<cfinvoke component ="movie-ticket/components.webside"  method="webMovieScheduleTimesById"
returnVariable = "results">
    <cfinvokeargument  name="theaterId"  value="#theaterId#">
    <cfinvokeargument  name="movieId"  value="#movieId#">
</cfinvoke>
<cfdump var =#results#>



<cfloop index="item" from="1" to="#filledSeats.recordCount#" >
    <cfoutput>#item#
    
    <cfset seats = filledSeats.selectedSeats[item]>
        var #toScript(seats, "jsVariable")#
        
        </cfoutput>
        <script>
         alert(jsVariable);
            sc.get(jsVariable).status('unavailable'); 
        </script>
        
</cfloop>

<cfloop from="1" to="#ArrayLen(storeSeats)#" index="i">
    <cfoutput>
    <cfloop from="1" to="#ArrayLen(storeSeats[i])#" index="j">
        Album: #i# Song #j#: #storeSeats[i][j]#</br>
    </cfloop>
    </cfoutput>
</cfloop>


for (var i = 1; i < <cfoutput>#filledSeats.recordCount#</cfoutput>; i++){
    // console.log(<cfoutput>#filledSeats.selectedSeats#</cfoutput>);
    // console.log("countValue" + countValue);
    var cube = <cfoutput>#filledSeats.selectedSeats#</cfoutput>
    for(var j = 0; j < cube.length; j++) {
        // console.log(cube[i][j]);
    }
    // var seats = <cfoutput>#filledSeats.selectedSeats#</cfoutput>;
    // sc.get(seats).status('unavailable');

}



console.log("here it is" + <cfoutput>#storeSeats[1]#</cfoutput>)
let arrayCount = <cfoutput>#ArrayLen(storeSeats)#</cfoutput>;




let countValue = <cfoutput>#filledSeats.recordCount#</cfoutput>;
// console.log(countValue);
for (var i = 1; i < countValue; i++){
    let iterator = i;

    // alert(iterator);
    retrieveIterator(iterator);



    // first this iterator assign to id field
    // $iter.text(iterator);
    // document.getElementById("keyValue").value = iterator;
    // fetch that id using document.get element by id
    // var trying = <cfoutput>#filledSeats.selectedSeats[Session.movieKeyValues.keys]#</cfoutput>
    console.log(i);

    // console.log("test" + key);
}

<cfloop index="item" from="1" to="#filledSeats.recordCount#" >
<cfoutput>#item#

<cfset seats = filledSeats.selectedSeats[item]>
    var #toScript(seats, "jsVariable")#
    
    </cfoutput>
    // alert(jsVariable);
        sc.get(jsVariable).status('unavailable'); 
    
</cfloop>


<cfoutput>
    <cfloop index="item" from="1" to="#filledSeats.recordCount#" >
<!--- 				The loop index is <cfoutput>#item#</cfoutput> --->
        <cfset seats = filledSeats.selectedSeats[item]>
<!--- 				<cfdump var ="#seats#"> --->
<!--- 				sc.get(seats).status('unavailable'); --->
    </cfloop>
</cfoutput>








<cfset thisString="hello world">
<script type="text/javascript" language="JavaScript">
<cfoutput>
// var #toScript(thisString, "jsVar")#;
</cfoutput>
// alert(jsVar);
</script>

<!--- 		<cfif isDefined("Session.movieKeyValues")> --->
<!--- 			<cfset key = Session.movieKeyValues.keys> --->
<!--- 			<cfdump var ="#key#"> --->
<!--- 		<cfelse> --->
<!--- 			<cfdump var="didnt find it yet"> --->
<!--- 		</cfif> --->

<!--- <cfdump var = #filledSeats.selectedSeats[2]#> --->
<cfset storeSeats = arrayNew(1)>
<cfloop query = filledSeats>
<!--- 			<cfdump var="#filledSeats.selectedSeats#"><br><br> --->
     <cfset arrayAppend(storeSeats, #filledSeats.selectedSeats#)> 
</cfloop>

<cfoutput>
    <cfloop array="#storeSeats#" index="foo">
        <cfloop index="item" from="1" to="#filledSeats.recordCount#" >
            #storeSeats[item]# 
        </cfloop>
    </cfloop>
</cfoutput>


<cfdump var = #deserializeJSON(storeSeats[1])#>
<cfloop from="1" to="#filledSeats.recordCount#" index="i">
    <cfoutput>
<!--- 				<cfdump var =#i#> --->
<!--- 				<cfdump var =#ArrayLen(deserializeJSON(storeSeats[i]))#> --->
    <cfloop from="1" to="#ArrayLen(deserializeJSON(storeSeats[i]))#" index="j">
<!--- 				#filledSeats.selectedSeats[i][j]#</br> --->
                Album: #i# Song #j#: #filledSeats.selectedSeats[i][j]#</br> 

    </cfloop>
    </cfoutput>
</cfloop>

<cfloop array="#storeSeats#" index="i">
    <cfoutput>
     The population of #i#<br>
    </cfoutput>
 </cfloop>





-- --------------------------------------------------------------------------


<cfloop index="item" from="1" to="#filledSeats.recordCount#" >
    <cfset seatByPerson = filledSeats.selectedSeats[item]>
    <cfset local.parsedData = DeserializeJSON(seatByPerson)>
    <cfloop index="its" from="1" to="#ArrayLen(local.parsedData)#">
        <cfset local.seatByPesonIn = local.parsedData[its]>
        <cfset scValues = "' "&local.seatByPesonIn & " ',">
    </cfloop>	
</cfloop>


function retrieveIterator(key){
    var movie_show_time_id = $('#movie_show_time_id').val();
    var web_seat_count = $('#web_seat_count').val();
    // alert(key);
    $.ajax({   
        url: "../components/webside.cfc",
        type: 'post',
        dataType:"json",
        data:{
        method:"retrieveKey",
        "movie_show_time_id":movie_show_time_id,       
        "key":key,
        "ticket_count":web_seat_count
        },
        success: function(data){   
            alert(data);
        },error:function(error){
            console.log(error);
        }         
    });  
}






<!DOCTYPE html>
<html>
	<head>
		<link href="../assets/web/booking/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="../assets/web/booking/js/jquery-1.11.0.min.js"></script>
		<script src="../assets/web/booking/js/jquery.seat-charts.js"></script>
	</head>
	<body>



        // web restrictions
        if(!structKeyExists(Session, "UserwebMovieTicketCredentials")){
            if(findNoCase("/movie-ticket/web/seat-selection.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/web/ticket-booking.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/checkout.cfm",arguments.targetPage) > 0 ||
            findNoCase("/movie-ticket/admin/confirm_ticket.cfm",arguments.targetPage) > 0 ){
                writeOutput('<center><h1>Login Required for accessing this page</h1>
                <p>Please Login to your account</p><br>
                <a href="../web/home.cfm">Click Here</a></center>');
            abort;
            }
        }


        Razor pay 

credentials
visakh.vs@techversantinfo.com 
techrazor@41







post
https://api.razorpay.com/v1/orders
basic auth
username password
key id : rzp_test_q14UWXJrpEpdwq
ps wd : HlE0V2iE8L3Y7JCjUaxwntHe

{
    "amount": 500,
    "currency": "INR",
    "receipt": "receipt_1101",
    "partial_payment": true,
    "first_payment_min_amount": 230
}

results

{
    "id": "order_K0Ny49NyGbcIoc",
    "entity": "order",
    "amount": 500,
    "amount_paid": 0,
    "amount_due": 500,
    "currency": "INR",
    "receipt": "receipt_1101",
    "offer_id": null,
    "status": "created",
    "attempts": 0,
    "notes": [],
    "created_at": 1659360539
}

pass response unique order id from api into checkout page to generate gateway

then ticket generation



<!DOCTYPE html>
<html>
	<head>
		<title>Movie Ticket Booking Widget Flat Responsive Widget Template :: w3layouts</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Movie Ticket Booking Widget Responsive">
		<link href="../assets/web/booking/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="../assets/web/booking/js/jquery-1.11.0.min.js"></script>
		<script src="../assets/web/booking/js/jquery.seat-charts.js"></script>
	</head>
	<body>
	<cfif isDefined("movieShowId")>
		<cfset webSeatCount = ToString(ToBinary(seatCount))>
		<cfset webMovieShowId = ToString(ToBinary(movieShowId))>
		<cfset webBookingDetailsById = createObject("component","movie-ticket/components.webside")> 
		<cfset movie_details = webBookingDetailsById.webMovieFindBookingDetails(movieShowId)>
		<cfset filledSeats = webBookingDetailsById.webMovieTheaterFilledSeats()>
		
	</cfif>

	<div class="content">
		<h2>Seat Booking</h2>
		<div class="main">
			<div class="demo">
				<div id="seat-map">
					<div class="front">SCREEN</div>					
				</div>
				<form id="formId" method="post" action="">
					<div class="booking-details">
						<ul class="book-left">
							<li>Movie</li>
							<li>Date </li>
							<li>Time </li>
							<li>Tickets</li>
							<li>Total</li>
							<li>Selected Seats</li>
						</ul>
						<cfoutput>
							<ul class="book-right">
								<li>: #movie_details.movieName#</li>
								<li>: #DateFormat(Now())#</li>
								<li>: #movie_details.showStartTime#</li>
								<li>: <span id="counter">0</span></li>
								<li>: <b><i>RS.</i><span id="total">0</span></b></li>
							</ul>
						</cfoutput>
						<div class="clear"></div>
						<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
						<div id="legend"></div>
					</div>
					<cfoutput>
						<input type="hidden" value="#movie_details.silverRate#" id="silverPrice">
						<input type="hidden" value="#movie_details.goldRate#" id="goldPrice">

						<input type="hidden" name="movieShowTimeId" id="movie_show_time_id" value="#webMovieShowId#">
						<input type="hidden" name="ticketCount" id="web_seat_count" value="#webSeatCount#">
					</cfoutput>
					<fieldset><br>
						<input type="submit" name="next-step" class="confirm next-step" value="Confirm Selection" />
						<input type="button" name="previous-step" class="previous-step" value="Back" />
					</fieldset>
				</form>
				<script type="text/javascript">
					var seatNumbers = [];
					var web_seat_count = $('#web_seat_count').val();
					var movie_show_time_id = $('#movie_show_time_id').val();

					$(document).ready(function () {
						var $cart = $('#selected-seats'), //Sitting Area
							$counter = $('#counter'), //Votes
							$total = $('#total'); //Total money
							$iter = $('#keyValue');

						var sc = $('#seat-map').seatCharts({
							map: [ //Seating chart
								'aaaaaaaaaa',
								'aaaaaaaaaa',
								'__________',
								'aaaaaaaaaa',
								'aaaaaaaaaa',
								'aaaaaaaaaa',
								'aaaaaaaaaa',
								'aaaaaaaaaa',
								'aaaaaaaaaa',
								'__aaaaaa__'
							],
							naming: {
								top: false,
								getLabel: function (character, row, column) {
									return column;
								}
							},
							legend: { //Definition legend
								node: $('#legend'),
								items: [
									['a', 'available', 'Available'],
									['a', 'unavailable', 'Sold'],
									['a', 'selected', 'Selected']
								]
							},
							click: function () { //Click event
								if (this.status() == 'available') { //optional seat
									$('<li>R-' + (this.settings.row + 1) + '	S-' + this.settings.label + '</li>')
										.attr('id', 'cart-item-' + this.settings.id)
										.data('seatId', this.settings.id)
										.appendTo($cart);

									$seatId = $((this.settings.row + 1) + '_' + this.settings.label)
										.attr('id', + this.settings.id)
										.data('seatId', this.settings.id);

									seatNumbers.push($seatId.selector);
									if(seatNumbers.length <= web_seat_count){
										confirmSeats(seatNumbers);
									}else{
										alert("cant pick more than mentioned");
										window.location.href="http://127.0.0.1:8500/movie-ticket/web/ticket-booking.cfm?seatCount=<cfoutput>#seatCount#</cfoutput>&movieShowId=<cfoutput>#movieShowId#</cfoutput>";
									}
									$counter.text(sc.find('selected').length + 1);

									if($seatId.selector == '1_1' || $seatId.selector == '1_2' ||
									$seatId.selector == '1_3' || $seatId.selector == '1_4'|| $seatId.selector == '1_5'
									|| $seatId.selector == '1_6' || $seatId.selector == '1_7' || $seatId.selector == '1_8'
									|| $seatId.selector == '1_9'|| $seatId.selector == '1_10'
									|| $seatId.selector == '2_1' || $seatId.selector == '2_2' || $seatId.selector == '2_3'
									|| $seatId.selector == '2_4' || $seatId.selector == '2_5' || $seatId.selector == '2_6'
									|| $seatId.selector == '2_7'|| $seatId.selector == '2_8'|| $seatId.selector == '2_9'
									|| $seatId.selector == '2_10')
									{
										var goldRateValue = $('#goldPrice').val();
										goldRate = parseInt(goldRateValue, 10); 
										price = goldRate;
										$total.text(recalculateTotal(sc,$seatId) + price);								
									}else{
										var silverRateValue = $("#silverPrice").val();
										silverRate = parseInt(silverRateValue, 10);
										price = silverRate;
										$total.text(recalculateTotal(sc,$seatId) + price);
									}
									return 'selected';
								} else if (this.status() == 'selected') { //Checked
									//Update Number
									$counter.text(sc.find('selected').length - 1);
									//update totalnum
									$total.text(recalculateTotal(sc) - price);

									//Delete reservation
									$('#cart-item-' + this.settings.id).remove();
									//optional
									return 'available';
								} else if (this.status() == 'unavailable') { //sold
									return 'unavailable';
								} else {
									return this.style();
								}
							}
						});
						<cfset listArray = arrayNew(1)>
						<cfloop index="item" from="1" to="#filledSeats.recordCount#" >
						<cfset seatByPerson = filledSeats.selectedSeats[item]>
						<cfset local.parsedData = DeserializeJSON(seatByPerson)>
						
							<cfloop index="its" from="1" to="#ArrayLen(local.parsedData)#">
								<cfset local.seatByPesonIn = local.parsedData[its]>
								<cfset scValues = local.seatByPesonIn>
								
								<cfset arrayAppend(listArray, scValues)>
								

								
									<cfoutput>
										var #toScript(listArray, "jsVar")#;
									</cfoutput>
									
									console.log(jsVar);

									sc.get(jsVar).status(
							'unavailable');

									
								




							</cfloop>	
						</cfloop>
									




						//sold seat
						// sc.get(['1_2', '4_4', '4_5', '6_6']).status(
						// 	'unavailable');

					});
					//sum total money
					function recalculateTotal(sc,$seatId) {
						// console.log($seatId.selector);
						var total = 0;
						sc.find('selected').each(function () {
							
							if($seatId.selector == '1_1' || $seatId.selector == '1_2' ||
							$seatId.selector == '1_3' || $seatId.selector == '1_4'|| $seatId.selector == '1_5'
							|| $seatId.selector == '1_6' || $seatId.selector == '1_7' || $seatId.selector == '1_8'
							|| $seatId.selector == '1_9'|| $seatId.selector == '1_10'
							|| $seatId.selector == '2_1' || $seatId.selector == '2_2' || $seatId.selector == '2_3'
							|| $seatId.selector == '2_4' || $seatId.selector == '2_5' || $seatId.selector == '2_6'
							|| $seatId.selector == '2_7'|| $seatId.selector == '2_8'|| $seatId.selector == '2_9'
							|| $seatId.selector == '2_10')
							{
								var goldRateValue = $('#goldPrice').val();
								goldRate = parseInt(goldRateValue, 10); 
								total += goldRate;								
							}else{
								var silverRateValue = $("#silverPrice").val();
								silverRate = parseInt(silverRateValue, 10);
								total += silverRate;
							}
						});
						return total;
					}
					function confirmSeats(seats) {
						$('.confirm').on('click',function(e){
							e.preventDefault();
							var priceValue = $('#silverPrice').val();
							var movie_show_time_id = $('#movie_show_time_id').val();
							var web_seat_count = $('#web_seat_count').val();
							var total =  document.getElementById('total').innerHTML;
							console.log(seats);
							var seat_data = JSON.stringify(seats);
							// \\\var obj = JSON.parse(data_to_send);

							if(seatNumbers.length < web_seat_count){
								alert("please choose" + web_seat_count + " " + "seats");
								die();
							}
						$.ajax({   
							url: "../components/webside.cfc",
							type: 'post',
							dataType:"json",
							data:{
							method:"saveUserSeatInfo",
							"movie_show_time_id":movie_show_time_id,       
							seats:seat_data, 
							"ticket_count":web_seat_count,
							"total":total
							},
							success: function(data){   
								alert(data);
							},error:function(error){
								console.log(error);
							}         
						});  
						die();
					});
					};

					function retrieveIterator(key){
						var movie_show_time_id = $('#movie_show_time_id').val();
						var web_seat_count = $('#web_seat_count').val();
						// alert(key);
						$.ajax({   
							url: "../components/webside.cfc",
							type: 'post',
							dataType:"json",
							data:{
							method:"retrieveKey",
							"movie_show_time_id":movie_show_time_id,       
							"key":key,
							"ticket_count":web_seat_count
							},
							success: function(data){   
								alert(data);
							},error:function(error){
								console.log(error);
							}         
						});  
					}
				</script>
			</div>
		</div>
		<script src="../assets/web/booking/js/jquery.nicescroll.js"></script>
		<script type="text/javascript" src="../assets/web/booking/js/theme-change-seat-sel.js"></script>
		<script src="../assets/web/booking/js/scripts.js"></script>

	</body>
</html>



<cfmail
from="Sender@Company.com"
to="#arguments.email#"
subject="#arguments.description#"
type="html">
<!---<p><img src="#thisDir#/#image# width="350" height="261" alt="" /><br /></p> --->
</cfmail>

<cfquery dbtype="query" name="GetSomeUsers">
    select showStartTime
    from movie_schedules
</cfquery>
<cfoutput query="GetSomeUsers">
    #showStartTime#<br>
</cfoutput>

<cfset filledSeats = webBookingDetailsById.webMovieTheaterFilledSeats(theaterId)> 

<style>
    label,{
        font-family: sans-serif;
    }
    
    label {
        font-size: 1rem;
        padding-right: 10px;
    }
    
    select {
        font-size: 13px;
        padding: 14px 20px;
        border-radius:25px;
    }
    
    
    
    .output {
        background: center/cover no-repeat url('/media/cc0-images/hamster.jpg');
        position: relative;
    }
    </style>


