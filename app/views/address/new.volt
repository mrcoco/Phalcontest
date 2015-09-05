
{{ form("address/create", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("address", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

{{ content() }}

<div align="center">
    <h1>Create address</h1>
</div>

<table>
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
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
