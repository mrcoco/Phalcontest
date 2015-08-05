<div class="well row">

	{{ content() }}
    {{ form("tower/create", "method":"post") }}

        <div class="span6 offset4">
			     {{ form.label('companyid') }}
            {{ form.render('companyid') }}
        </div>
        <div class="span6 offset4">
            {{ form.label('name') }}
            {{ form.render('name') }}
        </div>
        <div class="span6 offset4">
            {{ form.render('save') }}

		</div>
    </form>
</div>






<table width="100%">
    <tr>
        <td align="left">{{ link_to("tower", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    </tr>
</table>

{{ content() }}

<div align="center">
    <h1>Create tower</h1>
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
            <label for="companyid">Companyid</label>
        </td>
        <td align="left">
            {{ text_field("companyid", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="number">Number</label>
        </td>
        <td align="left">
            {{ text_field("number", "size" : 30) }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>

</form>
