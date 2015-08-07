<div class="well row">

	{{ content() }}
    {{ form('class': 'form-login') }}

        <div class="span6 offset4">
            <h2>Formulario de login</h2>
        </div>
        <div class="span6 offset4">
			{{ form.label('username') }}
            {{ form.render('username') }}
        </div>
        <div class="span6 offset4">
            {{ form.label('password') }}
            {{ form.render('password') }}
        </div>
        <div class="span6 offset4">
            {{ form.render('Login') }}
            {{ form.render('csrf', ['value': security.getToken()]) }}

		</div>
		{{ form.render('csrf', ['value': security.getToken()]) }}
     {{ form.messages('csrf') }}
    </form>
</div>
