{{ content() }}
{{ form("state/save", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("state", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

<div align="center">
    <h1>Edit state</h1>
</div>

<table>
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
        <td>{{ hidden_field("id") }}</td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
