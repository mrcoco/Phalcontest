{% extends "layouts/masterpage.volt" %}

{% block content %}
<div align="left"><h4>{{title}}</h4></div>
<hr class="thin"/>
<div align="left" class="grid">
{{ form(searchroute, "method":"post", "autocomplete" : "off") }}
	<div class="row cells2">
		<div class="cell colspan3">
			<label class="search" for="country">Código</label>
			<div class="input-control full-size">
			{{ text_field("code", "size" : 30) }}
			</div>
		</div>
		<div class="cell colspan3">
			<label class="search" for="country">Pais</label>
			<div class="input-control full-size">
			{{ text_field("country", "size" : 30) }}
			</div>
		</div>
	</div>
	<div class="row cells1">
		<div class="cell colspan3">
		<div align ="left">{{ submit_button("Buscar") }}</div>
		</div>
	</div>
</form>
</div>

<div align="left">{{ link_to(newroute, image("img/new.png")) }}</div>
{% if noitems ==""%}
	<table class="table striped hovered sortable-markers-on-left border bordered">
	<thead>
	<tr>
	{% for index,item in headercolumns %}
		<th class="{{item['class']}}" >
		<ul class="horizontal-menu">
		<li><span class="mif-arrow-{% if order =='asc'%}up{% else %}down{%endif%}"></span>{{' '}}{{item['title']}}</li>
		<li>
		<a href="#" class="dropdown-toggle" style="font-size: 0.8rem;"></a>
		<ul class="d-menu" data-role="dropdown">
		<li>
		<a href="{{ '..'~ router.getRewriteUri() ~'?page='~page.current~'&order='~item['column_name']~' asc'}}" style="font-size: 0.8rem;">
		<span class="mif-arrow-up"></span>
		{{' Ascendente'}}
		</a>
		</li>
		<li>
		<a href="{{ '..'~ router.getRewriteUri() ~'?page='~page.current~'&order='~item['column_name']~' desc'}}" style="font-size: 0.8rem;">
		<span class="mif-arrow-down"></span>
		{{' Descendente'}}
		</a>
		</li>
		</ul>
		</li>
		</ul>
		</th>
	{% endfor %}
	<th></th>
	</tr>
	</thead>
	<tbody>
	{% if page.items is defined %}
		{% for entity in page.items %}
		<tr>
		<td width ="45%">{{ entity.code }}</td>
		<td width ="45%">{{ entity.country}}</td>
		<td width ="5%">{{link_to(editroute~entity.id,image("img/edit32.png"))}}</td>
		<td width ="5%">{{link_to(showroute~entity.id,image("img/delete32.png"))}}</td>
		</tr>
		{% endfor %}
	{% endif %}
	</tbody>
	</table>
  <div align="left">{{ 'Página '~ page.current ~" de "~page.total_pages }}</div>
	<div  class="pagination">
		{{ link_to(listroute, "Primera","class":"item") }}
		{{ link_to(listroute~"?page="~page.before, "Anterior","class":"item") }}
		{% for i in 1..page.total_pages %}
		{% if page.current == i %}
			{% set classitem ='current' %}
		{% else %}
			{% set classitem ='' %}
		{% endif %}
		{{ link_to(listroute~"?page="~i, i,"class":"item"~" "~classitem) }}
		{% endfor %}
		{{ link_to(listroute~"?page="~page.next, "Siguiente","class":"item") }}
		{{ link_to(listroute~"?page="~page.last, "Ultima","class":"item") }}
	</div>

{% else %}
	<div align="left">{{noitems}}</div>
{% endif %}
{% endblock %}
