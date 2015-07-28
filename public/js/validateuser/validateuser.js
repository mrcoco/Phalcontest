$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({
          
        // Specify the validation rules
        rules: {
            username:{
                required:true

            },
            email:{
                required:true

            }

        },
        // Specify the validation error messages
        messages: {
            username:{
                required:"You must enter a username"

            },
             email:{
                required:"You must enter an email",

            }

        },

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
