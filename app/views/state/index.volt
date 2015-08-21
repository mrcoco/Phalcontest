
{{ content() }}

<div align="right">
    {{ link_to("state/new", "Create state") }}
</div>

{{ form("state/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search state</h1>
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
            <label for="state">State</label>
        </td>
        <td align="left">
            {{ text_field("state", "size" : 30) }}
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
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
