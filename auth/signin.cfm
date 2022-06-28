<cfinclude template="../section/header.cfm">
<section class="movieticket">
    <div class="container grid">
        <div class="movieticket-form card flex">
            <div class="movieticket-form-fields">
                <div id="alert"></div>
                <form method="post" action="../components/moviefunctions.cfc?method=movieTicketSignin">
                    <h1><i class="fa-duotone fa-projector"></i>SIGNIN</h1>
                    <cfif isDefined("aMessages")>
                        <div class="alertClass" id="alertClass">
                            <cfoutput>
                                <span class="closebtn" onclick="closeAlertBox()">&times</span> 
                                <cfset showMessage = ToString(ToBinary(aMessages))>
                                <p>#showMessage#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <cfif isDefined("aMessageSuccess")>
                        <div class="alertSuccess" id="alertSuccess">
                            <cfoutput>
                                <span class="closebtndash" onclick="closeAlertBoxSuccess()">&times</span> 
                                <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccess))>
                                <p>#showMessageSuccess#</p>
                            </cfoutput>
                        </div>
                      </cfif>
                    <div class="form-control">
                        <input type="text" name ="username" id="username" 
                        placeholder="Username" required>
                    </div>
                    <div class="form-control">
                        <input type="password" name ="password" id="password" 
                        placeholder="Password" required>
                    </div>
                    <button class="btn btn-outline btn-login" type="submit">Signin</button>
                    <div class="movieticket-form-footer">
                    </div>
                </form>
            </div>  
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">

