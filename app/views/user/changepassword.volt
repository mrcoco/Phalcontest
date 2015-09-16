{% extends "layouts/masterpage.volt" %}
{% block javascripts %}
{{super() }}
{{assets.outputJs('validate_forms_js')}}
{{assets.outputJs('validatejs')}}
{% endblock %}
{% block content %}
{{super()}}
{{ form("user/create", "method":"post","class":"form-horizontal","id":"appform") }}
<div class="row cells12">
<div class="cell colspan12">
  <h4>Nuevo Usuario</h4>
  <br><hr class="control-label col-sm-12">
</div>
</div>
<br><span class="error">{{ content() }}</span>
<div class="grid">
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control full-size">
       {{ form.label('password') }}
       {{ form.render('password') }}
      </div>
   </div>
</div>
<div class="row cells1">
   <div class="cell colspan3">
      <div class="input-control full-size">
       {{ form.label('confirm_password') }}
       {{ form.render('confirm_password') }}
      </div>
   </div>
</div>
<div class="row cells1">
   {{ form.render('Guardar') }}
</div>
</div>
</form>
{% endblock %}
