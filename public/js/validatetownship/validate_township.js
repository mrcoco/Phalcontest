$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({

      errorPlacement: function(error, element) {
        //Custom position: first name
        if (element.attr("name") == "township" ) {
            $("#townshiperror").html(error);
        }

        // Default position: if no match is met (other fields)

    },
        // Specify the validation rules
        rules: {
            cityid:{
                required:true

            },
            township:{
                required:true
            }

        },
        // Specify the validation error messages
        messages: {
            cityid:{
                required:""

            },
             township:{
                required:"Debe ingresar un sector",

            }


        },

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
