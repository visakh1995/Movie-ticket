<cfinclude template="../theme/web-header.cfm">  
<footer id="footer">
<div class="container footer-container">
    <div class="row">
        <div class="col-md-8">
            <div class="widget">
            <h5 class="widget-title">Contact Us</h5>
            <cfif isDefined("aMessageSuccess")>
                <div>
                    <cfoutput>
                        <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccess))>
                            <p style="color:white">Success! #showMessageSuccess#</p>
                        </div>
                    </cfoutput>
                </div>
            </cfif>
            <cfif isDefined("aMessages")>
                <div>
                    <cfoutput>
                        <cfset showMessage = ToString(ToBinary(aMessages))>
                        <div class="alert alert-danger solid alert-end-icon alert-dismissible fade show">
                            <span><i class="mdi mdi-help"></i></span>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                            </button>
                            <strong>Error!</strong> #showMessage#
                        </div>
                    </cfoutput>
                </div>
            </cfif>
            <form class="contact_form transparent" method="post"
                action="../components/users.cfc?method=saveContacts">
                    <div class="row">
                        <div class="col-sm-12">
                            <input type="text" class="inputValidation" name="name" placeholder="Name *">
                        </div>
                        <div class="col-sm-12">
                            <input type="email" class="inputValidation" name="email" placeholder="Email *">
                        </div>
                        <div class="col-sm-12">
                            <input type="text" class="inputValidation" name="subject" placeholder="Subject*">
                        </div>
                        <div class="col-sm-12 ">
                            <textarea class="inputValidation" name="message" placeholder="Message *"></textarea>
                            <button type="submit" class="button fill rectangle">Send to us</button>
                        </div>
                    </div>
            </form>
            <div class="errorMessage"></div> 
            </div>
        </div>
        <div class="col-md-2 col-sm-6"></div>
        <div class="col-md-3 col-sm-6"></div>
    </div>
</div>
</footer>
<cfinclude template="../theme/web-footer.cfm">  