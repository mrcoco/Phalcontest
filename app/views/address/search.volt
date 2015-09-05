
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("address/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("address/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Countryid</th>
            <th>Cityid</th>
            <th>Townshipid</th>
            <th>Neighborhoodid</th>
            <th>Stateid</th>
            <th>Description</th>
            <th>Address</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for addres in page.items %}
        <tr>
            <td>{{ addres.getId() }}</td>
            <td>{{ addres.getCountryid() }}</td>
            <td>{{ addres.getCityid() }}</td>
            <td>{{ addres.getTownshipid() }}</td>
            <td>{{ addres.getNeighborhoodid() }}</td>
            <td>{{ addres.getStateid() }}</td>
            <td>{{ addres.getDescription() }}</td>
            <td>{{ addres.getAddress() }}</td>
            <td>{{ link_to("address/edit/"~addres.getId(), "Edit") }}</td>
            <td>{{ link_to("address/delete/"~addres.getId(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("address/search", "First") }}</td>
                        <td>{{ link_to("address/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("address/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("address/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
