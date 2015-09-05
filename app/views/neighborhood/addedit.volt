{% extends "layouts/masterpage.volt" %}
{% block head %}
{{super()}}
{{assets.outputJs('validatejs')}}
{% endblock %}
{% block content %}
{{super()}}
<div align="left" class="grid">
{{ form(routeform, "method":"post","id":"appform") }}
<div class="row cells12">
<div class="cell colspan12">
  <h4 align="left">{{title}}</h4>
  <br><hr class="control-label col-sm-12">
</div>
</div>
<div class="error" align="left">{{ content() }}</div><br>
<div class="grid">

<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
         {{ form.label('cityid') }}
         {{ form.render('cityid') }}
      </div>
   </div>
</div>
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
        {{ form.label('townshipid') }}
         {{ form.render('townshipid') }}
      </div>
   </div>
</div>
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control select full-size">
        {{ form.label('neighborhood') }}
         {{ form.render('neighborhood') }}
   </div>
   <label id ="neighborhooderror" name ="stateerror"></label>
</div>
</div>
<br>
<div class="row cells2">
  <div class="cell colspan0">
   {{ form.render('Guardar') }}
 </div>
 <div class="cell colspan0">
   {{ link_to(routelist,"Cancelar","class":"button") }}
</div>
</div>
</div>
</form>
</div>
{% endblock %}
