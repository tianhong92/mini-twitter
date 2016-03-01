//$(document).ready(function() {
// use "document.on" instead of "document.ready" because of Turbolinks
$(document).on("ready page:load", function(){
    $("#new_post").on("ajax:success", function (e, data, status, xhr) {
        $("#posts").prepend(data);
        $("#post_message").val("");
        document.getElementById("words-count").innerHTML = "140"
        //document.location.reload(true);
    }).on("ajax:error", function (e, xhr, status, error) {
        alert('tweet not saved');
    });
});

$(document).on("ready page:load", function(){
    function checkLen()
    {
        var maxChars = 140;
        if (this.value.length > maxChars) 
            this.value = this.value.substring(0,maxChars);
        var curr = maxChars - this.value.length;
        document.getElementById("words-count").innerHTML = curr.toString();
    };
    $("#post_message").on('keyup',checkLen);
});




