$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({

      errorPlacement: function(error, element) {
        //Custom position: first name
        if (element.attr("name") == "neighborhood" ) {
            $("#neighborhooderror").html(error);
        }

        // Default position: if no match is met (other fields)

    },
        // Specify the validation rules
        rules: {
            cityid:{
                required:true

            },
            townshipid:{
                required:true
            },
            neighborhood:{
                required:true
            }

        },
        // Specify the validation error messages
        messages: {
            cityid:{
                required:""

            },
             townshipid:{
                required:""

            },
            neighborhood:{
               required:"Debe ingresar un barrio"

           }


        },

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
