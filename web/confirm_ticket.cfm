<cfinclude template="../theme/web-ticket-header.cfm"> 
<cfif isDefined("url.paymentId")>
  <cfset payEncryptedId = url.paymentId>
  <cfset paymentId = ToString(ToBinary(payEncryptedId))>
</cfif>
<cfset newPayment = createObject("component","movie-ticket/components.webside")> 
<cfset confirmResults = newPayment.findTicketConfirmDetails(paymentId)>
<div id="html-content-holder">
<section class="section-content">
	<div class="fullscreen-section bg-black pvb0">
		<div class="container wpc-boxoffice pv8">
      <fieldset>
        <cfoutput>
          <h2>E-Ticket</h2>
          <div class="ticket-body">
            <div class="ticket">
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
            onclick="location.href='http://127.0.0.1:8500/movie-ticket/web/home.cfm';" />
        </cfoutput>
        <button class="btn"><a id="btn-Convert-Html2Image" href="#">Download Ticket</a></button>
      </fieldset>
    </div>
  </div>
</section>
<cfinclude template="../theme/web-footer.cfm"> 