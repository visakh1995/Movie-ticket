<cfinclude template="../theme/web-header.cfm">  
<footer id="footer">
<div class="container footer-container">
    <div class="row">
        <div class="col-md-8">
            <div class="widget">
            <h5 class="widget-title">Update password</h5>
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
                    <div>
                        <cfoutput>
                            <cfset showMessage = ToString(ToBinary(aMessages))>
                            <p style="color:white">#showMessage#</p>
                            </div>
                        </cfoutput>
                    </div>
                </div>
            </cfif>
            <form class="contact_form transparent" method="post"
                action="../components/users.cfc?method=updateWebPassword">
                    <div class="row">
                        <div class="col-sm-12">
                            <input type="password" class="inputValidation" name="oldPassword" placeholder="Old password *">
                        </div>
                        <div class="col-sm-12">
                            <input type="password" class="inputValidation" name="newPassword" placeholder="New Password *">
                        </div>
                        <div class="col-sm-12">
                            <input type="password" class="inputValidation" name="confirmPassword" placeholder="Confirm password*">
                        </div>
                        <div class="col-sm-12 ">
                            <button type="submit" class="button fill rectangle">Update</button>
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