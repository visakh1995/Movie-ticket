<cfinclude template="../section/header.cfm">
<section class="movieticket">
    <div class="container grid">
        <div class="movieticket-form card flex">
            <div class="movieticket-form-fields">
                <div id="alert"></div>
                <form method="post" action="../components/webside.cfc?method=UserMovieTicketSignin">
                    <h1><i class="fa-duotone fa-projector"></i>USER SIGNIN</h1>
                    <cfif isDefined("aMessages")>
                        <div class="alertClass" id="alertClass">
                            <cfoutput>
                                <span class="closebtn" onclick="closeAlertBox()">&times</span> 
                                <cfset showMessage = ToString(ToBinary(aMessages))>
                                <p>#showMessage#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <div class="form-control">
                        <input type="email" name ="email" id="email" 
                        placeholder="Email" required>
                    </div>
                    <div class="form-control">
                        <input type="password" name ="password" id="password" 
                        placeholder="Password" required>
                    </div>
                    <button class="btn btn-outline btn-login" type="submit">Signin</button>
                    <div class="movieticket-form-footer">
                    </div>
                </form>
                <p><a href="./user-signup.cfm">Signup here</a></p>
            </div>  
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">