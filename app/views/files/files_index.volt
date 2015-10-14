{% extends "layouts/masterpage.volt" %}
{% block pagetitle %}
<h3 class="page-title" align ="left">
	{{'Mantenimiento de Archivos'|t}}
</h3>
<hr/>
{% endblock %}
{% block pagebar %}
{% endblock %}
{% block content %}
<div class="tiles">
<a href ="{{url('file/list/image')}}">
<div class="tile bg-green">
<div class="tile-body">
<i class="fa fa-file-photo-o"></i>
</div>
<div class="tile-object">
<div class="name"> {{'Imágenes'|t}} </div>
<div class="number"> </div>
</div>
</div>
</a>
<a href ="{{url('file/list/video')}}">
<div class="tile bg-green">
<div class="tile-body">
<i class="fa fa-file-video-o"></i>
</div>
<div class="tile-object">
<div class="name"> {{'Videos'|t}} </div>
<div class="number"> </div>
</div>
</div>
</a>
<a href ="{{url('file/list/document')}}">
<div class="tile bg-green">
<div class="tile-body">
<i class="fa fa-file-excel-o"></i>
</div>
<div class="tile-object">
<div class="name"> {{'Documentos'|t}} </div>
<div class="number"> </div>
</div>
</div>
</a>
<a href ="{{url('file/list/other')}}">
<div class="tile bg-green">
<div class="tile-body">
<i class="fa fa-folder-o"></i>
</div>
<div class="tile-object">
<div class="name"> {{'Otros'|t}} </div>
<div class="number"> </div>
</div>
</div>
</a>
</div>

{% endblock %}
