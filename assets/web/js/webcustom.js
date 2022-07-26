function onMovieBookLogin(){
    $.ajax({   
        url: "../components/webside.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"authorizeRelocation",
        },
        success:function(data) {  
            console.log("oops");
        }  
    });       
}