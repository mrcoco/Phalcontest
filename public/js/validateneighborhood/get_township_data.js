$(document).ready(function()
{
  var l = window.location;
  var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
  var urlpath =base_url+"/neighborhood/get_township_data/";

 $("#cityid").change(function()
 {
  var cityid = $('#cityid').val();
  $.ajax
  ({
   type: "POST",
   url: urlpath+cityid ,
   data:{"cityid":cityid},
   cache: false,
   success: function(html)
   {
      $("#townshipid").html(html);
   }
   });
  });
});
