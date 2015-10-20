$(function() {

    // Setup form validation on the #register-form element
    $("#appform").validate({
         errorClass:'has-error',
        // Specify the validation rules
        rules: {code:{required:true},parameter:{required:true},textvalue:{required:true}},
        // Specify the validation error messages
        messages: {code:{required:'systemparameter.code.required'},parameter:{required:'systemparameter.parameter.required'}
        ,textvalue:{required:'systemparameter.textvalue.required'}},

        submitHandler: function(form) {
            form.submit();
        }
    });

  });
