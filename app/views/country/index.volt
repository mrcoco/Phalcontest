
{{ content() }}

<div align="right">
    {{ link_to("country/new", "Create country") }}
</div>

{{ form("country/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search country</h1>
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
            <label for="country">Country</label>
        </td>
        <td align="left">
            {{ text_field("country", "size" : 30) }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
