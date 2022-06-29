<cfinclude template="../section/dashheader.cfm">
<div class="wrapper flex">
    <div class="sidebar ">
        <div class="profile">
            <img src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg" alt="profile_picture">
            <h3>Anamika Roy</h3>
        </div>
        <div>
            <ul>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">My Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item"><a href="./manageTheaters.cfm">Manage Teatres</a></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">Manage Movies</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">Manage Shows</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">Manage Users</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">Manage Bookings</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">View Contactinfo</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">Update Password</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div>
        <section class="main-content">
            <div class="card">
                <table id="detailsTable">
                    <thead>
                        <tr>
                            <th></th>
                            <th>NAME</th>
                            <th>EMAIL</th>
                            <th>PHONE</th>
                            <th>STATUS</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <div class="modal fade exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-contente">
            <div class="modal-body">
                <div class="modal-content">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <div class="contact-list">
                        <div class="modal-container ">
                            <div class="modal-head">
                            <h2><span id="modal_title"></span></h2>
                            <div id="alert"></div>
                        </div>
                        <form class="my-4" method="post" enctype="multipart/form-data" 
                            action="" name="img_form" id="formId">
                            <h2></h2><hr>
                            <div class="modal-body">
 
                                <div class="form-control">
                                    <input type="text" name ="tName" required
                                    id ="Name" placeholder="name*">
                                </div>

                            </div>
            
                            <div class="modal-body-inclusive">


                                <div class="form-control photo">
                                    <input type="file" name ="photo" 
                                    id="photo" placeholder="Upload photo*" 
                                    accept=".jpeg,.png,.gif,.jpg" >
                                    <input type="hidden" name ="defaultPhoto" 
                                    id="defaultPhoto" placeholder="Upload photo*">
                                </div>
                            </div>
    
                            <h2>Contact Details</h2><hr>
                            <div class="modal-body">
                                <div class="form-control">
                                    <input type="email" name ="email" required
                                    id ="email" placeholder="Email*" 
                                    onclick ="return onValidateEmail()">
                                </div>
                                <div class="form-control">
                                    <input type="text" name ="phone" required
                                    id ="phone" placeholder="Phone*">
                                </div>
                                <div class="form-control">
                                    <input type="text" name ="street" required
                                    id ="street" placeholder="Street*">
                                </div>
                            </div>
            
                            <div class="modal-body">
                                <div class="form-control">
                                    <input type="text" name ="pinCode" required
                                    id ="pinCode" placeholder="Pincode*">
                                </div>
                                <div class="form-control">
                                    <input type="text" name ="address" required
                                    id ="address" placeholder="Address*">
                                </div>
                            </div>
                            <button class="btn modal-btn"
                                onclick ="return onmovieContactValidate()">Submit
                            </button>
                        </form>
                    </div>
                </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    

</div>

