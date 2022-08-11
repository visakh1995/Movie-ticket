<cfinclude template="../theme/web-seat-header.cfm"> 
<cfif isDefined("movieShowId")>
	<cfset webSeatCount = ToString(ToBinary(seatCount))>
	<cfset webMovieShowId = ToString(ToBinary(movieShowId))>
	<cfset webBookingDetailsById = createObject("component","movie-ticket/components.webside")> 
	<cfset movie_details = webBookingDetailsById.webMovieFindBookingDetails(movieShowId)>
	<cfset filledSeats = webBookingDetailsById.webMovieTheaterFilledSeats()>
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
					
					<fieldset>
						<input type="submit" name="next-step" class="confirm next-step" value="Confirm Selection" />
						<input type="button" name="previous-step" class="previous-step" value="Back" />
					</fieldset>
				</form>
				<div id="snackbar">cant pick seats more than mentioned</div>
				<div id="snackbar2">please choose <cfoutput>#webSeatCount#</cfoutput> seats</div>		
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	var seatNumbers = [];
	var web_seat_count = $('#web_seat_count').val();
	var movie_show_time_id = $('#movie_show_time_id').val();

	$(document).ready(function () {
		var $cart = $('#selected-seats'), 
			$counter = $('#counter'), 
			$total = $('#total'); 
			$iter = $('#keyValue');

		var sc = $('#seat-map').seatCharts({
			map: [ 
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
				top: true,
				getLabel: function (character, row, column) {
					return column;
				}
			},
			legend: {
				node: $('#legend'),
				items: [
					['a', 'available', 'Available'],
					['a', 'unavailable', 'Sold'],
					['a', 'selected', 'Selected']
				]
			},
			click: function () { 
				if (this.status() == 'available') { 
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
						toaster();
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
				} else if (this.status() == 'selected') { 
					$counter.text(sc.find('selected').length - 1);
					$total.text(recalculateTotal(sc) - price);
					$('#cart-item-' + this.settings.id).remove();
					return 'available';
				} else if (this.status() == 'unavailable') { 
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
					sc.get(jsVar).status('unavailable');
				</cfloop>	
		</cfloop>
				
		//sold seat
		// sc.get(['1_2', '4_4', '4_5', '6_6']).status(
		// 	'unavailable');
	});

	//sum total money
	function recalculateTotal(sc,$seatId) {
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
			var seat_data = JSON.stringify(seats);
			// \\\var obj = JSON.parse(data_to_send);

			if(seatNumbers.length < web_seat_count){

				var x = document.getElementById("snackbar2");
				x.className = "show";
				setTimeout(function(){
					x.className = x.className.replace("show", "");
				}, 3000);
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
					window.location.href = "http://127.0.0.1:8500/movie-ticket/web/checkout.cfm?reservId="+data;								
				},error:function(error){
					console.log(error);
				}         
			});  
			die();
		});
	};
	function toaster() {
		var x = document.getElementById("snackbar");
		x.className = "show";
		setTimeout(function(){
			window.location.href="http://127.0.0.1:8500/movie-ticket/web/ticket-booking.cfm?seatCount=<cfoutput>#seatCount#</cfoutput>&movieShowId=<cfoutput>#movieShowId#</cfoutput>";
		x.className = x.className.replace("show", "");
		},3000);
	}
</script>
<cfinclude template="../theme/web-footer.cfm"> 
	

