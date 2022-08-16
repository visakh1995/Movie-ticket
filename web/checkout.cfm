<cfinclude template="../theme/web-header.cfm">  
<cfif isDefined("url.reservId")>
    <cfset resEncryptedId = url.reservId>
    <cfset reservationId = ToString(ToBinary(resEncryptedId))>
</cfif>
<cfset newCheckout = createObject("component","movie-ticket/components.webside")> 
<cfset checkResults = newCheckout.findCheckoutDetails(reservationId)>

<section class="section-content pv12 bg-cover" data-bg-image="../assets/web/images/coming-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 page-title mt5 mb5">
                <h2 class="blog-title">Booking Summary</h2>
                <ol class="breadcrumb">
                    <li><a href="./" class="active">Home</a></li>
                    <li><a href="blog.php">Booking Summary</a></li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <cfoutput>
                    <article class="blog-item single">
                        <div class="col-md-4 col-sm12 post-image hover-dark" 
                            data-bg-image="../uploads/#checkResults.poster#"></div>
                        <div class="col-md-8 col-sm-12 col-xs-12 ph0">
                            <div class="post-content bg-cover" 
                                data-bg-image="../assets/web/images/blog/post-single.jpgs">
                                <div class="content-meta"> 
                                    <h2 class="entry-title">Payment
                                    <span></span>
                                    </h2>
                                    <div class="social-links">
                                        <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                        <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                                        <a href="javascript:;"><i class="fa fa-user"></i></a>
                                    </div>
                                </div>
                                <p class="entry-text"></p>
                                <div class="info-content">
                                    <ul class="item-info">
                                        <li><span>User Name:</span>  <p>#checkResults.userName#</p></li>
                                        <li><span>Email :</span>  <p>#checkResults.email#</p></li>
                                        <li><span>Date:</span>  <p>#DateFormat(Now())#</p></li>
                                        <li><span>Movie Name:</span>  <p>#checkResults.movieName#</p></li>
                                        <li><span>Total Amount:</span>  <p>#checkResults.totalPrice# Rs</p></li>
                                        <li><span>Release Date:</span> <p>#checkResults.releaseDate#</p></li>
                                        <li><span>Theater:</span> <p>#checkResults.theaterName#</p></li>
                                        <li><span>Screen:</span> <p>#checkResults.screenName#</p></li>
                                        <li><span>Show Time:</span> <p>#checkResults.showStartTime#</p></li>
                                        <li><span>Amount Payable:</span><p>#checkResults.totalPrice# Rs
                                        </p></li>
                                    </ul>
                                </div>                       
                                <div class="content-footer"> 
                                    <button class="btn text-right" id="rzp-button1">Pay</button>
                                </div>
                            </div>
                        </div>
                    </article>     
                    <form>
                        <input type="hidden" id="amountPayable" name="amountPayable"
                        value="#checkresults.totalPrice&00#">
                        <input type="hidden" name="reservId" id="reservId" value="#checkResults.reservId#">
                        <input type="hidden" name="amount" id="amount" value="#checkResults.totalPrice#">
                        <input type="hidden" name="movieShowId" id="movieShowId" value="#checkResults.id#">
                        <input type="hidden" name="availableSeats" id="availSeats" value="#checkResults.availableSeats#">
                        <input type="hidden" name="ticketCount" id="ticketCount" value="#checkResults.ticketCount#">
                    </form>
                </cfoutput>
            </div> 
        </div>
    </div> 
</section>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var amountPayable = document.getElementById('amountPayable').value;
var reservId = document.getElementById('reservId').value;
var amount = document.getElementById('amount').value;
var availableSeats = document.getElementById('availSeats').value;
var ticketCount = document.getElementById('ticketCount').value;
var movieShowId = document.getElementById('movieShowId').value;


var options = {
    "key": "rzp_test_q14UWXJrpEpdwq", // Enter the Key ID generated from the Dashboard
    "amount": amountPayable, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "Acme Corp",
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
    // "order_id": "order_K0OKqLeSo29gZ9",
     //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "handler": function (response){
        var paymentId = response.razorpay_payment_id;
        // alert(response.razorpay_order_id);
        // alert(response.razorpay_signature);
        $.ajax({   
            url: "../components/webside.cfc",
            type: 'post',
            dataType:"json",
            data:{
            method:"saveUserPaymentInfo",
            "amount":amount,
            "reservId":reservId,
            "paymentId":paymentId,
            "availableSeats":availableSeats,
            "ticketCount":ticketCount,
            "movieShowId":movieShowId
            },
            success: function(data){   
                console.log(data);
                window.location.href = "http://127.0.0.1:8500/movie-ticket/web/confirm_ticket.cfm?paymentId="+data;								
            },error:function(error){
                console.log(error);
            }         
        }); 
    },
    "prefill": {
        "name": "Gaurav Kumar",
        "email": "gaurav.kumar@example.com",
        "contact": "9999999999"
    },
    "notes": {
        "address": "Razorpay Corporate Office"
    },
    "theme": {
        "color": "#3399cc"
    }
};
var rzp1 = new Razorpay(options);
rzp1.on('payment.failed', function (response){
        alert(response.error.code);
        alert(response.error.description);
        alert(response.error.source);
        alert(response.error.step);
        alert(response.error.reason);
        alert(response.error.metadata.order_id);
        alert(response.error.metadata.payment_id);
});
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
</script>
<cfinclude template="../theme/web-footer.cfm"> 