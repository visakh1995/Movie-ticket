<cfinclude template="../theme/web-header.cfm">  
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ticket Booking</title>
  <link rel="stylesheet" type="text/css" href="../assets/web/booking2/css/style-starter.css">
  <link rel="stylesheet" href="https://npmcdn.com/flickity@2/dist/flickity.css">
  <link rel="stylesheet" type="text/css" href="../assets/web/booking2/css/progress.css">

  <link rel="stylesheet" type="text/css" href="../assets/web/booking2/css/ticket-booking.css">

  <!-- ..............For progress-bar............... -->
  <link rel="stylesheet" type="text/css" href="../assets/web/booking2/css/e-ticket.css">

  <link rel="stylesheet" type="text/css" href="../assets/web/booking2/css/payment.css" />
  <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">
</head>

<body>
<br><br><br><br>
<cfif isDefined("url.paymentId")>
  <cfset payEncryptedId = url.paymentId>
  <cfset paymentId = ToString(ToBinary(payEncryptedId))>
</cfif>
<cfset newPayment = createObject("component","movie-ticket/components.webside")> 
<cfset confirmResults = newPayment.findTicketConfirmDetails(paymentId)>


<div class="container">
<fieldset>
  <cfoutput>
    <h2>E-Ticket</h2>
    <div class="ticket-body">
      <div class="ticket">
        <div class="holes-top"></div>
        <div class="title">
          <p class="cinema">#confirmResults.theaterName#</p>
          <p class="movie-title">#confirmResults.movieName#</p>
          <p>CONFIRMED</p>
        </div>
        <div class="poster">
          <img src="../uploads/#confirmResults.poster#"
            alt="Movie: Only God Forgives" />
        </div>
        <div class="info">
          <table class="info-table ticket-table">
            <tr>
              <th>SCREEN</th>
              <th>SHOW DATE</th>
              <th>SHOW TIME</th>
            </tr>
            <tr>
              <td class="bigger">#confirmResults.screenName#</td>
              <td class="bigger">#confirmResults.dateOfBooking#</td>
              <td class="bigger">#confirmResults.showStartTime#</td>
            </tr>
          </table>
          <table class="info-table ticket-table">
            <tr>
              <th>LANGUAGE</th>
              <th>PRINTED DATE</th>
              <th>TICKET NO</th>
            </tr>
            <tr>
              <td class="bigger">#confirmResults.language#</td>
              <td class="bigger">#dateFormat(Now())#</td>
              <td class="bigger">#confirmResults.reservId#</td>
            </tr>
          </table>
          <table class="info-table ticket-table">
            <tr>
              <th>TOTAL TICKETS</th>
              <th>TOTAL PRICE</th>
              <th>SEATS</th>
            </tr>
            <tr>
              <td>#confirmResults.ticketCount#</td>
              <td>#confirmResults.amountPayable#</td>
              
                <cfset confSeats = confirmResults.selectedSeats>
                <cfset local.confParsedData = DeserializeJSON(confSeats)>
                <cfloop index="its" from="1" to="#ArrayLen(local.confParsedData)#">
                  <cfset local.seatByPesonIn = local.confParsedData[its]>
                  <cfset seatsDetails = local.seatByPesonIn>
                  <td>#seatsDetails#</td>
                </cfloop>	
              
            </tr>
          </table>
        </div>
        <div class="holes-lower"></div>
        <div class="serial">
          <table class="barcode ticket-table">
            <tr>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
              <td style="background-color:black;"></td>
              <td style="background-color:white;"></td>
            </tr>
          </table>
          <table class="numbers ticket-table">
            <tr>
              <td>9</td>
              <td>1</td>
              <td>7</td>
              <td>3</td>
              <td>7</td>
              <td>5</td>
              <td>4</td>
              <td>4</td>
              <td>4</td>
              <td>5</td>
              <td>4</td>
              <td>1</td>
              <td>4</td>
              <td>7</td>
              <td>8</td>
              <td>7</td>
              <td>3</td>
              <td>4</td>
              <td>1</td>
              <td>4</td>
              <td>5</td>
              <td>2</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <input type="button" name="previous-step" class="home-page-btn" value="Browse to Home Page"
      onclick="location.href='index.html';" />
  </cfoutput>
  </fieldset>


</div>


</body>
<script>
  let prevId = "1";

  window.onload = function () {
    document.getElementById("screen-next-btn").disabled = true;
  }

  function timeFunction() {
    document.getElementById("screen-next-btn").disabled = false;
  }

  function myFunction(id) {
    document.getElementById(prevId).style.background = "rgb(243, 235, 235)";
    document.getElementById(id).style.background = "#df0e62";
    prevId = id;
  }
</script>

<script src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
<script type="text/javascript" src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'>
</script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src="assets/js/theme-change.js"></script>

<script type="text/javascript" src="../assets/web/booking2/js/ticket-booking.js"></script>

</html>

<cfinclude template="../theme/web-footer.cfm"> 