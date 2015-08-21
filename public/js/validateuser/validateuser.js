$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({

        // Specify the validation rules
        rules: {
            username:{
                required:true

            },
            email:{
                required:true,
                email:true

            },
            password:{
                required:true

            }

        },
        // Specify the validation error messages
        messages: {
            username:{
                required:"Debe ingresar un Username"

            },
             email:{
                required:"Debe ingresar un Email",
                email:"Debe ingresar un Email válido"

            },
            password:{
                required:"Debe ingresar un Password"

            }

        },

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
