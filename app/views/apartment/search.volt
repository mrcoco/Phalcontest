{% extends "layouts/masterpage.volt" %}

{% block content %}
<div align="left"><h3>{{'APARTMENTS'}}</h3></div>
	<hr class="thin"/>
<div class="grid">
  {{ form("apartment/search", "method":"post", "autocomplete" : "off") }}
 <div class="row cells1">
 <div class="cell colspan4">
     <label for="username">Company</label>
  <div class="input-control full-size">
      {{ text_field("company", "size" : 30) }}
  </div>
</div>

</div>
 <div class="row cells1">
   <div class="cell colspan4">
     <label for="tower">Tower</label>
     <div class="input-control full-size">
     {{ text_field("tower", "size" : 30) }}
   </div>
</div>
</div>
<div class="row cells1">
  <div class="cell colspan4">
    <label for="number">Number</label>
   <div class="input-control full-size">
   {{ text_field("name", "size" : 30) }}
 </div>
  </div>
</div>
<div class="row cells1">
  <div class="cell colspan4">
  <div align ="left">{{ submit_button("Search") }}</div>
</div>
</div>

</form>
</div>
<table  width="50%" align="center" class="table">
    <thead>
      <tr>
        <td>{{ link_to("apartment/new", image("img/new.png")) }} {{' '}}{{ 'Page '~ page.current ~"of "~page.total_pages }}</td>
      </tr>
        <tr>
            <th class="sortable-column">Company</th>
            <th class="sortable-column">Tower</th>
            <th class="sortable-column">Number</th>
            <th></th>
            <th></th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for apartment in page.items %}
        <tr>
            <td>{{ apartment.company }}</td>
            <td>{{ apartment.tower}}</td>
            <td>{{ apartment.apartmentname}}</td>
            <td>{{link_to('apartment/edit/'~apartment.id,image("img/edit32.png"))}}</td>

            <td>{{ link_to("apartment/delete/"~apartment.id,image("img/delete32.png")) }}</td>
        </tr>

    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="left">
              <div  class="pagination">
                <span class="item">{{ link_to("apartment/search", "First") }}</span>
                <span class="item">{{ link_to("apartment/search?page="~page.before, "Previous") }}</span>

                 {% for i in 1..page.total_pages %}
                 <span class="item">{{ link_to("apartment/search?page="~i, i) }}</span>
                {% endfor %}
                <span class="item">{{ link_to("apartment/search?page="~page.next, "Next") }}</span>
                <span class="item">{{ link_to("apartment/search?page="~page.last, "Last") }}</span>
             </div>
            </td>
        </tr>
    </tbody>

</table>
{% endblock %}
