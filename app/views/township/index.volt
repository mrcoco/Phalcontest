
{{ content() }}

<div align="right">
    {{ link_to("township/new", "Create township") }}
</div>

{{ form("township/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search township</h1>
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
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
