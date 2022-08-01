<!DOCTYPE html>
<html>

<head>
	<title>Movie Ticket Booking Widget Flat Responsive Widget Template :: w3layouts</title>
	<!-- for-mobile-apps -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords"
		content="Movie Ticket Booking Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
</cfif>


<div class="content">
	<h2>Seat Booking</h2>
	<div class="main">
		<div class="demo">
			<div id="seat-map">
				<div class="front">SCREEN</div>					
			</div>
			<form id="form">
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

				<input type="hidden" name="userId" value="2">
				<input type="hidden" name="movieShowTimeId" value="#webMovieShowId#">
				<input type="hidden" name="ticketCount" value="#webSeatCount#">
				<input type="text" name="selectedSeats" id="selectedSeats">
				<input type="hidden" name="totalPrice" id="total" value="">
				<input type="hidden" name="bookingTime" value="#movie_details.showStartTime#">

				</cfoutput>
				<fieldset>
					<br>
					<input type="submit" name="next-step" class="next-step" value="Confirm Selection" />
					<input type="button" name="previous-step" class="previous-step" value="Back" />
				</fieldset>
				



			</form>

			<script type="text/javascript">
				var priceValue = $('#silverPrice').val();
				// alert(price);
				var price =priceValue;
				$(document).ready(function () {


					var $cart = $('#selected-seats'), //Sitting Area
						$counter = $('#counter'), //Votes
						$total = $('#total'); //Total money
						// $seatNr = $('#selectedSeats');

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
								
								
								$seatNumbers = $seatId.selector;
		

								$('#selectedSeats').append($($seatNumbers).val());

								$counter.text(sc.find('selected').length + 1);
							
								$total.text(recalculateTotal(sc) + price);

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
					//sold seat
					sc.get(['1_2', '4_4', '4_5', '6_6', '6_7', '8_5', '8_6', '8_7', '8_8', '10_1', '10_2']).status(
						'unavailable');

				});
				//sum total money
				function recalculateTotal(sc) {
					var total = 0;
					sc.find('selected').each(function () {
						total += price;
					});

					return total;
				}
			</script>
		</div>
	</div>



	<script type="text/javascript" src="../assets/web/booking/js/theme-change-seat-sel.js"></script>
	<script src="../assets/web/booking/js/jquery.nicescroll.js"></script>
	<script src="../assets/web/booking/js/scripts.js"></script>
</body>

</html>