
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("user_role/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("user_role/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Userid</th>
            <th>Roleid</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for user_role in page.items %}
        <tr>
            <td>{{ user_role.getUserid() }}</td>
            <td>{{ user_role.getRoleid() }}</td>
            <td>{{ link_to("user_role/edit/"~user_role.getUserid(), "Edit") }}</td>
            <td>{{ link_to("user_role/delete/"~user_role.getUserid(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("user_role/search", "First") }}</td>
                        <td>{{ link_to("user_role/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("user_role/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("user_role/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
