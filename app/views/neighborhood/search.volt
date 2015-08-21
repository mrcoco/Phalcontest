
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("neighborhood/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("neighborhood/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Neighborhood</th>
            <th>Townshipid</th>
            <th>Cityid</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for neighborhood in page.items %}
        <tr>
            <td>{{ neighborhood.getId() }}</td>
            <td>{{ neighborhood.getNeighborhood() }}</td>
            <td>{{ neighborhood.getTownshipid() }}</td>
            <td>{{ neighborhood.getCityid() }}</td>
            <td>{{ link_to("neighborhood/edit/"~neighborhood.getId(), "Edit") }}</td>
            <td>{{ link_to("neighborhood/delete/"~neighborhood.getId(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("neighborhood/search", "First") }}</td>
                        <td>{{ link_to("neighborhood/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("neighborhood/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("neighborhood/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
