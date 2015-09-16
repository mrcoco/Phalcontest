$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({
         errorClass:'has-error',
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

            },
            confirm_password:{
                required:true,
                equalTo: "#password"

            }

        },
        // Specify the validation error messages
        messages: {
            username:{
                required:"Debe ingresar un username"

            },
             email:{
                required:"Debe ingresar un e-mail",
                email:"Debe ingresar un e-mail válido"

            },
            password:{
                required:"Debe ingresar un password"


            },
            confirm_password:{
                required:"Debe ingresar una confirmación de password",
                equalTo: "El password de confirmación debe ser igual al password"

            }

        },

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
