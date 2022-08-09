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
