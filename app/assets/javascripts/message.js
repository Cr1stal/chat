// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function () {
    function updateUser()
    {
        $.ajax({
            url:'/user/update',
            type: "post",
            success: function(data) {
                $("ol#users").html(data);
            }
        });
        setTimeout(updateUser, 20000);
    }
   setTimeout(updateUser, 20000);
  /* setTimeout( function(){
       var send_data = "live=I am alive";
       $.ajax({
           url:'/user/update',
           type: "post",
           data: send_data,
           success: function(data) {
               $("ul#users").html(data);
           }
       });
   }, 20000); */
    setInterval(function(){
        var last_date = $("ol#messages li:last span").html();
        var sendDate = "time="+last_date;
        $.ajax({
            url:'/message/refresh',
            type: "post",
            data: sendDate,
            dateType:"html",
            success: function(data) {
                console.log(data);
                $("ol#messages").append(data);
            }
        });
    }, 20000);
    $("input.button").click(function(event){
       // event.preventDefault();
        var message = $('input#field_message').val();
        var dataString = 'message='+message;
        $.ajax({
            url: "/message/create",
            type: "post",
            data: dataString,
            complete: function(){

            },
            success: function(data) {
                console.log(data)
                $("ol#messages").append(data);
                $('input#field_message').val('');
            },
            error: function(){
                alert("Please enter text.");
            }
        });
    });
});
