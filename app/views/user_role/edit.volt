{{ content() }}
{{ form("user_role/save", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("user_role", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

<div align="center">
    <h1>Edit user_role</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="userid">Userid</label>
        </td>
        <td align="left">
            {{ text_field("userid", "type" : "numeric") }}
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
        <td>{{ hidden_field("id") }}</td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
