{{ content() }}
{{ form("role/save", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("role", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

<div align="center">
    <h1>Edit role</h1>
</div>

<table>
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
        <td>{{ hidden_field("id") }}</td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
