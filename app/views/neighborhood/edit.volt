{{ content() }}
{{ form("neighborhood/save", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("neighborhood", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

<div align="center">
    <h1>Edit neighborhood</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="neighborhood">Neighborhood</label>
        </td>
        <td align="left">
            {{ text_field("neighborhood", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="townshipid">Townshipid</label>
        </td>
        <td align="left">
            {{ text_field("townshipid", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="cityid">Cityid</label>
        </td>
        <td align="left">
            {{ text_field("cityid", "type" : "numeric") }}
        </td>
    </tr>

    <tr>
        <td>{{ hidden_field("id") }}</td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
