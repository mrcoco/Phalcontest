{% extends "layouts/masterpage.volt" %}
{% block head %}
{{super()}}
{{assets.outputJs('validatejs')}}
{% endblock %}
{% block content %}
{{super()}}
<div align="left" class="grid">
{{ form("city/delete", "method":"post","id":"appform") }}
<div class="row cells12">
<div class="cell colspan12">
  <h4 align="left">Esta seguro que desea eliminar esta ciudad?</h4>
  <br><hr class="control-label col-sm-12">
</div>
</div>
<br><div class="error" align="left">{{ content() }}</div><br>
<div class="grid">
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
        {{ form.label('stateid') }}
         {{ form.render('stateid',["disabled":"disabled"]) }}
      </div>
   </div>
</div>
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control full-size readonly">
       {{ form.label('city',['class': 'labelform']) }}
       {{ form.render('city',['readonly': 'true','disabled':''])}}
       <label id="cityerror" name ="cityerror" class="labelform"></label>
      </div>
   </div>
</div>
<br>
<div class="row cells2">
  <div class="cell colspan0">
    {{ link_to("city/delete/"~id,"Eliminar","class":"button") }}
 </div>
 <div class="cell colspan0">
   {{ link_to("city/list","Cancelar","class":"button") }}
</div>
</div>
</form>
</div>
{% endblock %}
