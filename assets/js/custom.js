$('.teater').on('click',function(){
    var theatre_id=$(this).data('id');    
    if(theatre_id>0){
        $("#modal_title").text("Edit Theater");
        $.ajax({   
            url: "../components/moviefunctions.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"editTheaterInfo",
            theatre_id:theatre_id              
            },
            success: function(data)
            {  
                console.log(data);     
                $('#TheaterId').val(data.DATA[0][0]);                  
                $('#theatre_name').val(data.DATA[0][1]);
                $('#email').val(data.DATA[0][2]);
                $('#phone').val(data.DATA[0][3]);                         
                $('#address').val(data.DATA[0][5]);
                $('#street').val(data.DATA[0][6]);                        
                $('#pinCode').val(data.DATA[0][7]);                                                           
                $("#output").attr("src", "../uploads/"+data.DATA[0][4]);                     
                $('#formId').attr('action', '../components/moviefunctions.cfc?method=updateTheaterInfo');             
            }         
        });  
    }
    else
    {        
        $("#modal_title").text("Add Theater");
        $('#TheaterId').val("");
        $('#theatre_name').val("");
        $('#email').val("");        
        $('#address').val("");
        $('#street').val("");       
        $('#pinCode').val("");
        $("#output").attr("src", "");
        $('.email_alert').text(" ");
        $('.phone_alert').text(" ");
        $('[name="phone"]').val("");
        $('#formId').attr('action', '../components/moviefunctions.cfc?method=movieTicketCreateForm'); 
    }
});

$('.screen').on('click',function(){
    var screen_id=$(this).data('id');  
    if(screen_id>0){
        $("#modal_title").text("Edit Screen");
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
                $('#formId').attr('action', '../components/moviefunctions.cfc?method=movieTicketUpdateScreenForm');      
            }         
        });  
    }
    else
    {        
       $("#modal_title").text("Add Screen");
       $('#screen_name').val("");
       $('#gold_rate').val("");
       $('#silver_rate').val("");  
       $('#formId').attr('action', '../components/moviefunctions.cfc?method=movieTicketCreateScreenForm'); 
    }
})