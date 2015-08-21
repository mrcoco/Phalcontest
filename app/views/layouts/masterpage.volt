{{globalobj.checkuser(session.get('username'))}}
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
{% block head %}
{{assets.outputCss('mastercss')}}
{{assets.outputJs('masterjs')}}
 {% endblock %}

</head>
<body>
<div class="app-bar fixed-top darcula" data-role="appbar">
        <a class="app-bar-element branding">{{image("img/restaurantlogo.png") }}Restaurant Maker</a>
        <span class="app-bar-divider"></span>
        <ul class="app-bar-menu">
            <li>
                <a href="" class="dropdown-toggle">Nuevo</a>
                <ul class="d-menu" data-role="dropdown">
                    <li><a href="">Nuevo Idioma</a></li>
                    <li><a href="">Nuevo Restaurante</a></li>
                    <li><a href="">Nuevo Menu</a></li>
                    <li><a href="">Nuevo Evento</a></li>
                </ul>
            </li>
            <li>  <a href="" class="dropdown-toggle">Seguridad</a>
                   <ul class="d-menu" data-role="dropdown">
                     <li>{{ link_to("user/list","Usuarios")}}</li>
                      <li><a href="">Roles</a></li>
                    </ul>

            <li>

        </ul>
         <a class="app-bar-element" href="{{ url('setlang')~'/en'}}">Ingles</a>
         <a class="app-bar-element" href="{{url('setlang')~'/es'}}">Español</a>
        <div class="app-bar-element place-right">
            <span class="dropdown-toggle"><span class="mif-user"></span> {{session.get('username')}}</span>
            <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px">

                <ul class="unstyled-list fg-dark">
                    <li><a href="" class="fg-white1 fg-hover-yellow">Perfil</a></li>
                    <li>{{ link_to("login/logout","Salir","class":"fg-white3 fg-hover-yellow")}}</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row" style="height: 100%">
                <div class="cell size-x200" id="cell-sidebar" style="background-color: #71b1d1; height: 100%">
                    <ul class="sidebar">

                        <li><a href="#">
                            <span class="mif-vpn-publ icon"></span>
                            <span class="title">Idiomas</span>

                        </a></li>
                        <li class="active"><a href="#">
                            <span class="mif-home icon"></span>
                            <span class="title">Restaurantes</span>

                        </a></li>
                        <li><a href="#">
                            <span class="mif-list icon"></span>
                            <span class="title">Menu</span>

                        </a></li>
                        <li><a href="#">
                            <span class="mif-star-full icon"></span>
                            <span class="title">Eventos</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-file-image icon"></span>
                            <span class="title">Multimedia</span>
                        </a></li>

                    </ul>
                </div>
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                  {% block content %}

                   {% endblock %}
                </div>
            </div>
        </div>
    </div>

</body>
</html>
