{% extends "layouts/masterpage.volt" %}

{% block content %}
<h1>{{'APARTMENTS'}}</h1>
{{ form("apartment/search", "method":"post", "autocomplete" : "off") }}

<table>
    <tr>
        <td align="right">
            <label for="username">Company</label>
        </td>
        <td align="left">
            {{ text_field("company", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="tower">Tower</label>
        </td>
        <td align="left">
            {{ text_field("tower", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="number">Number</label>
        </td>
        <td align="left">
            {{ text_field("name", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>

<table  width="50%" align="center" class="table">
    <thead>
      <tr>
        <td>{{ link_to("apartment/new", image("img/new.png")) }} {{' '}}{{ 'Page '~ page.current ~"of "~page.total_pages }}</td>
      </tr>
        <tr>
            <th>Company</th>
            <th>Tower</th>
            <th>Number</th>
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
              <ul class="pagination">
                <li>{{ link_to("apartment/search", "First") }}</li>
                <li>{{ link_to("apartment/search?page="~page.before, "Previous") }}</li>

                 {% for i in 1..page.total_pages %}
                 <li>{{ link_to("apartment/search?page="~i, i) }}</li>
                {% endfor %}
                <li>{{ link_to("apartment/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("apartment/search?page="~page.last, "Last") }}</li>
             </ul>
            </td>
        </tr>
    </tbody>

</table>
{% endblock %}
