$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({
      errorClass: "has-error", 
      errorPlacement: function(error, element) {
        //Custom position: first name
        if (element.attr("name") == "code" ) {
            $("#codeerror").html(error);
        }
        if (element.attr("name") == "country" ) {
            $("#countryerror").html(error);
        }

        // Default position: if no match is met (other fields)
    },
        // Specify the validation rules
        rules: {

            code:{
                required:true
            },
            country:{
                required:true

            }

        },
        // Specify the validation error messages
        messages: {
            code:{
                required:"Debe ingresar un código de País"

            },
             country:{
                required:"Debe ingresar un País"

            }

        },

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
