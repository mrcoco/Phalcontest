{% extends "layouts/masterpage.volt" %}
{% block head %}
{{super()}}
{% endblock %}
{% block content %}
{{super()}}
<div align="left" class="grid">
<div class="row cells12">
<div class="cell colspan12">
  <h4 align="left">{{title}}</h4>
  <br><hr class="control-label col-sm-12">
</div>
</div>
<br><div class="error" align="left">{{ content() }}</div><br>
<div class="grid">
{{ form(routeform, "method":"post","id":"appform") }}
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
         {{ form.label('cityid') }}
         {{ form.render('cityid',["disabled":"disabled"]) }}
      </div>
   </div>
</div>
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
        {{ form.label('township') }}
         {{ form.render('township',['readonly': 'true','disabled':'']) }}
      </div>
   </div>
</div>
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
        {{ form.label('country') }}
         {{ form.render('country',['disabled':'']) }}
   </div>
</div>
</div>
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
        {{ form.label('state') }}
         {{ form.render('state',['disabled':'']) }}
   </div>
</div>
</div>
<br>
<div class="row cells2">
  <div class="cell colspan0">
    <button class="button">{{'Eliminar'}}</button>
 </div>
 <div class="cell colspan0">
   {{ link_to(routelist,"Cancelar","class":"button") }}
</div>
</div>
</form>
</div>
{% endblock %}
