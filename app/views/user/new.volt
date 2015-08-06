{% extends "layouts/masterpage.volt" %}
{% block head %}
{{super()}}
{{assets.outputJs('validatejs')}}
{% endblock %}

{% block content %}
{{super()}}
<br><br>
{{ form("user/create", "method":"post","class":"form-horizontal","id":"appform") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("user/list", "Go Back" ,"class":"btn btn-primary") }}</td>

    </tr>
</table>

<div class="col sm-12">
<div class="form-group">
  <h1 class="control-label col-sm-4">Create user</h1>
  <br><hr class="control-label col-sm-12"><br>
</div>
</div>

<label class="col-sm-offset-2 col-sm-12 error" style ="color:red">{{ content() }}</label>
<br>
<br>
<div class="form-group">
    <label class="control-label col-sm-2" for="username">{{"Username"|t}}</label>
    <div class="col-sm-3">
    {{ text_field("username", "size" : 30 ,"class":"form-control") }}
    </div>
 </div>
 <div class="form-group">
     <label class="control-label col-sm-2" for="username">Email</label>
     <div class="col-sm-3">
     {{ text_field("email", "size" : 30,"class":"form-control") }}
     </div>
  </div>
  <div class="form-group">
      <label class="control-label col-sm-2" for="username">{{"Password"|t}}</label>
      <div class="col-sm-3">
        {{ text_field("password", "size": 30,"class":"form-control") }}
      </div>
   </div>
   <div class="form-group">
 <div class="col-sm-offset-2 col-sm-8">
   {{ submit_button("Save","class":"btn btn-primary") }}
 </div>
 </div>
</div>


</form>
{% endblock %}
