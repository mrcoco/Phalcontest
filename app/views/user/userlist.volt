{% extends "layouts/masterpage.volt" %}

{% block content %}
<div align="left"><h3>{{'Usuarios'}}</h3></div>
	<hr class="thin"/>
<div class="grid">
  {{ form("user/search", "method":"post", "autocomplete" : "off") }}
 <div class="row cells2">
 <div class="cell colspan3">
     <label class="search" for="username">Username</label>
  <div class="input-control full-size">
      {{ text_field("username", "size" : 30) }}
  </div>
</div>
<div class="cell colspan3">
  <label class="search" for="email">Email</label>
  <div class="input-control full-size">
  {{ text_field("email", "size" : 30) }}
</div>
</div>

</div>
<div class="row cells1">
  <div class="cell colspan3">
  <div align ="left">{{ submit_button("Search") }}</div>
</div>
</div>
</form>
</div>
<table  width="100%" align="center" class="table">
    <thead>
      <tr>
        <td>{{ link_to("user/new", image("img/new.png")) }} {{' '}}{{ 'Page '~ page.current ~"of "~page.total_pages }}</td>
      </tr>
        <tr>
            <th class="sortable-column">Username</th>
            <th class="sortable-column">Email</th>
            <th></th>
            <th></th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for user in page.items %}
        <tr>
            <td width ="25%">{{user.getUsername() }}</td>
            <td width ="25%">{{ user.getEmail()}}</td>
            <td width ="5%">{{link_to('apartment/edit/'~user.getId(),image("img/edit32.png"))}}</td>
            <td width ="5%">{{ link_to("apartment/delete/"~user.getId(),image("img/delete32.png")) }}</td>
        </tr>

    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="left">
              <div  class="pagination">
                <span class="item">{{ link_to("user/list", "First") }}</span>
                <span class="item">{{ link_to("user/list?page="~page.before, "Previous") }}</span>

                 {% for i in 1..page.total_pages %}
                 <span class="item">{{ link_to("user/list?page="~i, i) }}</span>
                {% endfor %}
                <span class="item">{{ link_to("user/list?page="~page.next, "Next") }}</span>
                <span class="item">{{ link_to("user/list?page="~page.last, "Last") }}</span>
             </div>
            </td>
        </tr>
    </tbody>

</table>
{% endblock %}
