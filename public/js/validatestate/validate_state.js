$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({

      errorPlacement: function(error, element) {
        //Custom position: first name
        if (element.attr("name") == "state" ) {
            $("#stateerror").html(error);
        }

        // Default position: if no match is met (other fields)

    },
        // Specify the validation rules
        rules: {
            countryid:{
                required:true

            },
            state:{
                required:true
            }

        },
        // Specify the validation error messages
        messages: {
            countryid:{
                required:""

            },
             state:{
                required:"Debe ingresar un estado",

            }


        },

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
