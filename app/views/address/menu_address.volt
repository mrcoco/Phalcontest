{% extends "layouts/masterpage.volt" %}

{% block content %}
<div align="left"><h4>{{'MANTENER DIRECCIONES'}}</h4></div>
	<hr class="thin"/>
<div class="grid">
  <div class="row cells4">
  <div class="cell colspan2">
  <div class="image-container bordered image-format-hd">
  <div class="frame">{{image("img/country.png") }}</div>
  {{ link_to("country/list",'<div class="image-overlay op-gray">
    <h5><b>Paises</b></h5></div>')}}
  </div>
</div>
  <div class="cell colspan2">
  <div class="image-container bordered image-format-hd">
  <div class="frame">{{image("img/city.png") }}</div>
  {{ link_to("city/list",'<div class="image-overlay op-gray">
    <h5><b>Ciudades</b></h5></div>')}}
  </div>
  </div>
  <div class="cell colspan2">
  <div class="image-container bordered image-format-hd">
  <div class="frame">{{image("img/state.png") }}</div>
  {{ link_to("state/list",'<div class="image-overlay op-gray">
    <h5><b>Estados</b></h5></div>')}}
  </div>
  </div>
  <div class="cell colspan2">
  <div class="image-container bordered image-format-hd">
  <div class="frame">{{image("img/township.png") }}</div>
  {{ link_to("township/list",'<div class="image-overlay op-gray">
    <h5><b>Sectores</b></h5></div>')}}
  </div>
  </div>
</div>
<div class="row cells4">
  <div class="cell colspan2">
  <div class="image-container bordered image-format-hd">
  <div class="frame">{{image("img/neighborhood.png") }}</div>
  {{ link_to("neighborhood/list",'<div class="image-overlay op-gray">
    <h5><b>Barrios</b></h5></div>')}}
  </div>
  </div>
	<div class="cell colspan2">
  <div class="image-container bordered image-format-hd">
  <div class="frame">{{image("img/address.png") }}</div>
  <div class="image-overlay op-gray">
    <h5><b>Direcciones</b></h5>
  </div>
  </div>
  </div>
</div>
</div>
{% endblock %}
