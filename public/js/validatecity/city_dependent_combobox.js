$(document).ready(function()
{
 $("#countryid").change(function()
 {
  var countryid = $('#countryid').val();
  $.ajax
  ({
   type: "POST",
   url: "get_state/"+countryid,
   data:{"countryid":countryid},
   cache: false,
   success: function(html)
   {
     
      $("#stateid").html(html);
   }
   });
  });
});
