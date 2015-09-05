
{{ form("action/create", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("action", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

{{ content() }}

<div align="center">
    <h1>Create action</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="action">Action</label>
        </td>
        <td align="left">
            {{ text_field("action", "size" : 30) }}
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
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
