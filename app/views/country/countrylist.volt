{% extends "layouts/masterpage.volt" %}

{% block content %}
<script>
$(document).ready(function()
{
 $("#thasc").click(function()
 {

		 $("#thcode").removeClass();
		 $("#thcode").addClass("sortable-column sort-asc");

  });
  $("#thdesc").click(function()
  {
    $("#thcode").removeClass();
 		 $("#thcode").addClass("sortable-column sort-desc");
   });
});
</script>
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
<br>
<div align="left">{{ 'Página '~ page.current ~" de "~page.total_pages }}</div>
<br>
{% if noitems ==""%}
<table  width="100%" align="center"  class="table striped hovered sortable-markers-on-left border bordered ">
    <thead>

        <tr>
					  <th id="thcode" class="sortable-column sort-asc">
              <ul class="horizontal-menu">
      <li>{{ 'Codigo'}}</li>
      <li>
          <a href="#" class="dropdown-toggle" style="font-size: 0.8rem;"></a>
          <ul class="d-menu" data-role="dropdown">

              <li><a id ="thasc" href="#" style="font-size: 0.8rem;" >Ascendente</a></li>
              <li><a id ="thdesc" href="#" style="font-size: 0.8rem;">Descendente</a></li>
          </ul>
      </li>

  </ul>
          </th>
            <th class="" >{{ 'Pais' }}</th>
						<th>{{'Acciones'}}</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for entity in page.items %}
        <tr>
            <td width ="25%">{{ entity.code }}</td>
            <td width ="25%">{{ entity.country}}</td>
            <td width ="5%">{{link_to(editroute~entity.id,image("img/edit32.png"))}}</td>
            <td width ="5%">{{link_to(showroute~entity.id,image("img/delete32.png"))}}</td>
        </tr>

    {% endfor %}
    {% endif %}
    </tbody>
</table>
<div  class="pagination">
  {{ link_to(listroute, "Primera","class":"item") }}
	{{ link_to(listroute~"?page="~page.before, "Anterior","class":"item") }}
  {% for i in 1..page.total_pages %}
    {{ link_to(listroute~"?page="~i, i,"class":"item") }}
	{% endfor %}
	{{ link_to(listroute~"?page="~page.next, "Siguiente","class":"item") }}
	{{ link_to(listroute~"?page="~page.last, "Ultima","class":"item") }}
</div>

{% else %}
<div align="left">{{noitems}}</div>
{% endif %}

{% endblock %}
