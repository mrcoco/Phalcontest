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
  <br>
  <hr class="control-label col-sm-12">
</div>
</div>
<div class="error" align="left">{{ content() }}</div><br>
<div class="grid">
	{% for index,item in formcolumns %}
<div class="{{item['div_row_class']}}">
   <div class="{{item['div_cell_class']}}">
      <div class="{{item['div_control_class']}}">
         {{ form.label(item['name']) }}
         {{ form.render(item['name']) }}
      </div>
      {{item['label_error']}}
   </div>
</div>
{% endfor %}
<br>
<div class="row cells2">
  <div class="cell colspan0">
   {{ form.render(save_button_name) }}
 </div>
 <div class="cell colspan0">
   {{ link_to(routelist,cancel_button_name,"class":"button") }}
</div>
</div>
</div>
</form>
</div>
{% endblock %}
