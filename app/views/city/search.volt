
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("city/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("city/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>City</th>
            <th>Countryid</th>
            <th>Stateid</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for city in page.items %}
        <tr>
            <td>{{ city.getId() }}</td>
            <td>{{ city.getCity() }}</td>
            <td>{{ city.getCountryid() }}</td>
            <td>{{ city.getStateid() }}</td>
            <td>{{ link_to("city/edit/"~city.getId(), "Edit") }}</td>
            <td>{{ link_to("city/delete/"~city.getId(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("city/search", "First") }}</td>
                        <td>{{ link_to("city/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("city/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("city/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
