{% extends "layouts/masterpage.volt" %}
{% block javascripts %}
{{super() }}
{{assets.outputJs('validate_forms_js')}}
{{assets.outputJs('validatejs')}}
<script>
var validatemessages = {
categoryid:'{{"dish.category.required"|t}}'
,name:'{{"dish.name.required"}}'
,price:'{{"dish.price.required"}}'
,price_number:'{{"dish.price.number"}}'
};
</script>
{% endblock %}
{% block content %}
<div class="row">
<div class="col-md-12">
<!-- BEGIN PORTLET-->
<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
	{{title|t}}{{' - '}}{{menu_name}}
	</div>
	</div>
	<div class="portlet-body form">
	<!-- BEGIN FORM-->
	{{ form(routeform, "method":"post","id":"appform","role":"form","class":"form-horizontal") }}
	<div class="form-body">
	<!-- FORM ERROR MESSAGES-->
	{% set errorvar = content() %}
	{% if errorvar is not empty %}
	<div class="alert alert-danger">
	<button data-close="alert" class="close"></button>
	{{ content()|t}}
	</div>
	{% endif %}
		<!-- LOAD FORM CONTROLS-->
	{% for index,item in formcolumns %}
	  {% if item['name']=='image_path' %}
		<div class="form-group">
		<label name="lbllogo" id="lblloko" class="control-label col-md-3 formlabel">
			<a href="#ModalEditor" id="logourl"  data-toggle="modal" ><i class="fa fa-file-image-o"></i>
				{{' '}}{{'Image'|t}} </a>
		</label>
		<div class="col-md-2">
		{{ form.render(item['name'],["class":"form-control"]) }}
		</div>
		<div id ="logo_image" class="col-md-2">
			{% if mode =='edit' and image_path !="" %}
			<img id="theImg" src="{{url('files/images/'~image_path)}}" width="50px" heigh="50px"/>
			{% endif %}
		</div>
	</div>
		{% else %}
		<div class="form-group">
		<label name="{{item['name']}}" id ="item['name']" class="control-label col-md-3 formlabel">
		{{item['label']|t}}
		{{item['required']}}
                </label>
		<div class="col-md-4">
		{{ form.render(item['name'],["class":"form-control"]) }}
		<!-- LOAD CONTROL ERROR LABEL-->
		{{item['label_error']|t}}
		</div>
		</div>
		{% endif %}
	{% endfor %}
	</div>
	<!-- FORM ACTION BUTTONS-->
	<div class="form-actions">
	<div class="row">
	<div class="col-md-offset-2 col-md-4">
		<input type="submit" class="btn blue-madison" value="{{'Guardar'|t}}"></input>
		{{ link_to(routelist~'/'~menuid,cancel_button_name|t,"class":"btn grey-cascade") }}
	</div>
	</div>
	</div>
	</form>
	<!-- END FORM-->
	</div>
</div>
<!-- END PORTLET-->
</div>
</div>

<!-- Image Modal -->
<div id="ModalEditor" class="modal fade"  tabindex="-1" data-width="760" >
 <div class="modal-body">
 <div class="col-md-12">
 <div class="portlet box blue" >
	 <div class="portlet-title">
	 <div class="caption">{{'Images'|t}}</div>
	 </div>
	 <div class="portlet-body form" >
	 <div class="col-md-12" style="background-color:white;">
	 {% for index,item in images %}
	 <div class="col-md-1" style="padding-top:15px;">
	 <img  class="modal_hover" id ="{{item['name']}}" src="{{url('files/images/'~item['name'])}}"  height="100" width="100" onclick="selectImage(this.id);">
	 </div>
	 {% endfor %}
	 </div>
	 <br><br>
	 <div class="col-md-12" style="background-color:white; padding-left:30px;padding-top:30px;padding-bottom:30px;">
	 <button type="button" data-dismiss="modal" class="btn btn-default">{{'Close'|t}}</button>
	 </div>
	 </div>
	</div>
</div>
 </div>

</div>

{% endblock %}
