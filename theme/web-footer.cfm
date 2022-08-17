<footer id="footer">
    <div class="container footer-container">
        <div class="row">
            <div class="col-md-2 col-sm-6">
                <div class="widget">
                    <h5 class="widget-title">Menu</h5>
                    <ul class="menu">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Coming soon</a></li>
                        <li><a href="#">Order</a></li>
                        <li><a href="#">Terms of service</a></li>
                        <li><a href="#">Pricing</a></li>
                    </ul>
                </div>
                <div class="widget">
                    <div class="social-links">
                        <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                        <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                        <a href="javascript:;"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h5 class="widget-title">Address information</h5>
                    <p>
                        California. AMC Dine-In Theatres Marina,
                        Street 26, Distritc 543 #108
                     </p> 
                     <p>
                        <i class="fa fa-mail"></i>Example@mail.com<br>
                        <i class="fa fa-phone"></i> + 123 456 7890
                     </p> 
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-6">
                <div class="widget">
                <h5 class="widget-title">Leave a message</h5>
                    <form class="contact_form transparent">
                        <div class="row">
                            <div class="col-sm-12">
                                <input type="text" class="" name="name" placeholder="Name *">
                            </div>
                            <div class="col-sm-12">
                                <input type="text" class="" name="email" placeholder="Email *">
                            </div>
                            <div class="col-sm-12 ">
                                <textarea class="" placeholder="Message *"></textarea>
                                <button type="button" class="button fill rectangle">Subscribe</button>
                            </div>
                        </div>
                    </form>
                    <div class="errorMessage"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="sub-footer">
        <div class="container">
            <div class="row copyright-text">
                <div class="col-sm-12 text-center">
                    <p class="mv3 mvt0">&copy; Copyrights 2017 Tenguu. All rights reserved</p>
                </div>
            </div>
        </div>
    </div>
</footer>
</div>
<!-- Overlay Search -->
<div id="overlay-search">
    <form method="get" action="./">
        <input type="text" name="s" placeholder="Search..." autocomplete="off">
        <button type="submit">
            <i class="fa fa-search"></i>
        </button>
    </form>
    <a href="javascript:;" class="close-window"></a>
</div>

<!-- Include jQuery and Scripts -->
<script src="../assets/js/jquery.min.js"></script> 
<script type="text/javascript" src="../assets/web/js/jquery.min.js"></script>
<script type="text/javascript" src="../assets/web/js/packages.min.js"></script>
<script type="text/javascript" src="../assets/web/js/scripts.min.js"></script>
<script src="../assets/web/js/webcustom.js"></script> 
<!-- jQuery easing plugin -->

<script src="../assets/web/booking/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="../assets/web/booking/js/theme-change-seat-sel.js"></script>
<script src="../assets/web/booking/js/scripts.js"></script>
<script src="../assets/web/booking2/js/html2canvas.min.js"></script>

<script>
    $(document).ready(function () {
        var element = $("#html-content-holder"); 
        var getCanvas; //global variable
        html2canvas(element, {
            onrendered: function (canvas) {
                getCanvas = canvas;
            }
        });
        $("#btn-Convert-Html2Image").on('click', function () {
            var imgageData = getCanvas.toDataURL("image/png");
            //Now browser starts downloading it instead of just showing it
            var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
            $("#btn-Convert-Html2Image").attr("download", "your_image.png").attr("href", newData);
        });
    });
  </script>

</body>
</html>