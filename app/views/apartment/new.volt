{% extends "layouts/masterpage.volt" %}
{% block head %}
{{super()}}
<script type="text/javascript">
$(document).ready(function()
{
 $("#companyid").change(function()
 {

  var id=$(this).val();
  var companyid = $('#companyid').val();

  $.ajax
  ({
   type: "POST",
   url: "gettower/"+companyid,
   data:{"companyid":companyid},
   cache: false,
   success: function(html)
   {
      $("#towerid").html(html);
   }
   });
  });
});
</script>
{% endblock %}
{% block content %}
{{ form("apartment/create", "method":"post") }}




{{ content() }}

<div align="center">
    <h1>Create apartment</h1>
</div>
{{ form("apartment/create", "method":"post","class":"form-horizontal","id":"appform") }}



<table>


    <tr>
        <td align="right">
            <label for="companyid">Companyid</label>
        </td>
        <td align="left">
            {{form.render("companyid")}}

        </td>


    </tr>
    <tr>
        <td align="right">
            <label for="towerid">Towerid</label>
        </td>
        <td align="left">
            {{ form.render ("towerid") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="name">Name</label>
        </td>
        <td align="left">
            {{form.render("name")}}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
{% endblock %}
