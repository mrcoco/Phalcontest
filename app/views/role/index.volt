
{{ content() }}

<div align="right">
    {{ link_to("role/new", "Create role") }}
</div>

{{ form("role/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search role</h1>
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
            <label for="role">Role</label>
        </td>
        <td align="left">
            {{ text_field("role", "size" : 30) }}
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
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
