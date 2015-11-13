$(document).ready(function() {
    $("#new_post").on("ajax:success", function(e, data, status, xhr) {
        // success

        // update list of tweets with jQuery
        console.log("message to console");
        //$("#super-awesome-posts").prepend(data);
        $("#posts").prepend(data);
        //$("#content_table").prepend(data);
    }).on("ajax:error", function(e, xhr, status, error) {
        // failure
        // do something
        alert('tweet not saved');
    });

});


// Use Ajax to delete post

//function removeHook(err, data, state, xhr) {
//    $(this).closest(posts.post).fadeOut(animationTime, function() {
//        $(this).remove();
//    });
//}
//
//$(posts.del).on('ajax:success', removeHook);