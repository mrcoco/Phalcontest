{% extends "layouts/masterpage.volt" %}

{% block content %}
<script>
        function showDialog(id){
            var dialog = $("#"+id).data('dialog');
            if (!dialog.element.data('opened')) {
                dialog.open();
            } else {
                dialog.close();
            }
        }
    </script>
<div align="left"><h3>{{'CIUDADES'}}</h3></div>
	<hr class="thin"/>
<div class="grid">
  {{ form("city/search", "method":"post", "autocomplete" : "off") }}
 <div class="row cells2">
	 <div class="cell colspan3">
	     <label class="search" for="username">País</label>
	  <div class="input-control full-size">
	      {{ text_field("country", "size" : 30) }}
	  </div>
	</div>
 <div class="cell colspan3">
     <label class="search" for="username">Estado</label>
  <div class="input-control full-size">
      {{ text_field("state", "size" : 30) }}
  </div>
</div>
<div class="cell colspan3">
  <label class="search" for="tower">Ciudad</label>
  <div class="input-control full-size">
  {{ text_field("city", "size" : 30) }}
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
        <td>{{ link_to("city/new", image("img/new.png")) }} {{' '}}{{ 'Page '~ page.current ~"of "~page.total_pages }}</td>
      </tr>
        <tr>
					  <th class="sortable-column">País</th>
            <th class="sortable-column">Estado</th>
            <th class="sortable-column">Ciudad</th>
            <th></th>
            <th></th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for city in page.items %}
        <tr>
            <td width ="25%">{{ city.country }}</td>
            <td width ="25%">{{ city.state}}</td>
						<td width ="25%">{{ city.city}}</td>
            <td width ="5%">{{link_to('city/edit/'~city.id,image("img/edit32.png"))}}</td>

            <td width ="5%"><a href="">{{image("img/delete32.png","onclick":"showDialog('dialog1')") }}</a></td>
        </tr>

    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="left">
              <div  class="pagination">
                <span class="item">{{ link_to("city/list", "First") }}</span>
                <span class="item">{{ link_to("city/list?page="~page.before, "Previous") }}</span>

                 {% for i in 1..page.total_pages %}
                 <span class="item">{{ link_to("city/list?page="~i, i) }}</span>
                {% endfor %}
                <span class="item">{{ link_to("city/list?page="~page.next, "Next") }}</span>
                <span class="item">{{ link_to("city/list?page="~page.last, "Last") }}</span>
             </div>
            </td>
        </tr>
    </tbody>

</table>

<div style="width: auto; height: auto; display: none; left: 663.5px; top: 213.5px;" data-role="dialog" id="dialog1" class="info padding20 dialog" data-close-button="true" data-overlay="true">
            <h1>Simple dialog</h1>
            <p>
                This dialog with default overlay
            </p>
        <span class="dialog-close-button"></span></div>
{% endblock %}
