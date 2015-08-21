
{{ content() }}

<div align="right">
    {{ link_to("user_role/new", "Create user_role") }}
</div>

{{ form("user_role/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search user_role</h1>
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
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
