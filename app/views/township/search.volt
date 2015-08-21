
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("township/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("township/new", "Create ") }}
        </td>
    </tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Township</th>
            <th>Cityid</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for township in page.items %}
        <tr>
            <td>{{ township.getId() }}</td>
            <td>{{ township.getTownship() }}</td>
            <td>{{ township.getCityid() }}</td>
            <td>{{ link_to("township/edit/"~township.getId(), "Edit") }}</td>
            <td>{{ link_to("township/delete/"~township.getId(), "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("township/search", "First") }}</td>
                        <td>{{ link_to("township/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("township/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("township/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>
