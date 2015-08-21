{{ content() }}
{{ form("city/save", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("city", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

<div align="center">
    <h1>Edit city</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="city">City</label>
        </td>
        <td align="left">
            {{ text_field("city", "size" : 30) }}
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
            <label for="stateid">Stateid</label>
        </td>
        <td align="left">
            {{ text_field("stateid", "type" : "numeric") }}
        </td>
    </tr>

    <tr>
        <td>{{ hidden_field("id") }}</td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
