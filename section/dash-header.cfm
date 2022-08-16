<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="admin, dashboard">
	<meta name="author" content="DexignZone">
	<meta name="robots" content="index, follow">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Movie Ticket</title>
	<link rel="shortcut icon" type="../assets/dash/image/png" href="../assets/dash/images/favicon.png">
	<link href="../assets/dash/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
	<link rel="stylesheet" href="../assets/dash/vendor/nouislider/nouislider.min.css">
    <link href="../assets/dash/css/style.css" rel="stylesheet">
    <!--- added css --->
    <link href="../assets/dash/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/dash.css">
    <link rel="stylesheet" href="../assets/css/fewstyles.css">

</head>
<body>
    <div id="main-wrapper">
        <div class="nav-header">
            <a href="index.html" class="brand-logo"><img class="avatar-img-fav" src="../assets/dash/images/favicon.png">
                <!--- <p>MOVIE PANEL</p> --->
            </a>
            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
							<div class="dashboard_bar">
                                Dashboard 
                            </div>
                        </div>
                        <ul class="navbar-nav header-right">
                            <li class="nav-item">
								<a href="../components/moviefunctions.cfc?method=loggedOut"
                                    class="btn btn-primary d-sm-inline-block d-none">
                                    Signout
                                    <i class="las la-logout ms-3 scale5"></i>
                                </a>
							</li>
                        </ul>
                    </div>
				</nav>
			</div>
		</div>
        <div class="dlabnav">
            <div class="dlabnav-scroll">
				<ul class="metismenu" id="menu">
					<li class="dropdown header-profile">
						<a class="nav-link" href="javascript:void(0);" role="button" data-bs-toggle="dropdown">
							<img src="../assets/dash/images/profile/pic.png" width="20" alt="">
							<div class="header-info ms-3">
								<span class="font-w600 ">Hi,
                               <b><cfoutput>#Session.movieTicketCredentials.userName#</cfoutput></b></span> 
							</div>
						</a>
						<div class="dropdown-menu dropdown-menu-end">
							<a href="app-profile.html" class="dropdown-item ai-icon">
								<span class="ms-2">Profile </span>
							</a>
                            <a href="app-profile.html" class="dropdown-item ai-icon">
								<span class="ms-2">password </span>
							</a>
                            <a href="../components/moviefunctions.cfc?method=loggedOut" class="dropdown-item ai-icon">
								<span class="ms-2">signout </span>
							</a>
						</div>
					</li>
                    <li><a class="ai-icon" href="./dashboard.cfm" aria-expanded="false">
							<i class="flaticon-025-dashboard"></i>
							<span class="nav-text">Dashboard</span>
						</a>
                    </li>
                    <li><a class="ai-icon" href="./manageTheaters.cfm" aria-expanded="false">
                        <i class="flaticon-050-info"></i>
                        <span class="nav-text">Manage Theaters</span>
                        </a>
                    </li>
                    <li><a class="ai-icon" href="./manage-shows.cfm" aria-expanded="false">
                        <i class="flaticon-041-graph"></i>
                        <span class="nav-text">Manage Movies</span>
                        </a>
                    </li>
                    <li><a class="ai-icon" href="./managemovieshowtime.cfm" aria-expanded="false">
                        <i class="flaticon-045-heart"></i>
                        <span class="nav-text">Manage Shows</span>
                        </a>
                    </li>
                    <li><a class="ai-icon" href="./manage-users.cfm" aria-expanded="false">
                        <i class="flaticon-013-checkmark"></i>
                        <span class="nav-text">Manage Users</span>
                        </a>
                    </li>
                    <li><a class="ai-icon" href="./manage-booking.cfm" aria-expanded="false">
                        <i class="flaticon-013-checkmark"></i>
                        <span class="nav-text">Manage Bookings</span>
                        </a>
                    </li>
                    <li><a class="ai-icon" href="./manage-contact-info.cfm" aria-expanded="false">
                        <i class="flaticon-013-checkmark"></i>
                        <span class="nav-text">View Contact Info</span>
                        </a>
                    </li>
                    <li><a class="ai-icon" href="./updatePassword.cfm" aria-expanded="false">
                        <i class="flaticon-013-checkmark"></i>
                        <span class="nav-text">Update Password</span>
                        </a>
                    </li>
                </ul>
			</div>
        </div>
 