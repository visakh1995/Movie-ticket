<cfinclude template="../section/header.cfm">
<section class="movieticket">
    <div class="container grid">
        <div class="movieticket-form card flex">
            <div class="movieticket-form-fields">
                <div id="alert"></div>
                <form method="post" action="../components/webside.cfc?method=UserMovieTicketSignin">
                    <h1><i class="fa-duotone fa-projector"></i>USER SIGNIN</h1>
                    <cfif isDefined("aMessageSuccess")>
                        <div>
                            <cfoutput>
                                <cfset showMessageSuccess = ToString(ToBinary(aMessageSuccess))>
                                <div class="alert alert-primary solid alert-end-icon alert-dismissible fade show mt-3">
                                    <span><i class="mdi mdi-account-search"></i></span>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="btn-close">
                                    </button> Success! #showMessageSuccess#
                                </div>
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