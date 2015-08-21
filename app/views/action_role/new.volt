
{{ form("action_role/create", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("action_role", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

{{ content() }}

<div align="center">
    <h1>Create action_role</h1>
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
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
