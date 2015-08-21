
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("country/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("country/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Country</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for country in page.items %}
        <tr>
            <td>{{ country.getId() }}</td>
            <td>{{ country.getCountry() }}</td>
            <td>{{ link_to("country/edit/"~country.getId(), "Edit") }}</td>
            <td>{{ link_to("country/delete/"~country.getId(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("country/search", "First") }}</td>
                        <td>{{ link_to("country/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("country/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("country/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
