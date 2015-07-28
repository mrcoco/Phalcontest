
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("apartment/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("apartment/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Companyid</th>
            <th>Towerid</th>
            <th>Name</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for apartment in page.items %}
        <tr>
            <td>{{ apartment.getId() }}</td>
            <td>{{ apartment.getCompanyid() }}</td>
            <td>{{ apartment.getTowerid() }}</td>
            <td>{{ apartment.getName() }}</td>
            <td>{{ link_to("apartment/edit/"~apartment.getId(), "Edit") }}</td>
            <td>{{ link_to("apartment/delete/"~apartment.getId(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("apartment/search", "First") }}</td>
                        <td>{{ link_to("apartment/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("apartment/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("apartment/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
