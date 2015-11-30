$(document).ready(function()
{
    $('#responsive').on('show.bs.modal', function(e) {

      $('#responsive').css({



            });
            $('#modalbody').css({


                  });
    });

    $("#save_address_button").click(function()
    {
      // Setup form validation on the #register-form element
      $("#modalform").validate({

        errorClass: "has-error",

          // Specify the validation rules
          rules: {
            countryid:{
                required:true

            },
            stateid:{
                required:true

            },
              cityid:{
                  required:true

              },
              townshipid:{
                  required:true
              },
              neighborhoodid:{
                  required:true
              },
              address:{
                  required:true
              }

          },
          // Specify the validation error messages
          messages: {
            countryid:{
                required:""

            },
            stateid:{
                required:""

            },
              cityid:{
                  required:""

              },
               townshipid:{
                  required:""

              },
              neighborhoodid:{
                 required:""

             },
             address:{
                required:validatemessages.address

            },


          },


          submitHandler: function(form) {

             var base_url =get_url_path();
             var address_data =JSON.stringify({
               countryid:$('#countryid').val()
               ,cityid:$('#cityid').val()
               ,stateid:$('#stateid').val()
               ,townshipid:$('#townshipid').val()
               ,neighborhoodid:$('#neighborhoodid').val()
               ,address:$('#address').val()
             });

               var description  = $('#countryid option:selected').text()
               +','+$('#stateid option:selected').text()
               +','+$('#townshipid option:selected').text()
               +','+$('#neighborhoodid option:selected').text()
               +','+$('#address').val();
               ;
               $('#addressid').val(address_data);
               $('#rest_address').val(description);
               $('#responsive').modal('hide');

               //alert(description);

            /* var urlpath =base_url+"/restaurant/create_address/"+address_data;

              $.ajax
              ({
               dataType:'json',
               type: "POST",
               url: urlpath,
               data:{"address_data":address_data},
               cache: false,
               success: function(data)
               {

                      $('#addressid').val(data.addressid);
                      $('#rest_address').val(data.description);
                      $('#responsive').modal('hide');
                },
                error: function(jqXHR, textStatus, errorThrown) {
               alert('error:'+jqXHR.status+' '+errorThrown +''+jqXHR.responseText);
               }

               });*/

              //form.submit();
          }

      });

    });

});
