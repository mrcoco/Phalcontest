{% extends "layouts/masterpage.volt" %}

{% block content %}
<h1>{{'USERS'}}</h1>
{{ form("user/search", "method":"post", "autocomplete" : "off") }}

<table>
    <tr>
        <td align="right">
            <label for="username">Username</label>
        </td>
        <td align="left">
            {{ text_field("username", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="email">Email</label>
        </td>
        <td align="left">
            {{ text_field("email", "size" : 30) }}
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
        <td>{{ link_to("user/new", image("img/new.png")) }} {{' '}}{{ 'Page '~ page.current ~"of "~page.total_pages }}</td>
      </tr>
        <tr>
            <th>Username</th>
            <th>Email</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for user in page.items %}
        <tr>
            <td>{{ user.getUsername() }}</td>
            <td>{{ user.getEmail() }}</td>
            <td>{{link_to('user/edit/'~user.getId(),image("img/edit32.png"))}}</td>

            <td>{{ link_to("user/delete/"~user.getId(),image("img/delete32.png")) }}</td>
        </tr>

    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="left">
              <ul class="pagination">
                <li>{{ link_to("user/list", "First") }}</li>
                <li>{{ link_to("user/list?page="~page.before, "Previous") }}</li>

                 {% for i in 1..page.total_pages %}
                 <li>{{ link_to("user/list?page="~i, i) }}</li>
                {% endfor %}
                <li>{{ link_to("user/list?page="~page.next, "Next") }}</li>
                <li>{{ link_to("user/list?page="~page.last, "Last") }}</li>
             </ul>
            </td>
        </tr>
    </tbody>

</table>
{% endblock %}
