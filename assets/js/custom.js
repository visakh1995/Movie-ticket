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


$('.showTime').on('click',function(){
    var showTime_id=$(this).data('id');  
    if(showTime_id>0){
        $.ajax({   
            url: "../components/moviefunctions.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"editShowTimeInfo",
            showTime_id:showTime_id              
            },
            success: function(data)
            {  
                console.log(data);
                $("#modal_title_time").text("Edit Show Time");
                $('#show_id').val(data.DATA[0][0]); 
                $('#show_name').val(data.DATA[0][2]); 
                $('#screen').val(data.DATA[0][3]); 
                $('#show_start_time').val(data.DATA[0][4]);                                    
                $('#timeFormId').attr('action', '../components/moviefunctions.cfc?method=movieTicketUpdateShowTime');      
            }         
        });  
    }
    else
    {   
       $("#modal_title_time").text("Add Screen Show Time");
       $('#show_name').val("");
       $('#screen').val("");
       $('#show_start_time').val(""); 
       $('#timeFormId').attr('action', '../components/moviefunctions.cfc?method=movieTicketCreateShowTime'); 
    }
})

$('.movie').on('click',function(){
    var movie_id=$(this).data('id');  
    if(movie_id>0){
        $("#movie_modal_title").text("Edit Movie");
        $.ajax({   
            url: "../components/movies.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"editMovieInfo",
            movie_id:movie_id              
            },
            success: function(data)
            {  
                console.log(data);     
                $('#movie_id').val(data.DATA[0][0]);                  
                $('#movie_name').val(data.DATA[0][1]);
                $('[name="releaseDate"]').val(data.DATA[0][2]);
                $('[name="movieFormat"]').val(data.DATA[0][3]);                         
                $('#genre').val(data.DATA[0][4]);
                $('#language').val(data.DATA[0][5]);                        
                $('#duration').val(data.DATA[0][6]);  
                $('#trailer_url').val(data.DATA[0][7]);
                $('[name="description"]').val(data.DATA[0][10]); 
                $("#outputPoster").attr("src", "../uploads/"+data.DATA[0][8]); 
                $("#outputWallpaper").attr("src", "../uploads/"+data.DATA[0][9]); 
                $('#movieFormId').attr('action', '../components/movies.cfc?method=movieUpdateForm');
                $("#default_poster").val(data.DATA[0][8]);
                $("#default_wallpaper").val(data.DATA[0][9]);  
            }         
        });  
    }
    else
    {        
        $("#movie_modal_title").text("Add Movie");
        $('#movie_name').val("");
        $('#release_date').val("");
        $('#movie-formats').val("");        
        $('#genre').val("");
        $('#language').val("");       
        $('#duration').val("");
        $('#trailer_url').val("");
        $("#outputPoster").attr("src", ""); 
        $("#outputWallpaper").attr("src", ""); 
        $('#description').val("");
        $('#movieFormId').attr('action', '../components/movies.cfc?method=movieCreateForm'); 
    }
});
