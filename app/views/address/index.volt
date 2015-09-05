
{{ content() }}

<div align="right">
    {{ link_to("address/new", "Create address") }}
</div>

{{ form("address/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search address</h1>
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
            <label for="countryid">Countryid</label>
        </td>
        <td align="left">
            {{ text_field("countryid", "type" : "numeric") }}
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
        <td align="right">
            <label for="townshipid">Townshipid</label>
        </td>
        <td align="left">
            {{ text_field("townshipid", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="neighborhoodid">Neighborhoodid</label>
        </td>
        <td align="left">
            {{ text_field("neighborhoodid", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="stateid">Stateid</label>
        </td>
        <td align="left">
            {{ text_field("stateid", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="description">Description</label>
        </td>
        <td align="left">
            {{ text_field("description", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="address">Address</label>
        </td>
        <td align="left">
            {{ text_field("address", "size" : 30) }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
