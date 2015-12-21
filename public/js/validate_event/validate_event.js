$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({
         errorClass:'has-error',

        // Specify the validation rules
        rules: {
            name:{required:true},
            start_date:{required:true},
            finish_date:{required:true}

        },
        // Specify the validation error messages
        messages: {
            name:{required:validatemessages.name},
            start_date:{required:validatemessages.start_date},
            finish_date:{required:validatemessages.finish_date}

        },
        ignore: [],

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
