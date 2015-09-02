{% extends "layouts/masterpage.volt" %}
{% block head %}
{{super()}}
{{assets.outputJs('validatejs')}}
{% endblock %}
{% block content %}
{{super()}}
<div align="left" class="grid">
<div class="row cells12">
<div class="cell colspan12">
  <h4 align="left">Esta seguro que desea eliminar este estado?</h4>
  <br><hr class="control-label col-sm-12">
</div>
</div>
<br><div class="error" align="left">{{ content() }}</div><br>
<div class="grid">
{{ form("state/delete/"~id, "method":"post","id":"appform") }}
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
        {{ form.label('countryid') }}
         {{ form.render('countryid',["disabled":"disabled"]) }}
      </div>
   </div>
</div>
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
        {{ form.label('state') }}
         {{ form.render('state',['readonly': 'true','disabled':'']) }}
      </div>
   </div>
</div>
<br>
<div class="row cells2">
  <div class="cell colspan0">
    {{ link_to("state/delete/"~id,"Eliminar","class":"button") }}
 </div>
 <div class="cell colspan0">
   {{ link_to("state/list","Cancelar","class":"button") }}
</div>
</div>
</form>
</div>
{% endblock %}
