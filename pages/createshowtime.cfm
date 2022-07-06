<cfset newInstance = createObject("component","movie-ticket/components.moviefunctions")> 
<cfset screensList = newInstance.findScreensList()> 
<div class="modal fade showtimeModal" tabindex="-1" aria-labelledby="showtimeModal" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-contente">
        <div class="modal-body">
            <div class="modal-content">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <div class="contact-list">
                    <div class="modal-container">
                        <div class="modal-head">
                        <h2><span id="modal_title"></span></h2>
                        <div id="alert"></div>
                    </div>
                    <form class="my-4" method="post" enctype="multipart/form-data" 
                        action="../components/moviefunctions.cfc?method=movieTicketCreateShowTime" name="img_form" id="formId">
                        <div class="modal-body">
                            <div class="form-control">
                                <input type="text" name ="showName" required
                                id ="show_name" placeholder="Show Name">
                                <cfoutput>
                                    <input type="hidden" name="theatreId" value="#teatreId#" id="theatreId">
                                </cfoutput>
                            </div>
                            <div class="form-control">
                                <select  class="fullWidth" name = "screen" id="screen" required> 
                                    <cfoutput>
                                      <cfloop query = screensList> 
                                           <option value="#screensList.id#">#screensList.screenName#</option> 
                                       </cfloop> 
                                    </cfoutput>
                                </select>
                            </div>
                            <div class="form-control">
                                <input type="text" name ="showStartTime" required
                                id ="show_start_time" placeholder="Show start time*">
                            </div>
                        </div>
                        <button class="btn modal-btn"
                            onclick ="return onShowTimeCreateValidate()">Submit
                        </button>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    </div>
</div>
<script>
    $('.showTime').on('click',function(){
    var showTime_id=$(this).data('id');  
    if(showTime_id>0){
        $("#modal_title").text("Edit Showtime");
        $.ajax({   
            url: "../components/moviefunctions.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"editSceenInfo",
            screen_id:screen_id              
            },
            success: function(data)
            {  
                console.log(data);
                $("#modal_title").text("Edit Screen");
                $('#screen_id').val(data.DATA[0][0]); 
                $('#screen_name').val(data.DATA[0][2]); 
                $('#silver_rate').val(data.DATA[0][3]);                                    
                $('#gold_rate').val(data.DATA[0][4]);
                $('#formId').attr('action', '../components/moviefunctions.cfc?method=movieTicketUpdateShowTime');      
            }         
        });  
    }
    else
    {    
       $("#modal_title").text("Add Screen Show Time");
       $('#show_name').val("");
       $('#screen').val("");
       $('#show_start_time').val(""); 
       $('#formId').attr('action', '../components/moviefunctions.cfc?method=movieTicketCreateShowTime'); 
    }
})

</script>
