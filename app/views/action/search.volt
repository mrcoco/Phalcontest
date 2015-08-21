
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("action/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("action/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Action</th>
            <th>Description</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for action in page.items %}
        <tr>
            <td>{{ action.getId() }}</td>
            <td>{{ action.getAction() }}</td>
            <td>{{ action.getDescription() }}</td>
            <td>{{ link_to("action/edit/"~action.getId(), "Edit") }}</td>
            <td>{{ link_to("action/delete/"~action.getId(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("action/search", "First") }}</td>
                        <td>{{ link_to("action/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("action/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("action/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
