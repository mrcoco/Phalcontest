{% extends "layouts/masterpage.volt" %}

{% block content %}
<div align="left"><h4>{{title}}</h4></div>
	<hr class="thin"/>
<div align="left" class="grid">
  {{ form(searchroute, "method":"post", "autocomplete" : "off") }}
	<div class="row cells2">
		<div class="cell colspan3">
				<label class="search" for="country">Pais</label>
		 <div class="input-control full-size">
				 {{ text_field("country", "size" : 30) }}
		 </div>
	 </div>
	<div class="cell colspan3">
			<label class="search" for="state">Estado</label>
	 <div class="input-control full-size">
			 {{ text_field("state", "size" : 30) }}
	 </div>
	</div>
	</div>
 <div class="row cells2">
	 <div class="cell colspan3">
	     <label class="search" for="city">Ciudad</label>
	  <div class="input-control full-size">
	      {{ text_field("city", "size" : 30) }}
	  </div>
	</div>
 <div class="cell colspan3">
     <label class="search" for="township">Sector</label>
  <div class="input-control full-size">
      {{ text_field("township", "size" : 30) }}
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
<div align="left">{{ 'Page '~ page.current ~"of "~page.total_pages }}</div>
<br>
{% if noitems ==""%}
<table  width="100%" align="center"  class="table striped hovered  border bordered">
    <thead>

        <tr>
					  <th class="sortable-column">Pais</th>
            <th class="sortable-column">Estado</th>
            <th class="sortable-column">Ciudad</th>
            <th class="sortable-column">Sector</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for township in page.items %}
        <tr>
            <td width ="25%">{{ township.country }}</td>
            <td width ="25%">{{ township.state}}</td>
						<td width ="25%">{{ township.city }}</td>
            <td width ="25%">{{ township.township}}</td>
            <td width ="5%">{{link_to(editroute~township.id,image("img/edit32.png"))}}</td>
            <td width ="5%">{{link_to(showroute~township.id,image("img/delete32.png"))}}</td>
        </tr>

    {% endfor %}
    {% endif %}
    </tbody>
</table>
<div  class="pagination">
	<span class="item">{{ link_to("township/list", "First") }}</span>
	<span class="item">{{ link_to("township/list?page="~page.before, "Previous") }}</span>

	 {% for i in 1..page.total_pages %}
	 <span class="item">{{ link_to("township/list?page="~i, i) }}</span>
	{% endfor %}
	<span class="item">{{ link_to("township/list?page="~page.next, "Next") }}</span>
	<span class="item">{{ link_to("township/list?page="~page.last, "Last") }}</span>
</div>

{% else %}
<div align="left">{{noitems}}</div>
{% endif %}

{% endblock %}