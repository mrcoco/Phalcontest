<!DOCTYPE html>

<html>
<head>

{% block head %}
{{assets.outputCss('headercss')}}
{{assets.outputJs('headerjs')}}
 {% endblock %}
</head>
    <body>
     {% block content %}
<br><br>
  <a href="{{ url('setlang')~'/en'}}">English</a>|<a href="{{url('setlang')~'/es'}}">Spanish</a>
     {% endblock %}

    </body>
</html>
