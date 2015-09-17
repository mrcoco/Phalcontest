$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({
         errorClass:'has-error',
        // Specify the validation rules
        rules: {
            action:{
                required:true

            }


        },
        // Specify the validation error messages
        messages: {
            action:{
                required:"Debe ingresar una acción"

            }


        },

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
