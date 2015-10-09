{% extends "layouts/masterpage.volt" %}
{% block pagetitle %}
	<h3 class="page-title" align ="left">
	{{title|t}}
	</h3>
	<hr/>
{% endblock %}

{% block content %}
 {{content()}}

 <!-- GRID SEARCH -->
<div align="left" >
{{ form(searchroute, "method":"post", "autocomplete" : "off") }}
<div class="row">
<div class="form-group col-md-10" style="padding-left:0;">
{% for index,item in searchcolumns %}
<div class="col-md-5">
<label>{{item['title']|t}}</label>
{{ text_field(item['name'], "size" : item['size'],"class":"form-control","placeholder":"") }}
</div>
{% endfor %}
</div>
</div>
<div class="row">
<div class="form-group col-md-8">
<div class="col-md-1" align ="left" style="padding-left:0;">
{{ submit_button("Buscar"|t,"class":"btn blue") }}
</div>
</div>
</div>
</form>
</div>
 <!-- END GRID SEARCH-->
 <table class="table table-bordered table-striped table-condensed flip-content">
 <thead>
 <tr>
 <th>{{'File Name'|t}}</th>
 <th>{{'Type'|t}}</th>
 <th>{{'Size'|t}}</th>
 <th></th>
 </tr>
  </thead>
 <tbody>

 {% for index,item in file_names %}
  <tr>
 	<td width ="30%">{{item['name']}}</td>
 	<td width ="30%">{{item['type']}}</td>
	<td width ="30%">{{item['size']}} {{'MB'}}</td>
	<td>{{link_to(showroute~item['name'],'<i class="fa fa-remove"></i>','class':'btn btn-icon-only red')}}</td>
	</tr>
 {% endfor %}

 </tbody>
 </table>
{% endblock %}
