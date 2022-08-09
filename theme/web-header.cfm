<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <title>Movie Ticket</title>
    <meta name="keywords" content="HTML5,CSS3,HTML,Template,Themeton" >
    <meta name="description" content="Tenguu Cinema - Movie Theater Template">
    <meta name="author" content="Themeton">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/web/images/favicon.png"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300ita‌​lic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
    <link rel="stylesheet" type="text/css" href="../assets/web/css/packages.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/web/css/default.css">
    <link rel="stylesheet" href="../assets/web/css/web.css">

</head>
<cfset searchSelector = createObject("component","movie-ticket/components.webside")> 
<cfset searchResults = searchSelector.searchResults()>
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
                                <a href="#"><cfoutput>User</cfoutput></a>
                                <img src="../assets/web/images/user.png" class="user" alt="user">
                            </div>
                            <div class="header_ticket">
                                <a href="#order" class="order_btn">My tickets</a>
                                <span>3</span>
                            </div>
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

        <script>
            /* When the user clicks on the button,
            toggle between hiding and showing the dropdown content */
            function myFunction() {
              document.getElementById("myDropdown").classList.toggle("show");
            }
            
            function filterFunction() {
              var input, filter, ul, li, a, i;
              input = document.getElementById("myInput");
              filter = input.value.toUpperCase();
              div = document.getElementById("myDropdown");
              a = div.getElementsByTagName("a");
              console.log("a value", a);


            if(filter){
                alert(filter);

                    $.ajax({   
                    url: "../components/webside.cfc",
                    type: 'get',
                    dataType:"json",
                    data:{
                    method:"searchResults"
                    },
                    success: function(data){  
                        console.log(data.DATA[1][1]);
                        for(i = 0;i<data.DATA.length;i++){
                            txtValue = data.DATA[i][1];
                            console.log("filter",filter);
                            console.log(txtValue.toUpperCase().indexOf(filter));
                            if(txtValue.toUpperCase().indexOf(filter) > -1){
                                console.log("exist");
                                console.log("if exist",txtValue);
                                $("#sel_user").append("<option value=''>"+txtValue+"</option>");
                            }else{
                                console.log("not exist");
                                a[i].style.display = "none";
                            }
                        }
                    },error:function(error){
                        console.log(error);
                    }         
                });  

            }else{
                alert('hee');
            }

            }
        </script>