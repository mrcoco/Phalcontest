
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("action_role/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("action_role/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Actionid</th>
            <th>Roleid</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for action_role in page.items %}
        <tr>
            <td>{{ action_role.getActionid() }}</td>
            <td>{{ action_role.getRoleid() }}</td>
            <td>{{ link_to("action_role/edit/"~action_role.getActionid(), "Edit") }}</td>
            <td>{{ link_to("action_role/delete/"~action_role.getActionid(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("action_role/search", "First") }}</td>
                        <td>{{ link_to("action_role/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("action_role/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("action_role/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
