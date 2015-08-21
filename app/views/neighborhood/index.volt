
{{ content() }}

<div align="right">
    {{ link_to("neighborhood/new", "Create neighborhood") }}
</div>

{{ form("neighborhood/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search neighborhood</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="id">Id</label>
        </td>
        <td align="left">
            {{ text_field("id", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="neighborhood">Neighborhood</label>
        </td>
        <td align="left">
            {{ text_field("neighborhood", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="townshipid">Townshipid</label>
        </td>
        <td align="left">
            {{ text_field("townshipid", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="cityid">Cityid</label>
        </td>
        <td align="left">
            {{ text_field("cityid", "type" : "numeric") }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
