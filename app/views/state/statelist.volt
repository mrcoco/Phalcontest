{% extends "layouts/masterpage.volt" %}

{% block content %}
<div align="left"><h4>{{'Estados'}}</h4></div>
	<hr class="thin"/>
<div align="left" class="grid">
  {{ form("state/search", "method":"post", "autocomplete" : "off") }}
 <div class="row cells2">
	 <div class="cell colspan3">
	     <label class="search" for="country">País</label>
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
<div class="row cells1">
  <div class="cell colspan3">
  <div align ="left">{{ submit_button("Buscar") }}</div>
</div>
</div>

</form>
</div>
<table  width="100%" align="center" class="table">
    <thead>
      <tr>
        <td>{{ link_to("state/new", image("img/new.png")) }} {{' '}}{{ 'Page '~ page.current ~"of "~page.total_pages }}</td>
      </tr>
        <tr>
					  <th class="sortable-column">País</th>
            <th class="sortable-column">Estado</th>
            <th></th>
            <th></th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for state in page.items %}
        <tr>
            <td width ="25%">{{ state.country }}</td>
            <td width ="25%">{{ state.state}}</td>
            <td width ="5%">{{link_to('state/edit/'~state.id,image("img/edit32.png"))}}</td>
            <td width ="5%">{{link_to('state/show/'~state.id,image("img/delete32.png"))}}</td>
        </tr>

    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="left">
              <div  class="pagination">
                <span class="item">{{ link_to("state/list", "First") }}</span>
                <span class="item">{{ link_to("state/list?page="~page.before, "Previous") }}</span>

                 {% for i in 1..page.total_pages %}
                 <span class="item">{{ link_to("state/list?page="~i, i) }}</span>
                {% endfor %}
                <span class="item">{{ link_to("state/list?page="~page.next, "Next") }}</span>
                <span class="item">{{ link_to("state/list?page="~page.last, "Last") }}</span>
             </div>
            </td>
        </tr>
    </tbody>

</table>

{% endblock %}
