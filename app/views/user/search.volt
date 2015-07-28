{% extends "layouts/masterpage.volt" %}

{% block content %}
<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("user", "Go Back",'class': 'button') }}
        </td>
        <td align="right">
            {{ link_to("user/new", "Create ") }}
        </td>
    </tr>
</table>

<table  width="50%" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Username</th>
            <th>Email</th>
            <th>Password</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for user in page.items %}
        <tr>
            <td>{{ user.getId() }}</td>
            <td>{{ user.getUsername() }}</td>
            <td>{{ user.getEmail() }}</td>
            <td>{{ user.getPassword() }}</td>
            <td>{{ link_to("user/edit/"~user.getId(), "Edit") }}</td>
            <td>{{ link_to("user/delete/"~user.getId(), "Delete") }}</td>
        </tr>

    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="left">
              <ul class="pagination">
                <li>{{ link_to("user/search", "First") }}</li>
                <li>{{ link_to("user/search?page="~page.before, "Previous") }}</li>

                 {% for i in 1..page.total_pages %}
                 <li>{{ link_to("user/search?page="~i, i) }}</li>
                {% endfor %}
                <li>{{ link_to("user/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("user/search?page="~page.last, "Last") }}</li>
                <li>{{ page.current ~"of "~page.total_pages }}</li>
             </ul>
            </td>
        </tr>
    </tbody>

</table>
{% endblock %}
