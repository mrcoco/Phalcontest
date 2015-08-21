
{{ content() }}

<div align="right">
    {{ link_to("action_role/new", "Create action_role") }}
</div>

{{ form("action_role/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search action_role</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="actionid">Actionid</label>
        </td>
        <td align="left">
            {{ text_field("actionid", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="roleid">Roleid</label>
        </td>
        <td align="left">
            {{ text_field("roleid", "type" : "numeric") }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
