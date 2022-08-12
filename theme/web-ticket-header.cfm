<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ticket Booking</title>

  <link rel="stylesheet" type="text/css" href="../assets/web/css/packages.min.css">
  <link rel="stylesheet" type="text/css" href="../assets/web/css/default.css">
  <link rel="stylesheet" href="../assets/web/css/web.css">


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
  <body class="sticky-menu">
    <div id="loader">
        <div class="loader-ring">
          <div class="loader-ring-light"></div>
          <div class="loader-ring-track"></div>
        </div>
    </div>
    <div class="wrapper">
        <header id="header" class="menu-top-left">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-4">
                        <a href="./" id="logo" title="mOvie" class="logo-image" 
                        data-bg-image="../assets/web/images/logos.png">mOvie 
                        </a>
                        <cfif !isDefined("Session.UserwebMovieTicketCredentials")>
                            <a href="../web/user-signup.cfm" class="btn">Signup</a>
                            <a href="../web/user-signin.cfm" class="btn">Signin</a>
                        <cfelse>
                            <a href="./web_action.cfm?urlWebSignout=webSignout" class="btn">Signout</a>
                        </cfif>
                    </div>
                    <div class="col-md-5 col-md-offset-1 col-sm-6 col-xs-8 phl0">
                        <cfif isDefined("Session.UserwebMovieTicketCredentials")>
                            <div class="header_author">
                                <a href="#"><cfoutput>#Session.UserwebMovieTicketCredentials.userName#</cfoutput></a>
                                <img src="../assets/web/images/user.png" class="user" alt="user">
                            </div>
                            <!--- <div class="header_ticket">
                                <a href="#order" class="order_btn">My tickets</a>
                                <span>3</span>
                            </div> --->
                        </cfif>
                        <div class="button_container" id="toggle">
                            <span class="top"></span>
                            <span class="middle"></span>
                            <span class="bottom"></span>
                        </div>
                        <div class="overlay" id="overlay">
                            <a href="javascript:;" class="close-window"></a>
                            <nav class="overlay-menu">
                                <ul>
                                    <li ><a href="home.cfm">Home</a></li>
                                    <li><a href="shows.cfm">Shows</a></li>
                                    <li><a href="about.cfm">About</a></li>
                                    <li><a href="contact-us.cfm">Contact</a></li>
                                </ul>
                            </nav>
                        </div>            
                    </div>
                </div>
            </div>
        </header>