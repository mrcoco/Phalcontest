$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({
        errorClass:'has-error',
        // Specify the validation rules
        rules: {title:{required:true},author:{required:true},content:{required:true}},
        // Specify the validation error messages
        messages: {title:{required:validatemessages.title}
            ,author:{required:validatemessages.author}
            ,content:{required:validatemessages.content}},

        submitHandler: function(form) {
            form.submit();
        }
    });

});
