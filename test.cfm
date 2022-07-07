<select  class="fullWidth" name = "screen" id="screen" required> 
    <cfoutput>
<!---                                         <cfloop query = screensList> --->
<!---                                             <option value="#screensList.id#">#screensList.screenName#</option> --->
<!---                                         </cfloop> --->
    </cfoutput>
</select>

<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset screensList = newInstance.findScreensList()> 

<div class="form-control">
    <select  class="fullWidth" name = "screen" id="screen" required> 
        <cfoutput>
            <cfloop query = screensList>
                <option value="#screensList.id#">#screensList.screenName#</option> 
            </cfloop> 
        </cfoutput>
    </select>
</div>


<script>
    var hamburger = document.querySelector(".hamburger");
      hamburger.addEventListener("click", function(){
      document.querySelector("body").classList.toggle("active");
  })
</script>

<cffunction name="findScreensList" access="public" output="true">
    <cfargument name="teatreId" type="integer" >
    <cfdump var =#arguments.teatreId#>
    <cfabort>
    <cfquery name="screenList" datasource="cruddb">
        SELECT * FROM bookmyticket.moviepanel_screens 
        WHERE id = <cfqueryparam  CFSQLType="cf_sql_integer" value="#arguments.teatreId#">
    </cfquery>
    <cfreturn screenList>
</cffunction>