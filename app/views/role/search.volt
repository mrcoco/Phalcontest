
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("role/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("role/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Role</th>
            <th>Description</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for role in page.items %}
        <tr>
            <td>{{ role.getId() }}</td>
            <td>{{ role.getRole() }}</td>
            <td>{{ role.getDescription() }}</td>
            <td>{{ link_to("role/edit/"~role.getId(), "Edit") }}</td>
            <td>{{ link_to("role/delete/"~role.getId(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("role/search", "First") }}</td>
                        <td>{{ link_to("role/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("role/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("role/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
