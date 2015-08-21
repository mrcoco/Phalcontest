{{ content() }}
{{ form("township/save", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("township", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

<div align="center">
    <h1>Edit township</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="township">Township</label>
        </td>
        <td align="left">
            {{ text_field("township", "size" : 30) }}
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
